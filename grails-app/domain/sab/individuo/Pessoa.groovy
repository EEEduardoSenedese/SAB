package sab.individuo

import sab.endereco.*

class Pessoa {

    String nome
    Date dataDeNascimento
    String naturalidade
    String pai
    String mae
    String email
    String usuario
    String senha

    static belongsTo = [
      posicao: Posicao,
      rua: Rua,
      bairro: Bairro,
      cidade: Cidade,
      uf: UF
    ]

    static constraints = {
      nome nullable: false, blank: false, unique: true
      email nullable: true, blank: true
      usuario nullable: true, blank: true, unique: true
      senha nullable: true, blank: true
    }

    String toString(){
        nome
    }
}
