package sab.endereco

class Cidade {

  String nome

  static belongsTo=[uf: UF]

  static hasMany=[bairro:Bairro]

    static constraints = {
      nome unique: true
    }
}
