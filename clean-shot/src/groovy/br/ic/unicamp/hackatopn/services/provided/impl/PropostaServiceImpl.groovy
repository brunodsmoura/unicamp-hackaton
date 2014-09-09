package br.ic.unicamp.hackatopn.services.provided.impl

import org.apache.log4j.Logger
import org.hibernate.HibernateException

import br.ic.unicamp.hackaton.anuncio.Anuncio
import br.ic.unicamp.hackaton.anuncio.Proposta
import br.ic.unicamp.services.provided.PropostaService

class PropostaServiceImpl implements PropostaService {

	private static Logger log = Logger.getLogger(PropostaServiceImpl.class)
	
	@Override
	public void criar(Anuncio anuncio, Proposta proposta)
			throws NullPointerException, HibernateException {
		
	}

	@Override
	public void excluir(Proposta proposta) 
		throws NullPointerException,
			 	HibernateException {

		if(!proposta) throw new NullPointerException("A proposta a ser excluida n�o pode ser nula.")
		
		try{
			if(Anuncio.countByPropostaVencedora(proposta) > 0)
				throw new Exception("N�o � poss�vel efetuar a exclus�o de uma proposta vencedora.")

			proposta.delete(flush: true)
		} catch(Exception cause) {
			log.error("Problemas na exclus�o da proposta ${proposta.id}", cause)
			throw new HibernateException("Problemas na exclus�o da proposta ${proposta.id}", cause)
		}
	}

}
