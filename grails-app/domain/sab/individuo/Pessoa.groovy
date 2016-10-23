package sab.individuo

import sab.endereco.*
import sab.Emprestimo

class Pessoa {

    String nome
    Date dataDeNascimento
    String naturalidade
    String nacionalidade
    String pai
    String mae
    String email
    String usuario
    String senha
    int numeroDaRua
    String telefone
    String cep
    String complemento

    int numeroDeEmprestimos

    static belongsTo = [
      posicao: Posicao,
      rua: Rua,
      bairro: Bairro,
      cidade: Cidade,
      uf: UF,
      sexo: Sexo,
      ano: Ano
    ]

    static hasMany = [
        emprestimo: Emprestimo
    ]

    static constraints = {
      nome unique: false
      email nullable: true, blank: true
      usuario nullable: true, blank: true, unique: true
      senha nullable: true, blank: true
      numeroDaRua nullable: true, blank: true
      telefone nullable: true, blank:true
      cep nullable: true, blank:true
      complemento nullable:true , blank:true
      nacionalidade nullable: true, blank: true
      pai nullable: true, blank: true
      mae nullable: true, blank: true
      naturalidade nullable: true, blank: true
    }

    String toString(){
        nome
    }
}
