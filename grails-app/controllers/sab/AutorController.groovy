package sab

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class AutorController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max, String sort) {
        params.max = Math.min(max ?: 10, 100)
        params.sort = 'nome'
        respond Autor.list(params), model:[autorCount: Autor.count()]
    }

    def show(Autor autor) {
        respond autor
    }

    def create() {
        respond new Autor(params)
    }

    @Transactional
    def save(Autor autor) {
        if (autor == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (autor.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond autor.errors, view:'create'
            return
        }

        autor.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'autor.label', default: 'Autor'), autor.nome])
                redirect autor
            }
            '*' { respond autor, [status: CREATED] }
        }
    }

    def edit(Autor autor) {
        respond autor
    }

    @Transactional
    def update(Autor autor) {
        if (autor == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (autor.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond autor.errors, view:'edit'
            return
        }

        autor.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'autor.label', default: 'Autor'), autor.nome])
                redirect autor
            }
            '*'{ respond autor, [status: OK] }
        }
    }

    @Transactional
    def delete(Autor autor) {

        if (autor == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        autor.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'autor.label', default: 'Autor'), autor.nome])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'autor.label', default: 'Autor'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }

    def pesquisar(){

        def autorEncontrados = Autor.findAllByNomeLike("$params.parametro%", [sort: 'nome'])

        [autorList: autorEncontrados]
    }
}
