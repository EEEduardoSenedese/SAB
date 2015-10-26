package sab

class Arquivo {

    int numero

    static hasMany = [aluno: Aluno]

    static constraints = {
        numero nullable: false, blank: false, unique: true
    }

    String toString(){
        numero
    }
}
