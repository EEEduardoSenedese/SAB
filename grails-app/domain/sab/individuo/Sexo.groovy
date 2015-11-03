package sab.individuo

class Sexo {

    String nome

    static hasMany = [
        pessoa: Pessoa
    ]

    static constraints = {
    }

    String toString(){
        nome
    }
}
