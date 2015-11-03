package sab.endereco

class UF {
    String nome

    static hasMany = [cidade: Cidade]

    static constraints = {
      nome unique: true
    }

    String toString(){
        nome
    }
}
