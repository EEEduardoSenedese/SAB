package sab.endereco

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class BairroController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Bairro.list(params), model:[bairroCount: Bairro.count()]
    }

    def show(Bairro bairro) {
        respond bairro
    }

    def create() {
        respond new Bairro(params)
    }

    @Transactional
    def save(Bairro bairro) {
        if (bairro == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (bairro.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond bairro.errors, view:'create'
            return
        }

        bairro.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'bairro.label', default: 'Bairro'), bairro.id])
                redirect bairro
            }
            '*' { respond bairro, [status: CREATED] }
        }
    }

    def edit(Bairro bairro) {
        respond bairro
    }

    @Transactional
    def update(Bairro bairro) {
        if (bairro == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (bairro.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond bairro.errors, view:'edit'
            return
        }

        bairro.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'bairro.label', default: 'Bairro'), bairro.id])
                redirect bairro
            }
            '*'{ respond bairro, [status: OK] }
        }
    }

    @Transactional
    def delete(Bairro bairro) {

        if (bairro == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        bairro.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'bairro.label', default: 'Bairro'), bairro.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'bairro.label', default: 'Bairro'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
