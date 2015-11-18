package sab.livros

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class PrateleiraController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Prateleira.list(params), model:[prateleiraCount: Prateleira.count()]
    }

    def show(Prateleira prateleira) {
        respond prateleira
    }

    def create() {
        respond new Prateleira(params)
    }

    @Transactional
    def save(Prateleira prateleira) {
        if (prateleira == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (prateleira.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond prateleira.errors, view:'create'
            return
        }

        prateleira.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'prateleira.label', default: 'Prateleira'), prateleira.id])
                redirect prateleira
            }
            '*' { respond prateleira, [status: CREATED] }
        }
    }

    def edit(Prateleira prateleira) {
        respond prateleira
    }

    @Transactional
    def update(Prateleira prateleira) {
        if (prateleira == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (prateleira.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond prateleira.errors, view:'edit'
            return
        }

        prateleira.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'prateleira.label', default: 'Prateleira'), prateleira.id])
                redirect prateleira
            }
            '*'{ respond prateleira, [status: OK] }
        }
    }

    @Transactional
    def delete(Prateleira prateleira) {

        if (prateleira == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        prateleira.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'prateleira.label', default: 'Prateleira'), prateleira.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'prateleira.label', default: 'Prateleira'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
