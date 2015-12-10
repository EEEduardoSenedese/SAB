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
                redirect (controller: "emprestimo", action: "create", params: ["pessoa.nome": emprestimo.pessoa.nome, "ano.id": emprestimo.ano.id])
            }
            '*' { redirect(controller: "emprestimo", action: "create", params: ["pessoa.nome": emprestimo.pessoa.nome, "ano.id": emprestimo.ano.id])}
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

        emprestimo.livro.disponivel = true

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
    def selecionarLivro(){

        Emprestimo emprestimo

        Pessoa pessoa = Pessoa.findByNome(params.pessoa.nome)

        if(!pessoa){ //Se não foi encontrado nenhuma pessoa

            //Pessoa possui atributos obrigatórios, pois isto não pode ser utilizado findOrSaveByNome()
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
        emprestimo.dataDeDevolucao = new Date().plus(7)

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
            respond emprestimo.errors, view:'selecionarLivro'
            return
        }

        emprestimo.dataDeEmprestimo = new Date()

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
            ano: emprestimo.ano,
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

            if(emprestimo){
                flash.message = "Emprestimo localizado"
                redirect emprestimo

            } else{
                flash.message = "Livro $livro.titulo consta como disponível"
                redirect action: "index"
            }

        } else{
            flash.message = "Livro com id $id não existe"
            redirect action: "index"
        }
    }

    @Transactional
    def devolver(Emprestimo emprestimo){
        println emprestimo

        emprestimo.devolvido = true;
        emprestimo.devolvidoEm = new Date()
        emprestimo.livro.disponivel = true;
        emprestimo.livro.numeroDeEmprestimos += 1

        emprestimo.pessoa.numeroDeEmprestimos += 1

        emprestimo.ano.numeroDeEmprestimos += 1

        emprestimo.save flush: true

        redirect emprestimo
    }

    @Transactional
    def renovar(Emprestimo emprestimo){
        emprestimo.devolvido = true
        emprestimo.devolvidoEm = new Date()
        emprestimo.livro.numeroDeEmprestimos += 1
        emprestimo.livro.disponivel = true

        emprestimo.pessoa.numeroDeEmprestimos += 1

        emprestimo.ano.numeroDeEmprestimos += 1

        emprestimo.save flush: true

        Emprestimo novoEmprestimo = new Emprestimo()
        novoEmprestimo.livro = emprestimo.livro
        novoEmprestimo.pessoa = emprestimo.pessoa
        novoEmprestimo.dataDeDevolucao = emprestimo.dataDeDevolucao.plus(7)
        novoEmprestimo.ano = emprestimo.ano

        render (view: 'selecionarLivro', model: ["emprestimo": novoEmprestimo, emprestimoList: Emprestimo.findAllByPessoaAndDevolvido(emprestimo.pessoa, false)])
    }

    def relatorioIndex(){

        Date data

        if(params.data_day && params.data_month && params.data_year)
            data = new Date("$params.data_month/$params.data_day/$params.data_year")
        else
            data = new Date().clearTime()

        [emprestimoList: Emprestimo.findAllByDataDeDevolucaoAndDevolvido(data, false), data: data]
    }

    def relatorioEmprestimos(Integer max){

        println params

        Date inicio
        Date fim

        if (params.inicio_day && params.inicio_month && params.inicio_year)
            inicio = new Date("$params.inicio_month/$params.inicio_day/$params.inicio_year")
        else
            inicio = new Date().clearTime()

        if(params.fim_day && params.fim_month && params.fim_year)
            fim = new Date("$params.fim_month/$params.fim_day/$params.fim_year")
        else
            fim = inicio.minus(7)

        params.max = Math.min(max ?: 100, 200)

        if(!params.order && !params.sort){
            params.order = "desc"
            params.sort = "id"
        }

        def emprestimo = Emprestimo.withCriteria {
            gt ("dataDeEmprestimo", fim)
            lt ("dataDeEmprestimo", inicio)
        }

        def emprestimoCount = emprestimo.size()

        [emprestimoList: emprestimo, inicio: inicio, fim:fim, emprestimoCount: emprestimoCount]
    }

    def relatorioLivros(Integer max){
        params.max = Math.min(max ?: 200, 500)
        if(!params.sort && !params.order){
            params.sort = "numeroDeEmprestimos"
            params.order = "desc"
        }

        [livroList: sab.livros.Livro.list(params), livroCount: sab.livros.Livro.count()]
    }

    def relatorioPessoa(Integer max){
        params.max = Math.min(max ?: 200, 500)
        if(!params.sort && !params.order){
            params.sort = "numeroDeEmprestimos"
            params.order  ='desc'
        }

        [pessoaList: Pessoa.list(params), pessoaCount: Pessoa.list().size()]
    }

    def relatorioSerie(){

    }
}
