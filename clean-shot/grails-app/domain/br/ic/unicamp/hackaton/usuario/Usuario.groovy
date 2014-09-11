package br.ic.unicamp.hackaton.usuario

abstract class Usuario {

	String nome
	String email
	String senha

	transient springSecurityService

	static transients = ['springSecurityService']
	
	static mapping = {
		discriminator column: "tipo"
		version false
	}

	static constraints = {
		email nullable: false, blank: false, unique: true
		senha nullable: false, blank: false
	}

	def beforeInsert() {
		encodePassword()
	}
	
	def beforeUpdate() {
		if (isDirty('senha')) {
			encodePassword()
		}
	}
	
	protected void encodePassword() {
		senha = springSecurityService.encodePassword(senha)
	}

}