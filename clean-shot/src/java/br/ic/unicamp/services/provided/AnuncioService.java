package br.ic.unicamp.services.provided;

import java.util.List;

import org.hibernate.HibernateException;

import br.ic.unicamp.hackaton.anuncio.Anuncio;
import br.ic.unicamp.hackaton.anuncio.Proposta;
import br.ic.unicamp.hackaton.filters.AnuncioFilters;

public interface AnuncioService {
	
	public void criar(Anuncio anuncio) throws HibernateException;
	public void fechar(Anuncio anuncio, Proposta proposta) throws NullPointerException, HibernateException;
	public void excluir(Anuncio anuncio) throws NullPointerException, HibernateException;
	public List<Anuncio> recuperarAnuncios(AnuncioFilters filters);

}
