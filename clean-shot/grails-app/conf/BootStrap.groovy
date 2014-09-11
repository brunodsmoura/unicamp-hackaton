import br.ic.unicamp.hackaton.anuncio.Categoria
import br.ic.unicamp.hackaton.anuncio.Requisito
import br.ic.unicamp.hackaton.security.Papel

class BootStrap {

    def init = { servletContext ->
		
		//Permissoes de Acesso ao Sistema
		Papel contratante = new Papel(authority: "ROLE_CONTRATANTE").save(flush: true)
		Papel freelancer = new Papel(authority: "ROLE_FREELANCER").save(flush: true)
		
		//Categorias
		Categoria web = new Categoria(nome: "Web").save(flush: true)
		Categoria mobile = new Categoria(nome: "Mobile").save(flush: true)
		
		//Requisitos
		Requisito java = new Requisito(descricao: "Java").save(flush: true)
		Requisito android = new Requisito(descricao: "Android").save(flush: true)
    }
    def destroy = {
    }
}
