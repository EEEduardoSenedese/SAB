package sab
import sab.individuo.Usuario

class AutenticacaoController {

    def index(){
    }

    def autenticar(Usuario usuario){
        def registro = Usuario.findByUsuarioAndSenha(usuario.usuario, usuario.senha)
        if (registro){
            session['usuario'] = registro

            println "Usuário ${session['usuario']}"
            redirect (action: "bemvindo")
        } else{
            flash.message = "Acesso Negado"
            redirect (action: "index")
        }
    }

    def bemvindo(){
    }
}
