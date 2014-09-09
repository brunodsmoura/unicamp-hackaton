package br.ic.unicamp.hackaton.anuncio

class Anuncio {

	Date dataCriacao
	Categoria categoria
	Double valorPrevisto
	Integer prazo

	Proposta propostaVencedora

	static hasMany = [propostas: Proposta,
					  requisitos: Requisito]

	static constraints = {
		valorPrevisto nullable: true
		propostaVencedora nullable: true
	}

}