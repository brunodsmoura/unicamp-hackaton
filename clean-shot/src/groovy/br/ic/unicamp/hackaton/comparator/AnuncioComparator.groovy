package br.ic.unicamp.hackaton.comparator

import java.text.Collator

import br.ic.unicamp.hackaton.anuncio.Anuncio

public final class AnuncioComparator {
	
	private AnuncioComparator(){ }
	
	public static final Comparator<Anuncio> TITULO = new Comparator<Anuncio>(){
		public int compare(Anuncio one, Anuncio another) {
			Collator collator = Collator.getInstance()
			return collator.compare(one?.titulo, another?.titulo)
		}
	}
	
	public static final Comparator<Anuncio> DATA_CRIACAO = new Comparator<Anuncio>(){
		public int compare(Anuncio one, Anuncio another) {
			return one?.dataCriacao?.compareTo(another?.dataCriacao)
		}
	}

}