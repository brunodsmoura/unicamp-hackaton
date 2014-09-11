package br.ic.unicamp.hackaton.anuncio

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import br.ic.unicamp.hackaton.usuario.Contratante

@Transactional(readOnly = true)
class AnuncioController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]
	
	def springSecurityService

    def index(Integer max) {
		params.max = Math.min(max ?: 10, 100)

		Contratante loggedUser = (Contratante) springSecurityService.currentUser
        respond Anuncio.findAllByContratante(loggedUser, params), model:[anuncioInstanceCount: Anuncio.countByContratante(loggedUser)]
    }

    def show(Anuncio anuncioInstance) {
        respond anuncioInstance
    }

    def create() {
        render view: "create", model: [anuncioInstance: new Anuncio(params), categorias: Categoria.list(sort: "nome"), requisitos: Requisito.list(sort: "descricao")]
    }

    @Transactional
    def save(Anuncio anuncioInstance) {
        if (anuncioInstance == null) {
            notFound()
            return
        }
		
		Contratante loggedUser = (Contratante) springSecurityService.currentUser
		anuncioInstance.contratante = loggedUser

        if (!anuncioInstance.validate()) {
            respond anuncioInstance.errors, view:'create', model: [categorias: Categoria.list(sort: "nome"), 
											 requisitos: Requisito.list(sort: "descricao")]
            return
        }

        anuncioInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'anuncio.label', default: 'Anuncio'), anuncioInstance.id])
                redirect anuncioInstance
            }
            '*' { respond anuncioInstance, [status: CREATED] }
        }
    }

    def edit(Anuncio anuncioInstance) {
        respond anuncioInstance
    }

    @Transactional
    def update(Anuncio anuncioInstance) {
        if (anuncioInstance == null) {
            notFound()
            return
        }

        if (anuncioInstance.hasErrors()) {
            respond anuncioInstance.errors, view:'edit'
            return
        }

        anuncioInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Anuncio.label', default: 'Anuncio'), anuncioInstance.id])
                redirect anuncioInstance
            }
            '*'{ respond anuncioInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Anuncio anuncioInstance) {

        if (anuncioInstance == null) {
            notFound()
            return
        }

        anuncioInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Anuncio.label', default: 'Anuncio'), anuncioInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'anuncio.label', default: 'Anuncio'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
