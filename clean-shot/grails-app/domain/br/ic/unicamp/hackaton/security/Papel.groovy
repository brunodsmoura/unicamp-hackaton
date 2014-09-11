package br.ic.unicamp.hackaton.security

class Papel {

	String authority
 
	static mapping = {
	   cache true
	   version false
	}
 
	static constraints = {
	   authority blank: false, unique: true
	}

}