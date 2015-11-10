class BootStrap {

    def init = { servletContext ->
        sab.individuo.Usuario.findOrSaveByUsuarioAndSenha("admin", "admin")
    }
    def destroy = {
    }
}
