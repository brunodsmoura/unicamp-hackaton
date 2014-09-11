package br.ic.unicamp.hackaton.services.provided;

import java.util.List;

import org.hibernate.HibernateException;

import br.ic.unicamp.hackaton.filters.FreeLancerFilters;
import br.ic.unicamp.hackaton.usuario.FreeLancer;
import br.ic.unicamp.hackaton.usuario.Usuario;

public interface UsuarioService {
	
	public void criar(Usuario usuario) throws HibernateException;
	public List<FreeLancer> recuperarFreeLancers(FreeLancerFilters filters);

}
