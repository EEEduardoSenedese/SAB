package sab.individuo

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class AnoController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Ano.list(params), model:[anoCount: Ano.count()]
    }

    def show(Ano ano) {
        respond ano
    }

    def create() {
        respond new Ano(params)
    }

    @Transactional
    def save(Ano ano) {
        if (ano == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (ano.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond ano.errors, view:'create'
            return
        }

        ano.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'ano.label', default: 'Ano'), ano.id])
                redirect ano
            }
            '*' { respond ano, [status: CREATED] }
        }
    }

    def edit(Ano ano) {
        respond ano
    }

    @Transactional
    def update(Ano ano) {
        if (ano == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (ano.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond ano.errors, view:'edit'
            return
        }

        ano.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'ano.label', default: 'Ano'), ano.id])
                redirect ano
            }
            '*'{ respond ano, [status: OK] }
        }
    }

    @Transactional
    def delete(Ano ano) {

        if (ano == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        ano.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'ano.label', default: 'Ano'), ano.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'ano.label', default: 'Ano'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
