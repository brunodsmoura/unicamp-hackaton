package br.ic.unicamp.hackaton.usuario

import br.ic.unicamp.hackaton.anuncio.Anuncio

class Contratante extends Usuario {

	static hasMany = [anuncios: Anuncio,
					  ramos: Ramo]
	
	static mapping = {
		discriminator value: "1"
		version false
	}

}