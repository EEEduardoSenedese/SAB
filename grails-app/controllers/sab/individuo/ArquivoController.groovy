package sab.individuo

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class ArquivoController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Arquivo.list(params), model:[arquivoCount: Arquivo.count()]
    }

    def show(Arquivo arquivo) {
        respond arquivo
    }

    def create() {
        respond new Arquivo(params)
    }

    @Transactional
    def save(Arquivo arquivo) {
        if (arquivo == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (arquivo.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond arquivo.errors, view:'create'
            return
        }

        arquivo.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'arquivo.label', default: 'Arquivo'), arquivo.id])
                redirect arquivo
            }
            '*' { respond arquivo, [status: CREATED] }
        }
    }

    def edit(Arquivo arquivo) {
        respond arquivo
    }

    @Transactional
    def update(Arquivo arquivo) {
        if (arquivo == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (arquivo.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond arquivo.errors, view:'edit'
            return
        }

        arquivo.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'arquivo.label', default: 'Arquivo'), arquivo.id])
                redirect arquivo
            }
            '*'{ respond arquivo, [status: OK] }
        }
    }

    @Transactional
    def delete(Arquivo arquivo) {

        if (arquivo == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        arquivo.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'arquivo.label', default: 'Arquivo'), arquivo.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'arquivo.label', default: 'Arquivo'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
