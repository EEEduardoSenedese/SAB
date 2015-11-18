package sab.livros

import sab.Emprestimo

class Livro {

  String titulo
  int data //data de publicação
  Date dataDeAquisicao
  int numeroDeEmprestimos

    static hasMany = [
        autorLivro: AutorLivro,
        generoLivro: GeneroLivro
    ]

    int numeroDePaginas

    static belongsTo = [
      aquisicao:  Aquisicao,
      categoria:  Categoria,
      editora:    Editora,
      colecao:      Colecao,
      prateleira:   Prateleira
    ]

    static constraints = {
      titulo  nullable:false, blank:false, maxsize:128, unique:false
      data    nullable:true, blank:true, maxsize:4, minSize: 4
      dataDeAquisicao nullable: true, blank: false
      numeroDeEmprestimos nullable: true, blank: true
    }

    String toString(){
      titulo
    }
}
