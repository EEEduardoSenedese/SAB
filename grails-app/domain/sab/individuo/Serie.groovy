package sab.individuo

class Serie {

    String nome

    static constraints = {
      nome unique: true
    }

    String toString(){
        nome
    }
}
