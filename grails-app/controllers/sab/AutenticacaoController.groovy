package sab
import sab.individuo.Pessoa

class AutenticacaoController {

    def index(){
        if (session['usuario']) {
            redirect action: 'bemvindo'
        }
    }

    def autenticar(){

        println params

        def pessoa = Pessoa.findByUsuarioAndSenha(params.usuario, params.senha)

        println pessoa
        if (pessoa){
            session['usuario'] = pessoa
            redirect (action: "bemvindo")
        } else{
            flash.message = "Acesso Negado"
            redirect (action: "index")
        }
    }

    def bemvindo(){

        if (!session['usuario'].nome) {
            redirect action: index
        }
    }

    def sair(){
        session['usuario'] = null
        redirect action: 'index'
    }
}
