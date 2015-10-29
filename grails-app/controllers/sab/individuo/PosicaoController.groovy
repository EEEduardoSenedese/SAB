package sab.individuo

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class PosicaoController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Posicao.list(params), model:[posicaoCount: Posicao.count()]
    }

    def show(Posicao posicao) {
        respond posicao
    }

    def create() {
        respond new Posicao(params)
    }

    @Transactional
    def save(Posicao posicao) {
        if (posicao == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (posicao.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond posicao.errors, view:'create'
            return
        }

        posicao.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'posicao.label', default: 'Posicao'), posicao.id])
                redirect posicao
            }
            '*' { respond posicao, [status: CREATED] }
        }
    }

    def edit(Posicao posicao) {
        respond posicao
    }

    @Transactional
    def update(Posicao posicao) {
        if (posicao == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (posicao.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond posicao.errors, view:'edit'
            return
        }

        posicao.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'posicao.label', default: 'Posicao'), posicao.id])
                redirect posicao
            }
            '*'{ respond posicao, [status: OK] }
        }
    }

    @Transactional
    def delete(Posicao posicao) {

        if (posicao == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        posicao.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'posicao.label', default: 'Posicao'), posicao.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'posicao.label', default: 'Posicao'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
