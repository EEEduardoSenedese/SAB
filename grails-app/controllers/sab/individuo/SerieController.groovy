package sab.individuo

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class SerieController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Serie.list(params), model:[serieCount: Serie.count()]
    }

    def show(Serie serie) {
        respond serie
    }

    def create() {
        respond new Serie(params)
    }

    @Transactional
    def save(Serie serie) {
        if (serie == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (serie.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond serie.errors, view:'create'
            return
        }

        serie.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'serie.label', default: 'Serie'), serie.id])
                redirect serie
            }
            '*' { respond serie, [status: CREATED] }
        }
    }

    def edit(Serie serie) {
        respond serie
    }

    @Transactional
    def update(Serie serie) {
        if (serie == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (serie.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond serie.errors, view:'edit'
            return
        }

        serie.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'serie.label', default: 'Serie'), serie.id])
                redirect serie
            }
            '*'{ respond serie, [status: OK] }
        }
    }

    @Transactional
    def delete(Serie serie) {

        if (serie == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        serie.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'serie.label', default: 'Serie'), serie.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'serie.label', default: 'Serie'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
