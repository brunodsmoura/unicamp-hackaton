package br.ic.unicamp.hackaton.anuncio



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class PropostaController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Proposta.list(params), model:[propostaInstanceCount: Proposta.count()]
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

        if (propostaInstance.hasErrors()) {
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

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'proposta.label', default: 'Proposta'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
