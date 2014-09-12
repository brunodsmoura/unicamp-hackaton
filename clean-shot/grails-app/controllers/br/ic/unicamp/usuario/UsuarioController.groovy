package br.ic.unicamp.usuario

import grails.converters.JSON

import org.hibernate.HibernateException
import org.scribe.model.Token

import br.ic.unicamp.hackaton.usuario.Contratante
import br.ic.unicamp.hackaton.usuario.FreeLancer
import br.ic.unicamp.hackaton.usuario.Usuario

class UsuarioController {
	
	def usuarioService
	def oauthService
	def springSecurityService
	
	def allowedMethods = ["POST": "save"]
	
	def create(){
		if(springSecurityService.isLoggedIn()){
			redirect(uri: '/login/index')
			return true
		}
		
	    Token linkedinAccessToken = (Token) session[oauthService.findSessionKeyForAccessToken('linkedin')]
	    def linkedInResponse = oauthService.getLinkedInResource(linkedinAccessToken, "http://api.linkedin.com/v1/people/~:(first-name,last-name,email-address)?format=json")
	    def linkedinParsedResponse = JSON.parse(linkedInResponse?.getBody())

		String nome = null
		String email = null

		if(linkedinParsedResponse){
			nome = String.format("%s %s", linkedinParsedResponse?.firstName, linkedinParsedResponse?.lastName)
			email = linkedinParsedResponse?.emailAddress
		}

		Usuario usuario = new Contratante([nome: nome, email: email])

		render(view: "create", model: ["isContratante":true, "usuarioInstance": usuario])
	}
	
	def save(){
		Integer tipo = params.int("tipo")
		Boolean isContratante = (tipo == 1)
		Usuario usuario = (isContratante) ? new Contratante(params) : new FreeLancer(params)
		
		try{ 
			usuarioService.criar(usuario)
			springSecurityService.reauthenticate(usuario.email, params["senha"])

			redirect(uri: "/home/index")
			return true
		}catch(HibernateException cause){
			if(!usuario.hasErrors())
				usuario.errors.reject("Problemas na persistência dos dados. Tente novamente")
		}

		render(view: "create", model: ["usuarioInstance": usuario, "isContratante": isContratante])
	}
	
	def cancel(){
		redirect(uri: "/")
	}

}