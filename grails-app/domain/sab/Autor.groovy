package sab

class Autor {

	String nome

	static mapping = {
		sort: "nome"
	}

	static hasMany = [autorLivro:AutorLivro]

    static constraints = {
    	nome	nullable: false, blank:false, maxsize:128, unique:true
    }

    String toString(){
    	nome
    }
}
