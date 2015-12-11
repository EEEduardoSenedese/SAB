package sab
import sab.individuo.Pessoa

class AutenticacaoController {

    def index(){
        if (session['usuario']) {
            redirect action: 'bemvindo'
        }
    }

    def autenticar(){
        def pessoa = Pessoa.findByUsuarioAndSenha(params.usuario, params.senha)
        if (pessoa){
            session['usuario'] = pessoa
            redirect (action: "bemvindo")
        } else{
            flash.message = "Acesso Negado"
            redirect (action: "index")
        }
    }

    def bemvindo(){
    }
}
