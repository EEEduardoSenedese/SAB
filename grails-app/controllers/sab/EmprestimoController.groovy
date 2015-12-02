package sab

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import sab.individuo.Pessoa
import sab.individuo.Posicao
import sab.individuo.Sexo
import sab.endereco.*

import sab.livros.Livro

@Transactional(readOnly = true)
class EmprestimoController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        if(!params.sort && !params.order){
            params.sort = "id"
            params.order = "desc"
        }
        respond Emprestimo.list(params), model:[emprestimoCount: Emprestimo.count()]
    }

    def show(Emprestimo emprestimo) {
        respond emprestimo
    }

    def create() {
        respond new Emprestimo(params)
    }

    @Transactional
    def save(Emprestimo emprestimo) {
        if (emprestimo == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (emprestimo.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond emprestimo.errors, view:'create'
            return
        }

        emprestimo.pessoa = pessoa

        def mensagen

        if(Livro.exists(emprestimo.livro.id)){

            if(!emprestimo.livro.disponivel){
                mensagen = "Livro $emprestimo.livro.titulo id: $emprestimo.livro.id não está disponível"

            } else{

                emprestimo.livro.disponivel = false
                emprestimo.save flush:true

                mensagen = message(code: 'default.created.message', args: [message(code: 'emprestimo.label', default: 'Emprestimo'), emprestimo.id])
            }

        } else{
            mensagen = "Livro com id $params.livro.id não existe"
        }

        request.withFormat {
            form multipartForm {
                flash.message = mensagen
                redirect (controller: "emprestimo", action: "create", params: ["pessoa.nome": emprestimo.pessoa.nome, "serie.id": emprestimo.serie.id])
            }
            '*' { redirect(controller: "emprestimo", action: "create", params: ["pessoa.nome": emprestimo.pessoa.nome, "serie.id": emprestimo.serie.id])}
        }
    }

    def edit(Emprestimo emprestimo) {
        respond emprestimo
    }

    @Transactional
    def update(Emprestimo emprestimo) {
        if (emprestimo == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (emprestimo.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond emprestimo.errors, view:'edit'
            return
        }

        emprestimo.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'emprestimo.label', default: 'Emprestimo'), emprestimo.id])
                redirect emprestimo
            }
            '*'{ respond emprestimo, [status: OK] }
        }
    }

    @Transactional
    def delete(Emprestimo emprestimo) {

        if (emprestimo == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        emprestimo.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'emprestimo.label', default: 'Emprestimo'), emprestimo.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'emprestimo.label', default: 'Emprestimo'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }

    def pesquisarAluno(){

    }

    @Transactional
    def selecionarLivro(Emprestimo ultimoEmprestimo){
        //Pessoa possui atributos obrigatórios, pois isto não pode ser utilizado findOrSaveByNome()

        Emprestimo emprestimo

        if(!ultimoEmprestimo.serie){ //requisição de pesquisar aluno
            Pessoa pessoa = Pessoa.findByNome(params.pessoa.nome)

            if(!pessoa){ //Se não foi encontrado nenhuma pessoa
                pessoa = new Pessoa()

                pessoa.nome = params.pessoa.nome
                pessoa.bairro = Bairro.list(max: '1')[0] //Pega uma lista com no maximo 1 item e pega o primeiro item desta linha, ou seja, pega o priemiro item do banco de dados
                //Deste modo não é necessário buscar todos os items do banco, reduzindo sua carga
                pessoa.cidade = Cidade.list(max: '1')[0]
                pessoa.posicao = Posicao.list(max: '1')[0]
                pessoa.uf = UF.list(max: '1')[0]
                pessoa.rua = Rua.list(max: '1')[0]
                pessoa.sexo = Sexo.list(max: '1')[0]
                pessoa.numeroDaRua = 0
                pessoa.dataDeNascimento = new Date()

                pessoa.save flush: true
            }

            emprestimo = new Emprestimo()
            emprestimo.pessoa = pessoa

        } else{ //requisição de finalizarEmprestimo
            emprestimo.serie = ultimoEmprestimo.serie
            emprestimo.dataDeDevolucao = ultimoEmprestimo.dataDeDevolucao
        }

        [emprestimo: emprestimo, emprestimoList: Emprestimo.findAllByPessoaAndDevolvido(emprestimo.pessoa, false)]
    }

    @Transactional
    def finalizarEmprestimo(Emprestimo emprestimo){

        if (emprestimo == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (emprestimo.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond emprestimo.errors, view:'create'
            return
        }

        def mensagem

        if(Livro.exists(emprestimo.livro.id)){

            if(!emprestimo.livro.disponivel){
                mensagem = "Livro $emprestimo.livro.titulo id: $emprestimo.livro.id não está disponível"

            } else{

                emprestimo.livro.disponivel = false
                emprestimo.save flush:true

                mensagem = message(code: 'default.created.message', args: [message(code: 'emprestimo.label', default: 'Emprestimo'), emprestimo.id])
            }

        } else{
            mensagem = "Livro com id $params.livro.id não existe"
        }

        Emprestimo novoEmprestimo = new Emprestimo(
            pessoa: emprestimo.pessoa,
            serie: emprestimo.serie,
            dataDeDevolucao: emprestimo.dataDeDevolucao,
            dataDeEmprestimo: emprestimo.dataDeEmprestimo
        )

        request.withFormat {
            form multipartForm {
                flash.message = mensagem
                render (view: 'selecionarLivro', model: ["emprestimo": novoEmprestimo, emprestimoList: Emprestimo.findAllByPessoaAndDevolvido(emprestimo.pessoa, false)])
            }
            '*' { respond emprestimo, status[CREATED] }
        }
    }

    def pesquisarLivro(long id){

        Livro livro = Livro.get(id)

        if(livro){
            Emprestimo emprestimo = Emprestimo.findByLivroAndDevolvido(livro, false)
        }
    }

    def devolver(Emprestimo emprestimo){
        println emprestimo
    }
}
