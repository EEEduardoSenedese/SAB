package sab

import sab.individuo.Pessoa
import sab.livros.Livro
import sab.individuo.Serie

class Emprestimo {

    Date dataDeEmprestimo
    Date dataDeDevolucao
    Date dataRealDeDevolucao
    Serie serie

    static belongsTo = [
        pessoa: Pessoa,
    ]

    static hasMany = [
        itens: Item
    ]

    static constraints = {
        dataRealDeDevolucao nullable:true, blank:true
    }

    String toString(){
        "$pessoa, $id"
    }
}
