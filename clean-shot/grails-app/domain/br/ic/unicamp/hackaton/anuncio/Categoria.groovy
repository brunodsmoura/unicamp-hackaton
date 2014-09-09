package br.ic.unicamp.hackaton.anuncio

class Categoria {

	String nome
	Categoria parent

	static mappedBy = [filhas: "parent"]
	static hasMany = [filhas: Categoria]

	static mapping = {
		id column: "id", generator: "sequence", params: ["sequence" : "CS_CATEGORIA_SEQ"]
	}
	
	static constraints = {
		parent nullable: true
		filhas nullable: true
	}

}
