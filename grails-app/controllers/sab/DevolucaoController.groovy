package sab

import sab.livros.Livro

class DevolucaoController {

    def index() {

    }

    def show(long id){

        Livro livro = Livro.get(id)

        Item item = sab.Item.findByLivroAndDevolvido(livro, false)

        //item.devolvido = true

        Emprestimo emprestimo = item.emprestimo
        respond emprestimo, model:[itemDevolucao: item]
    }

    def devolver(Item item){

        println params

        flash.message="Livro $item.livro.titulo, id: $item.livro.id"

        redirect (action: 'index')

    }
}
