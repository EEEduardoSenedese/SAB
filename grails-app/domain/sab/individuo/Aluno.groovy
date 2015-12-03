package sab.individuo

class Aluno extends Pessoa{

    int ultimoAno
    int codigo

    static belongsTo = [
      arquivo: Arquivo,
      estadoDoAluno: EstadoDoAluno,
      ano: Ano
    ]

    static constraints = {
    }

    String toString(){
        nome
    }
}
