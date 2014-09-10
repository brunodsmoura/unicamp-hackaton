package br.ic.unicamp.hackaton.usuario

import br.ic.unicamp.hackaton.anuncio.Proposta

class FreeLancer extends Usuario {

	String nome
	String celular
	
	static hasMany = [habilidades: Habilidade,
					  propostas: Proposta]

	static mapping = {
        discriminator value: "2"
		version false
	}

	static constraints = {
		celular nullable: true
	}

}