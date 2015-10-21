package sab

class Livro {

  String titulo
  int data

    static hasMany = [autorLivro: AutorLivro, generoLivro: GeneroLivro]

    int numeroDePaginas

    static belongsTo = [
      aquisicao:  Aquisicao,
      categoria:  Categoria,
      editora:    Editora,
      colecao:      Colecao,
      ]

    static constraints = {
      titulo  nullable:false, blank:false, maxsize:128, unique:false
      data    nullable:false, blank:true, maxsize:4, minSize: 4
    }

    String toString(){
      titulo
    }
}
