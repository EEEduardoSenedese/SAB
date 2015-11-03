package sab.individuo

import sab.endereco.*

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

    static belongsTo = [
      posicao: Posicao,
      rua: Rua,
      bairro: Bairro,
      cidade: Cidade,
      uf: UF,
      sexo: Sexo
    ]

    static constraints = {
      nome nullable: false, blank: false, unique: true
      email nullable: true, blank: true
      usuario nullable: true, blank: true, unique: true
      senha nullable: true, blank: true
      numeroDaRua nullable: true, blank: true
      telefone nullable: true, blank:true
      cep nullable: true, blank:true
      complemento nullable:true , blank:true
      nacionalidade nullable: true, blank: true
    }

    String toString(){
        nome
    }
}
