package sab.endereco

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class UFController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond UF.list(params), model:[UFCount: UF.count()]
    }

    def show(UF UF) {
        respond UF
    }

    def create() {
        respond new UF(params)
    }

    @Transactional
    def save(UF UF) {
        if (UF == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (UF.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond UF.errors, view:'create'
            return
        }

        UF.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'UF.label', default: 'UF'), UF.id])
                redirect UF
            }
            '*' { respond UF, [status: CREATED] }
        }
    }

    def edit(UF UF) {
        respond UF
    }

    @Transactional
    def update(UF UF) {
        if (UF == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (UF.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond UF.errors, view:'edit'
            return
        }

        UF.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'UF.label', default: 'UF'), UF.id])
                redirect UF
            }
            '*'{ respond UF, [status: OK] }
        }
    }

    @Transactional
    def delete(UF UF) {

        if (UF == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        UF.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'UF.label', default: 'UF'), UF.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'UF.label', default: 'UF'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
