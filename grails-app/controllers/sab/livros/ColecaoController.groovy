package sab.livros

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class ColecaoController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Colecao.list(params), model:[colecaoCount: Colecao.count()]
    }

    def show(Colecao colecao) {
        respond colecao
    }

    def create() {
        respond new Colecao(params)
    }

    @Transactional
    def save(Colecao colecao) {
        if (colecao == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (colecao.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond colecao.errors, view:'create'
            return
        }

        colecao.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'colecao.label', default: 'Colecao'), colecao.nome])
                redirect colecao
            }
            '*' { respond colecao, [status: CREATED] }
        }
    }

    def edit(Colecao colecao) {
        respond colecao
    }

    @Transactional
    def update(Colecao colecao) {
        if (colecao == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (colecao.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond colecao.errors, view:'edit'
            return
        }

        colecao.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'colecao.label', default: 'Colecao'), colecao.nome])
                redirect colecao
            }
            '*'{ respond colecao, [status: OK] }
        }
    }

    @Transactional
    def delete(Colecao colecao) {

        if (colecao == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        colecao.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'colecao.label', default: 'Colecao'), colecao.nome])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'colecao.label', default: 'Colecao'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
