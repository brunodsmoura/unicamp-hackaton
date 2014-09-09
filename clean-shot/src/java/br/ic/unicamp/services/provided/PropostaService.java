package br.ic.unicamp.services.provided;

import org.hibernate.HibernateException;

import br.ic.unicamp.hackaton.anuncio.Anuncio;
import br.ic.unicamp.hackaton.anuncio.Proposta;

public interface PropostaService {

	public void criar(Anuncio anuncio, Proposta proposta) throws NullPointerException, HibernateException;
	public void excluir(Proposta proposta) throws NullPointerException, HibernateException;

}