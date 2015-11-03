package sab.endereco

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class RuaController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Rua.list(params), model:[ruaCount: Rua.count()]
    }

    def show(Rua rua) {
        respond rua
    }

    def create() {
        respond new Rua(params)
    }

    @Transactional
    def save(Rua rua) {
        if (rua == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (rua.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond rua.errors, view:'create'
            return
        }

        rua.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'rua.label', default: 'Rua'), rua.id])
                redirect rua
            }
            '*' { respond rua, [status: CREATED] }
        }
    }

    def edit(Rua rua) {
        respond rua
    }

    @Transactional
    def update(Rua rua) {
        if (rua == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (rua.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond rua.errors, view:'edit'
            return
        }

        rua.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'rua.label', default: 'Rua'), rua.id])
                redirect rua
            }
            '*'{ respond rua, [status: OK] }
        }
    }

    @Transactional
    def delete(Rua rua) {

        if (rua == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        rua.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'rua.label', default: 'Rua'), rua.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'rua.label', default: 'Rua'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
