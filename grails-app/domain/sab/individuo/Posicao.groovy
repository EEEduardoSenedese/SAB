package sab.individuo

class Posicao {

    String nome

    static hasMany = [pessoa: Pessoa]

    static constraints = {
      nome nullable: false, blank: false, unique: true
    }
}
