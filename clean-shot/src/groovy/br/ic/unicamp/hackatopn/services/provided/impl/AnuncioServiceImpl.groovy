package br.ic.unicamp.hackatopn.services.provided.impl

import grails.transaction.Transactional
import grails.validation.ValidationException

import org.apache.log4j.Logger
import org.hibernate.HibernateException

import br.ic.unicamp.hackaton.anuncio.Anuncio
import br.ic.unicamp.hackaton.anuncio.Proposta
import br.ic.unicamp.hackaton.comparator.AnuncioComparator
import br.ic.unicamp.hackaton.filters.AnuncioFilters
import br.ic.unicamp.services.provided.AnuncioService

class AnuncioServiceImpl implements AnuncioService {

	private static Logger log = Logger.getLogger(AnuncioServiceImpl.class)
	
	@Transactional
	@Override
	public void criar(Anuncio anuncio) throws HibernateException {
		if(!anuncio) return

		try{
			if(!anuncio.save(flush: true))
				throw new ValidationException("Problemas na validacao do anuncio!", anuncio.errors)
		}catch(Exception cause){
			log.error("Problemas na criacao do anuncio.", cause)
			throw new HibernateException("Problemas na criacao do anuncio.", cause)
		}

	}

	@Transactional
	@Override
	public void fechar(Anuncio anuncio, Proposta proposta) 
		throws NullPointerException, HibernateException {
			
		if(!anuncio || !proposta) throw new NullPointerException("Os dados anuncio e proposta não podem ser nulos. Operação cancelada")

		try {
			anuncio.propostaVencedora = proposta
			if(!anuncio.save(flush: true))
				throw new ValidationException("Problemas no fechamento do anuncio: ${anuncio.id}!", anuncio.errors)
		}catch(Exception cause){
			log.error("Problemas no fechamento do anuncio: ${anuncio.id}!", cause)
			throw new HibernateException("Problemas no fechamento do anuncio: ${anuncio.id}!", cause)
		}

	}

	@Transactional
	@Override
	public void excluir(Anuncio anuncio) throws HibernateException {
		if(!anuncio) return
		
		try{
			if(anuncio.propostaVencedora) throw new Exception("Não é possível efetuar a exclusão de um anúncio que já tenha proposta vencedora.")
			
			anuncio.delete(flush: true)
		} catch(Exception cause){
			throw new HibernateException("Problemas na exclusão do anuncio ${anuncio.id}", cause)
		}

	}

	@Override
	public List<Anuncio> recuperarAnuncios(AnuncioFilters filters) {
		if(!filters || !filters.hasFilters()) Collections.emptyList()
		
		List<Anuncio> anunciosEncontrados = Anuncio.createCriteria().list {
												if(filters.contratante) eq("contratante.id", filters.contratante)
												if(filters.categoria) eq("categoria.id", filters.categoria)
												if(filters.requisito) {
													createAlias("requisitos", "req")
													eq("req.id", filters.requisito)
												}
												
												if(filters.titulo) ilike("titulo", "%" + filters.titulo + "%")
												if(filters.dataCriacao) eq("dataCriacao", filters.dataCriacao)
												if(filters.emAberto != null){
													if(filters.emAberto) isNull("propostaVencedora")
													else isNotNull("propostaVencedora")
												}
												
											}
		
		if(!anunciosEncontrados) return Collections.emptyList()

		Collections.sort(anunciosEncontrados, AnuncioComparator.DATA_CRIACAO)

		return anunciosEncontrados;
	}

}