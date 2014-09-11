package br.ic.unicamp.hackatopn.services.provided.impl

import grails.transaction.Transactional
import grails.validation.ValidationException

import org.apache.log4j.Logger
import org.hibernate.HibernateException

import br.ic.unicamp.hackaton.filters.FreeLancerFilters
import br.ic.unicamp.hackaton.services.provided.UsuarioService
import br.ic.unicamp.hackaton.usuario.FreeLancer
import br.ic.unicamp.hackaton.usuario.Usuario

class UsuarioServiceImpl implements UsuarioService {
	
	private static Logger log = Logger.getLogger(UsuarioServiceImpl.class)
	
	@Transactional
	@Override
	public void criar(Usuario usuario) throws HibernateException {
		if(!usuario) throw new NullPointerException("Usuario nao pode ser nulo")
		
		try {
			if(!usuario.save(flush: true))
				throw new ValidationException("Problemas na validacao do usuario.", usuario.errors)
		} catch(Exception cause) {
			log.error("Problemas na criação do usuário", cause)
			throw new HibernateException("Problemas na criação do usuário", cause)
		}

	}
	
	@Override
	public List<FreeLancer> recuperarFreeLancers(FreeLancerFilters filters) {
		// TODO Auto-generated method stub
		return null;
	}
	
}