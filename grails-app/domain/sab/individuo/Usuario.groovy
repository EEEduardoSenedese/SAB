package sab.individuo

class Usuario {

    String usuario
    String senha

    static constraints = {
        usuario maxsize: 16
        senha maxsize: 32
    }
}
