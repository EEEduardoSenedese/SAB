package sab.individuo

class Aluno extends Pessoa{

    int ultimoAno
    int codigo

    static belongsTo = [
      arquivo: Arquivo,
      estadoDoAluno: EstadoDoAluno,
      serie: Serie
    ]

    static constraints = {
      codigo unique:true, nullable: false, blank:false
    }

    String toString(){
        nome
    }
}
