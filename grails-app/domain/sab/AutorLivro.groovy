package sab

class AutorLivro {

  static belongsTo = [
    autor: Autor,
    livro: Livro
  ]

    static constraints = {
    }

    String toString(){
      if(autor?.nome && livro?.titulo){
        "Autor: $autor.nome - Livro: (${livro.id}) $livro.titulo"
      }
    }
}
