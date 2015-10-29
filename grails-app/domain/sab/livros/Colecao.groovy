package sab.livros

class Colecao {

    String nome

    static hasMany = [livro: Livro]

    static constraints = {
        nome    unique:true
    }

    String toString(){
        nome
    }
}
