package sab.individuo

class Aluno extends Pessoa{

    Date ultimoAno

    static belongsTo = [
      arquivo: Arquivo,
      estadoDoAluno: EstadoDoAluno,
      serie: Serie
    ]

    static constraints = {
    }

    String toString(){
        nome
    }
}
