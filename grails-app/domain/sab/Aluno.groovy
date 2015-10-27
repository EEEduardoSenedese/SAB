package sab

class Aluno extends Pessoa{

    Date dateDeNascimento
    String naturalidade
    String pai
    String mae

    static belongsTo = [arquivo: Arquivo, estado: EstadoDoAluno]

    static constraints = {
        dateDeNascimento nullable: false, blank: false
        naturalidade nullable: false, blank: false, unique: true
        pai nullable: false, blank: false, unique: true
        mae nullable: false, blank: false, unique: true
    }

    String toString(){
        nome
    }
}
