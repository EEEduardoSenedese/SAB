package sab.livros

class Aquisicao {

	String nome

	static hasMany = [livro:Livro]

	static mapping = {
		sort: 'nome'
	}

    static constraints = {
   		nome	nullable: false, blank:false, maxsize:128, unique:true
    }

    String toString(){
    	nome
    }
}
