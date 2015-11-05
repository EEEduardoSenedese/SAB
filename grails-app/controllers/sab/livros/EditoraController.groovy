package sab.livros

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import grails.converters.JSON

@Transactional(readOnly = true)
class EditoraController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        params.sort = 'nome'
        respond Editora.list(params), model:[editoraCount: Editora.count()]
    }

    def show(Editora editora) {
        respond editora
    }

    def create() {
        respond new Editora(params)
    }

    @Transactional
    def save(Editora editora) {
        if (editora == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (editora.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond editora.errors, view:'create'
            return
        }

        editora.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'editora.label', default: 'Editora'), editora.nome])
                redirect editora
            }
            '*' { respond editora, [status: CREATED] }
        }
    }

    def edit(Editora editora) {
        respond editora
    }

    @Transactional
    def update(Editora editora) {
        if (editora == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (editora.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond editora.errors, view:'edit'
            return
        }

        editora.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'editora.label', default: 'Editora'), editora.nome])
                redirect editora
            }
            '*'{ respond editora, [status: OK] }
        }
    }

    @Transactional
    def delete(Editora editora) {

        if (editora == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        editora.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'editora.label', default: 'Editora'), editora.nome])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'editora.label', default: 'Editora'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }

    def pesquisar(){

        def aditoraEncontrada = Editora.findAllByNomeLike("$params.parametro%", [sort: 'nome'])

        [editoraList: aditoraEncontrada]
    }

    def listagem(){
      def editoras = Editora.list()
      def resposta = []

      editoras.each{
        resposta << "${it.nome}"
      }

      render resposta as JSON
    }
}
