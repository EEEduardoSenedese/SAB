package sab

class Categoria {

  String nome

  static hasMany = [livro: Livro]

    static constraints = {
      nome  nullable:false, blank:false, maxsize:128, unique:true
    }

    String toString(){
      nome
    }
}
