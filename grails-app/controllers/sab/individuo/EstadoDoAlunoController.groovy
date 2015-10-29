package sab.individuo

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class EstadoDoAlunoController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond EstadoDoAluno.list(params), model:[estadoDoAlunoCount: EstadoDoAluno.count()]
    }

    def show(EstadoDoAluno estadoDoAluno) {
        respond estadoDoAluno
    }

    def create() {
        respond new EstadoDoAluno(params)
    }

    @Transactional
    def save(EstadoDoAluno estadoDoAluno) {
        if (estadoDoAluno == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (estadoDoAluno.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond estadoDoAluno.errors, view:'create'
            return
        }

        estadoDoAluno.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'estadoDoAluno.label', default: 'EstadoDoAluno'), estadoDoAluno.id])
                redirect estadoDoAluno
            }
            '*' { respond estadoDoAluno, [status: CREATED] }
        }
    }

    def edit(EstadoDoAluno estadoDoAluno) {
        respond estadoDoAluno
    }

    @Transactional
    def update(EstadoDoAluno estadoDoAluno) {
        if (estadoDoAluno == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (estadoDoAluno.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond estadoDoAluno.errors, view:'edit'
            return
        }

        estadoDoAluno.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'estadoDoAluno.label', default: 'EstadoDoAluno'), estadoDoAluno.id])
                redirect estadoDoAluno
            }
            '*'{ respond estadoDoAluno, [status: OK] }
        }
    }

    @Transactional
    def delete(EstadoDoAluno estadoDoAluno) {

        if (estadoDoAluno == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        estadoDoAluno.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'estadoDoAluno.label', default: 'EstadoDoAluno'), estadoDoAluno.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'estadoDoAluno.label', default: 'EstadoDoAluno'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
