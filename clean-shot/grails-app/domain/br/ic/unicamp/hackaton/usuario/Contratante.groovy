package br.ic.unicamp.hackaton.usuario

import br.ic.unicamp.hackaton.anuncio.Anuncio

class Contratante {

	String nomeContato
	String email
	
	static hasMany = [anuncios: Anuncio,
					  ramos: Ramo]

}