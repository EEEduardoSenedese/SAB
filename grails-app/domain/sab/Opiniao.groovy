package sab


class Opiniao {

    boolean recomenda = true
    String opniao

    static belongsTo = [aluno: individuo.Aluno, livro: livros.Livro]

    static constraints = {
    }
}
