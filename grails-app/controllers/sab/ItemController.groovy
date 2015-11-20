package sab

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class ItemController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Item.list(params), model:[itemCount: Item.count()]
    }

    def show(Item item) {
        respond item
    }

    def create() {
        respond new Item(params)
    }

    @Transactional
    def save(Item item) {
        if (item == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (item.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond item.errors, view:'create'
            return
        }

        if (sab.livros.Livro.get(item.livro.id)) {

            if (item.livro.disponivel) {

                item.livro.disponivel = false
                item.save flush:true

                request.withFormat {
                    form multipartForm {
                        flash.message = message(code: 'default.created.message', args: [message(code: 'item.label', default: 'Item'), item.id])
                        redirect (action: "create", controller: "item", params: ['emprestimo.id': item.emprestimo.id])
                    }
                    '*' { respond item, [status: CREATED] }
                }
            } else {
                flash.message = "$item.livro.titulo com id $params.livro.id não Está disponível"
                redirect (action: "create", controller: "item", params: ['emprestimo.id': item.emprestimo.id])
            }
        } else {
            flash.message = "Livro com id $params.livro.id não encontrado"
            redirect (action: "create", controller: "item", params: ['emprestimo.id': item.emprestimo.id])
        }
    }

    def edit(Item item) {
        respond item
    }

    @Transactional
    def update(Item item) {
        if (item == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (item.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond item.errors, view:'edit'
            return
        }

        item.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'item.label', default: 'Item'), item.id])
                redirect item
            }
            '*'{ respond item, [status: OK] }
        }
    }

    @Transactional
    def delete(Item item) {

        if (item == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        item.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'item.label', default: 'Item'), item.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'item.label', default: 'Item'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
