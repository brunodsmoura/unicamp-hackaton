package br.ic.unicamp.hackaton.security

import grails.plugin.springsecurity.userdetails.GormUserDetailsService
import grails.plugin.springsecurity.userdetails.GrailsUser

import org.springframework.security.core.GrantedAuthority
import org.springframework.security.core.authority.SimpleGrantedAuthority
import org.springframework.security.core.userdetails.UserDetails

import br.ic.unicamp.hackaton.usuario.Contratante

class CleanShotUserDetailsService extends GormUserDetailsService {
	
	@Override
	protected Collection<GrantedAuthority> loadAuthorities(Object user,
			String username, boolean loadRoles) {
		if(!loadRoles) return Collections.emptyList()
		
		Papel papelCorrente = Contratante.class.isAssignableFrom(user.class) ? Papel.findByAuthority("ROLE_CONTRATANTE") : 
																				Papel.findByAuthority("ROLE_FREELANCER")
		
		return [new SimpleGrantedAuthority(papelCorrente?.authority)];
	}
			
	@Override
	protected UserDetails createUserDetails(Object user,
			Collection<GrantedAuthority> authorities) {
		return new GrailsUser(user?.email, user?.senha, true, true, true,
				true, authorities, user.id)
	}

}
