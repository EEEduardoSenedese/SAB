package sab

class Genero {

  String nome

  static mapping = {
    sort: 'nome'
  }
  static hasMany = [generoLivro: GeneroLivro]

    static constraints = {
      nome nullable:false, blank:false, maxsize:128, unique:true
    }

    String toString(){
      nome 
    }
}
