package sab.individuo

class Ano {

    String nome

    static constraints = {
      nome unique: true
    }

    String toString(){
        nome
    }
}
