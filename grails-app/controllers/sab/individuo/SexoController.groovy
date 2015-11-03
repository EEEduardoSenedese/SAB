package sab.individuo

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class SexoController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Sexo.list(params), model:[sexoCount: Sexo.count()]
    }

    def show(Sexo sexo) {
        respond sexo
    }

    def create() {
        respond new Sexo(params)
    }

    @Transactional
    def save(Sexo sexo) {
        if (sexo == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (sexo.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond sexo.errors, view:'create'
            return
        }

        sexo.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'sexo.label', default: 'Sexo'), sexo.id])
                redirect sexo
            }
            '*' { respond sexo, [status: CREATED] }
        }
    }

    def edit(Sexo sexo) {
        respond sexo
    }

    @Transactional
    def update(Sexo sexo) {
        if (sexo == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (sexo.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond sexo.errors, view:'edit'
            return
        }

        sexo.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'sexo.label', default: 'Sexo'), sexo.id])
                redirect sexo
            }
            '*'{ respond sexo, [status: OK] }
        }
    }

    @Transactional
    def delete(Sexo sexo) {

        if (sexo == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        sexo.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'sexo.label', default: 'Sexo'), sexo.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'sexo.label', default: 'Sexo'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
