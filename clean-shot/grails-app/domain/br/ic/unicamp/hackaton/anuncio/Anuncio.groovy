package br.ic.unicamp.hackaton.anuncio

import br.ic.unicamp.hackaton.usuario.Contratante

class Anuncio {

	String titulo
	String descricao
	
	Date dataCriacao = new Date()
	Categoria categoria
	Double valorPrevisto
	
	Integer prazo
	Proposta propostaVencedora
	
	static belongsTo = [contratante: Contratante]

	static hasMany = [propostas: Proposta,
					  requisitos: Requisito]

	static mapping = {
		version false
	}
	
	static constraints = {
		valorPrevisto nullable: true
		propostaVencedora nullable: true
	}

}