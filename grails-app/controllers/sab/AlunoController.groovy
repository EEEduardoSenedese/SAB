package sab

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class AlunoController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Aluno.list(params), model:[alunoCount: Aluno.count()]
    }

    def show(Aluno aluno) {
        respond aluno
    }

    def create() {
        respond new Aluno(params)
    }

    @Transactional
    def save(Aluno aluno) {
        if (aluno == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (aluno.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond aluno.errors, view:'create'
            return
        }

        aluno.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'aluno.label', default: 'Aluno'), aluno.id])
                redirect aluno
            }
            '*' { respond aluno, [status: CREATED] }
        }
    }

    def edit(Aluno aluno) {
        respond aluno
    }

    @Transactional
    def update(Aluno aluno) {
        if (aluno == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (aluno.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond aluno.errors, view:'edit'
            return
        }

        aluno.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'aluno.label', default: 'Aluno'), aluno.id])
                redirect aluno
            }
            '*'{ respond aluno, [status: OK] }
        }
    }

    @Transactional
    def delete(Aluno aluno) {

        if (aluno == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        aluno.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'aluno.label', default: 'Aluno'), aluno.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'aluno.label', default: 'Aluno'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
