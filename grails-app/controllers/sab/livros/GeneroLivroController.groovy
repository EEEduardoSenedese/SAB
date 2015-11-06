package sab.livros

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class GeneroLivroController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond GeneroLivro.list(params), model:[generoLivroCount: GeneroLivro.count()]
    }

    def show(GeneroLivro generoLivro) {
        respond generoLivro
    }

    def create() {

        //println sab.Genero.findAllBy

        def generoLivroList = GeneroLivro.withCriteria {
            livro{
                eq 'id', params.long('livro.id')
            }
        }

        respond new GeneroLivro(params), model:[generoLivroList: generoLivroList]
    }

    @Transactional
    def save(GeneroLivro generoLivro) {
        if (generoLivro == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (generoLivro.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond generoLivro.errors, view:'create'
            return
        }

        Genero genero = Genero.findByNome(generoLivro.genero.nome)

        if (genero){
          generoLivro.genero = genero
        } else{
          genero = generoLivro.genero
          genero.save()

          generoLivro.genero = genero
        }

        generoLivro.save flush:true
        
        redirect (action:"create", params:['livro.id':generoLivro.livro.id])
    }

    def edit(GeneroLivro generoLivro) {
        respond generoLivro
    }

    @Transactional
    def update(GeneroLivro generoLivro) {
        if (generoLivro == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (generoLivro.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond generoLivro.errors, view:'edit'
            return
        }

        generoLivro.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'generoLivro.label', default: 'GeneroLivro'), generoLivro.id])
                redirect generoLivro
            }
            '*'{ respond generoLivro, [status: OK] }
        }
    }

    @Transactional
    def delete(GeneroLivro generoLivro) {

        if (generoLivro == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        generoLivro.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'generoLivro.label', default: 'GeneroLivro'), generoLivro.id])
                redirect (controller: "GeneroLivro", action: "create", params:['livro.id': generoLivro.livro.id])
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'generoLivro.label', default: 'GeneroLivro'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
