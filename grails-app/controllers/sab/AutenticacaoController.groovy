package sab
import sab.individuo.Pessoa

class AutenticacaoController {

    def index(){
        if (session['usuario']) {
            redirect controller: "emprestimo", action: "relatorioIndex"
        }
    }

    def autenticar(){

        println params

        def pessoa = Pessoa.findByUsuarioAndSenha(params.usuario, params.senha)

        println pessoa
        if (pessoa){
            session['usuario'] = pessoa
            redirect controller: "emprestimo", action: "relatorioIndex"
        } else{
            flash.message = "Acesso Negado"
            redirect (action: "index")
        }
    }

    def bemvindo(){
    }

    def sair(){
        session['usuario'] = null
        redirect action: 'index'
    }
}
