package br.ic.unicamp.hackaton.services.provided;

import java.util.List;

import br.ic.unicamp.hackaton.filters.FreeLancerFilters;
import br.ic.unicamp.hackaton.usuario.FreeLancer;

public interface UsuarioService {
	
	public void criarFreeLancer(FreeLancer freelancer);
	public List<FreeLancer> recuperarFreeLancers(FreeLancerFilters filters);

}
