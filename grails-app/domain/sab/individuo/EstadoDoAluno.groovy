package sab.individuo

class EstadoDoAluno {

    String nome

    static hasMany= [aluno: Aluno]

    static constraints = {
        nome nullable: false, blank: false, unique: true
    }

    String toString(){
        nome
    }
}
