package sab.livros

class CategoriaLivro {

  static belongsTo =[
    categoria: Categoria,
    livro: Livro
  ]

    static constraints = {
    }

    String toString(){
      "$livro.titulo, $categoria.nome"
    }
}
