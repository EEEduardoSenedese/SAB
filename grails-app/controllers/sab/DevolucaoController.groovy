package sab

import sab.livros.Livro

class DevolucaoController {

    def index() {

    }

    def show(long id){

        println id

        Livro livro = Livro.get(id)

        println livro.titulo
        Emprestimo emprestimo = sab.Item.findByLivro(livro).emprestimo
        return emprestimo
    }
}
