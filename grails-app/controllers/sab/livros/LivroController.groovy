package sab.livros

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class LivroController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)

        //Se nenhum outra ordem for informada, esta será a ordem padrão
        if(!params.order && !params.sort){
            params.order = 'desc'
            params.sort = 'id'
        }

        respond Livro.list(params), model:[livroCount: Livro.count()]
    }

    def show(Livro livro) {
        respond livro
    }

    def create() {
        Livro livro = new Livro(params)
        livro.dataDeAquisicao = new Date()
        respond livro
    }

    @Transactional
    def save(Livro livro) {
        if (livro == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (livro.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond livro.errors, view:'create'
            return
        }

        Editora editora = Editora.findOrSaveByNome(livro.editora.nome)
        livro.editora = editora

        Colecao colecao = Colecao.findOrSaveByNome(livro.colecao.nome)
        livro.colecao = colecao

        if(colecao){
          livro.colecao = colecao
        } else{
          colecao = livro.colecao
          colecao.save()

          livro.colecao = colecao
        }

        livro.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'livro.label', default: 'Livro'), "$livro.id - $livro.titulo"])
                redirect controller: "AutorLivro", action: "create", params: ["livro.id": livro.id]
            }
            '*' { respond livro, [status: CREATED] }
        }
    }

    def edit(Livro livro) {
        respond livro
    }

    @Transactional
    def update(Livro livro) {
        if (livro == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (livro.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond livro.errors, view:'edit'
            return
        }

        Editora editora = Editora.findOrSaveByNome(livro.editora.nome)
        livro.editora = editora


        Colecao colecao = Colecao.findByNome(livro.colecao.nome)
        livro.colecao = colecao

        livro.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'livro.label', default: 'Livro'), "$livro.id - $livro.titulo"])
                redirect livro
            }
            '*'{ respond livro, [status: OK] }
        }
    }

    @Transactional
    def delete(Livro livro) {

        if (livro == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        livro.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'livro.label', default: 'Livro'), "$livro.id - $livro.titulo"])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    def pesquisar(){

        def livrosEncontrados = Livro.findAllByTituloLike("%$params.parametro%", [sort: 'titulo'])

        [livroList: livrosEncontrados]
    }

    def pesquisarPorId(long id){

        Livro livro = Livro.findById(id)

        if(livro){
            redirect livro
        }else{
            request.withFormat {
                form multipartForm {
                    flash.message = message(code: 'default.not.found.message', args: [message(code: 'livro.label', default: 'Livro'), "$id"])
                    redirect action:"index", method:"GET"
                }
                '*'{ render status: NO_CONTENT }
            }
        }
    }

    @Transactional
    def duplicar(Livro livro){

      if(livro == null){
          transactionStatus.setRollbackOnly()
          notFound()
          return
      }

        if (livro.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond livro.errors, view:'create'
            return
        }

      Livro copia = new Livro()
      copia.editora = livro.editora
      copia.titulo = livro.titulo
      copia.aquisicao = livro.aquisicao
      copia.data = livro.data
      copia.numeroDePaginas = livro.numeroDePaginas
      copia.categoria = livro.categoria
      copia.colecao = livro.colecao
      copia.dataDeAquisicao = livro.dataDeAquisicao
      copia.prateleira = livro.prateleira
      copia.numeroDeEmprestimos = 0;
      copia.disponivel = true


      for(autorLivroAtual in livro.autorLivro){
          copia.addToAutorLivro(new AutorLivro(autor: autorLivroAtual.autor))
      }

      for (generoLivroAtual in livro.generoLivro) {
          copia.addToGeneroLivro(new GeneroLivro(genero: generoLivroAtual.genero))
      }

      copia.save flush: true

      request.withFormat {
          form multipartForm {
              flash.message = message(code: 'default.created.message', args: [message(code: 'copia.label', default: 'Livro'), "$copia.id - $copia.titulo"])
              redirect (action: "edit", params:[id: copia.id])
          }
      }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'livro.label', default: 'Livro'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }

    def cadastroLivroDidatico(){

    }
}
