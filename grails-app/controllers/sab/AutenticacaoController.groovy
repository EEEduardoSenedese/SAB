package sab
import sab.individuo.Pessoa

class AutenticacaoController {

    def index(){
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
