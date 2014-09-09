package br.ic.unicamp.hackaton.anuncio

import br.ic.unicamp.hackaton.usuario.FreeLancer

class Proposta {

	Date dataEnvio
	Anuncio anuncio
	Integer prazo
	Double valor

	static belongsTo = [profissional: FreeLancer]

}