package sab.livros

class Prateleira {

    static hasMany = [
        livros: Livro
    ]

    String nome
    static constraints = {
        nome unique: true;
    }

    String toString(){
        nome
    }
}
