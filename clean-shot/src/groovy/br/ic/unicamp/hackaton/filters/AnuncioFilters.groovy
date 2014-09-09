package br.ic.unicamp.hackaton.filters

class AnuncioFilters {
	
	Long contratante
	Long categoria
	Long requisito
	
	String titulo
	Boolean emAberto
	Date dataCriacao
	
	private AnuncioFilters(){ }

	public static AnuncioFilters create(){
		return new AnuncioFilters()
	}
	
	public boolean hasFilters(){
		return (contratante) || (categoria) || (requisito) || 
				(titulo) || (emAberto) || (dataCriacao)
	}
	
	public AnuncioFilters addContratante(Long id){
		this.contratante = id
		return this
	}
	
	public AnuncioFilters addCategoria(Long id){
		this.contratante = id
		return this
	}
	
	public AnuncioFilters addRequisito(Long id){
		this.requisito = id
		return this
	}
	
	public AnuncioFilters addTitulo(String titulo){
		this.titulo = titulo
		return this
	}
	
	public AnuncioFilters addEmAberto(Boolean emAberto){
		this.emAberto= emAberto
		return this
	}
	
	public AnuncioFilters adDataCriacao(Date dataCriacao){
		this.dataCriacao = dataCriacao
		return this
	}

}