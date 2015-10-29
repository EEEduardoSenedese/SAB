package sab.endereco

class Bairro {

  String nome

  static hasMany = [rua: Rua]

  static belongsTo = [cidade: Cidade]

    static constraints = {
      nome unique: true
    }
}
