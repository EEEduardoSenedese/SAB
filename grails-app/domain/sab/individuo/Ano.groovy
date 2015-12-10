package sab.individuo

import sab.Emprestimo

class Ano {

    String nome
    int numeroDeEmprestimos

    static hasMany = [
        emprestimo: Emprestimo
    ]

    static constraints = {
      nome unique: true
    }

    String toString(){
        nome
    }
}
