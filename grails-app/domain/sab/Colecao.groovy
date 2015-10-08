package sab

class Colecao {

    String nome

    //static hasMany = [livro: Livro]

    static constraints = {
        nome    unique:true
    }
}
