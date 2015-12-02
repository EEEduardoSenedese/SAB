package sab

import sab.individuo.Pessoa
import sab.livros.Livro
import sab.individuo.Serie

class Emprestimo {

    Date dataDeEmprestimo
    Date dataDeDevolucao
    Serie serie
    boolean devolvido = false
    Date devolvidoEm

    static belongsTo = [
        pessoa: Pessoa,
        livro: Livro,
    ]

    static constraints = {
        devolvidoEm nullable: true, blank:true
    }

    String toString(){
        "$pessoa - $livro" 
    }
}
