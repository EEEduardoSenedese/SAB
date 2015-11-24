package sab
import sab.livros.Livro

class Item {

    boolean devolvido
    Date dataDaDevolucao

    static belongsTo = [
        emprestimo: Emprestimo,
        livro: Livro
    ]

    static constraints = {
        dataDaDevolucao nullable:true, blank: true
    }

    String toString(){
        if(livro && emprestimo){
            "${emprestimo.pessoa.nome} : ${livro.titulo}"
        }
    }
}
