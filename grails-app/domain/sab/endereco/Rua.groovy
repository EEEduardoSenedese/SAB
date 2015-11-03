package sab.endereco

class Rua {

  String nome

  static belongsTo = [bairro: Bairro]

    static constraints = {

      nome unique: true
    }

    String toString(){
        nome
    }
}
