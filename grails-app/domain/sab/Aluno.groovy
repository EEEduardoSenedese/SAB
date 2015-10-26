package sab

class Aluno extends Pessoa{

    static belongsTo = [arquivo: Arquivo]

    static constraints = {
    }

    String toString(){
        nome
    }
}
