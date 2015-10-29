package sab.livros

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class AquisicaoController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        params.sort = 'nome'
        respond Aquisicao.list(params), model:[aquisicaoCount: Aquisicao.count()]
    }

    def show(Aquisicao aquisicao) {
        respond aquisicao
    }

    def create() {
        respond new Aquisicao(params)
    }

    @Transactional
    def save(Aquisicao aquisicao) {
        if (aquisicao == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (aquisicao.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond aquisicao.errors, view:'create'
            return
        }

        aquisicao.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'aquisicao.label', default: 'Aquisicao'), aquisicao.nome])
                redirect aquisicao
            }
            '*' { respond aquisicao, [status: CREATED] }
        }
    }

    def edit(Aquisicao aquisicao) {
        respond aquisicao
    }

    @Transactional
    def update(Aquisicao aquisicao) {
        if (aquisicao == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (aquisicao.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond aquisicao.errors, view:'edit'
            return
        }

        aquisicao.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'aquisicao.label', default: 'Aquisicao'), aquisicao.nome])
                redirect aquisicao
            }
            '*'{ respond aquisicao, [status: OK] }
        }
    }

    @Transactional
    def delete(Aquisicao aquisicao) {

        if (aquisicao == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        aquisicao.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'aquisicao.label', default: 'Aquisicao'), aquisicao.nome])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'aquisicao.label', default: 'Aquisicao'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
