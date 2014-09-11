import br.ic.unicamp.hackaton.security.CleanShotUserDetailsService
import br.ic.unicamp.hackatopn.services.provided.impl.UsuarioServiceImpl

// Place your Spring DSL code here
beans = {
	usuarioService(UsuarioServiceImpl)
	userDetailsService(CleanShotUserDetailsService) {
		grailsApplication = ref('grailsApplication')
	}
}
