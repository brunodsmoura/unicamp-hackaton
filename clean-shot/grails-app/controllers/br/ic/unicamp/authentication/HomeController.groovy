package br.ic.unicamp.authentication

import br.ic.unicamp.hackaton.usuario.Contratante;
import br.ic.unicamp.hackaton.usuario.Usuario

class HomeController {

	def springSecurityService
	
	def index(){
		Usuario loggedUser = (Usuario) springSecurityService.loadCurrentUser()
		String dominio = Contratante.class.isAssignableFrom(loggedUser.class) ? "anuncio" : "proposta"

		redirect(uri: "/${dominio}/index")
	}
	
}