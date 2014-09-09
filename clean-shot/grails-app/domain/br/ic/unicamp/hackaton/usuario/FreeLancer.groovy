package br.ic.unicamp.hackaton.usuario

import br.ic.unicamp.hackaton.anuncio.Proposta

class FreeLancer {

	String nome
	String email
	String celular
	
	static hasMany = [habilidades: Habilidade,
					  propostas: Proposta]

	static constraints = {
		celular nullable: true
	}

}