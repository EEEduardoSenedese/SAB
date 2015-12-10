package sab

import sab.individuo.Pessoa
import sab.livros.Livro
import sab.individuo.Ano

class Emprestimo {

    Date dataDeEmprestimo
    Date dataDeDevolucao
    boolean devolvido = false
    Date devolvidoEm
    

    static belongsTo = [
        pessoa: Pessoa,
        livro: Livro,
        ano: Ano
    ]

    static constraints = {
        devolvidoEm nullable: true, blank:true
    }

    String toString(){
        "$pessoa - $livro"
    }
}
