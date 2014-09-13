package br.ic.unicamp.hackaton.anuncio



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import br.ic.unicamp.hackaton.usuario.FreeLancer

@Transactional(readOnly = true)
class PropostaController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]
	
	def springSecurityService

    def index(Integer max) {
		FreeLancer usuarioLogado = (FreeLancer) springSecurityService.currentUser

        params.max = Math.min(max ?: 10, 100)
        respond Proposta.list(params), model:[propostaInstanceCount: Proposta.count(), usuarioLogado: usuarioLogado]
    }

    def show(Proposta propostaInstance) {
        respond propostaInstance
    }

    def create() {
        respond new Proposta(params)
    }

    @Transactional
    def save(Proposta propostaInstance) {
        if (propostaInstance == null) {
            notFound()
            return
        }
		
		FreeLancer loggedUser = (FreeLancer) springSecurityService.currentUser
		propostaInstance.dataEnvio = new Date()
		propostaInstance.profissional = loggedUser

        if (!propostaInstance.validate()) {
            respond propostaInstance.errors, view:'create'
            return
        }

		propostaInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'proposta.label', default: 'Proposta'), propostaInstance.id])
                redirect propostaInstance
            }
            '*' { respond propostaInstance, [status: CREATED] }
        }
    }

    def edit(Proposta propostaInstance) {
        respond propostaInstance
    }

    @Transactional
    def update(Proposta propostaInstance) {
        if (propostaInstance == null) {
            notFound()
            return
        }

        if (propostaInstance.hasErrors()) {
            respond propostaInstance.errors, view:'edit'
            return
        }

        propostaInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Proposta.label', default: 'Proposta'), propostaInstance.id])
                redirect propostaInstance
            }
            '*'{ respond propostaInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Proposta propostaInstance) {

        if (propostaInstance == null) {
            notFound()
            return
        }

        propostaInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Proposta.label', default: 'Proposta'), propostaInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }
	
	def renderModalAnuncio(){
		render(template: '/proposta/modal/pesquisar_anuncio', model: ['requisitos': Requisito.list(sort: "descricao"), 
																	  'categorias': Categoria.list(sort: "nome")])
	}
	
	def recuperarAnuncios(){
		flash.clear()
		
		Long categoriaId = params.long("categoria")
		String titulo = params['titulo']
		Date dataCriacao = params["dataCriacao"]

		List<Long> requisitosId = parseLongs(params["requisito"]?.split(',')?.toList())
		List<Anuncio> anunciosEncontrados = Collections.emptyList()
		boolean hasErrors = false

		if(categoriaId || titulo || dataCriacao || requisitosId){
			anunciosEncontrados = Anuncio.createCriteria().list {
				if(categoriaId) eq("categoria.id", categoriaId)
				if(titulo) ilike("titulo", "%"+titulo+"%")
				if(dataCriacao) le("dataCriacao", retrieveDateLastHour(dataCriacao))
				if(requisitosId){
					createAlias("requisitos", "req")
					"in"("req.id", requisitosId)
				}
			}
		} else {
			flash.error_message = "É obrigatória a seleção de ao menos um campo para busca."
			hasErrors = true
		}
		
		render(template: "/proposta/modal/tabela_resultados", model: ["anuncios": anunciosEncontrados, "hasErrors": true])
	}

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'proposta.label', default: 'Proposta'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
	
	private List<Long> parseLongs(List<String> ids){
		if(!ids) return Collections.emptyList()
		
		List<Long> parsedIds = []
		
		for(id in ids){
			try{
				parsedIds << Long.valueOf(id)	
			}catch(NumberFormatException cause){
				log.debug("Problemas na formatacao do id: ${id}")
			}
		}
		
		parsedIds.removeAll(Collections.singleton(null))
		return parsedIds
	}
	
	private Date retrieveDateLastHour(Date date){
		if(!date) return null
		
		Calendar calendar = Calendar.getInstance()
		calendar.setTime(date)
		
		calendar.set(Calendar.HOUR_OF_DAY, calendar.getActualMaximum(Calendar.HOUR_OF_DAY))
		calendar.set(Calendar.MINUTE, calendar.getActualMaximum(Calendar.MINUTE))
		calendar.set(Calendar.SECOND, calendar.getActualMaximum(Calendar.SECOND))
		calendar.set(Calendar.MILLISECOND, calendar.getActualMaximum(Calendar.MILLISECOND))
		
		return calendar.getTime()
	}
}
