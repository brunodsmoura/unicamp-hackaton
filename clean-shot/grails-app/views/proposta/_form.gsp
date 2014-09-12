<%@ page import="br.ic.unicamp.hackaton.anuncio.Proposta" %>



<div class="form-group">
	<label for="anuncio" class="control-label col-lg-2">
		<g:message code="proposta.anuncio.label" default="Anuncio" />
	</label>
	<div class="col-lg-10 ${hasErrors(bean: propostaInstance, field: 'anuncio', 'error')} required">
		<g:select id="anuncio" name="anuncio.id" from="${br.ic.unicamp.hackaton.anuncio.Anuncio.list()}" optionKey="id" required="" value="${propostaInstance?.anuncio?.id}" class="many-to-one form-control"/>

	</div>
</div>	

<div class="form-group">
	<label for="dataEnvio" class="control-label col-lg-2">
		<g:message code="proposta.dataEnvio.label" default="Data Envio" />
	</label>
	<div class="col-lg-10 ${hasErrors(bean: propostaInstance, field: 'dataEnvio', 'error')} required">
		<g:datePicker name="dataEnvio" class="form-control" precision="day"  value="${propostaInstance?.dataEnvio}"  />

	</div>
</div>	

<div class="form-group">
	<label for="prazo" class="control-label col-lg-2">
		<g:message code="proposta.prazo.label" default="Prazo" />
	</label>
	<div class="col-lg-10 ${hasErrors(bean: propostaInstance, field: 'prazo', 'error')} required">
		<g:field name="prazo" type="number" value="${propostaInstance.prazo}" class="form-control"  required=""/>

	</div>
</div>	

<div class="form-group">
	<label for="profissional" class="control-label col-lg-2">
		<g:message code="proposta.profissional.label" default="Profissional" />
	</label>
	<div class="col-lg-10 ${hasErrors(bean: propostaInstance, field: 'profissional', 'error')} required">
		<g:select id="profissional" name="profissional.id" from="${br.ic.unicamp.hackaton.usuario.FreeLancer.list()}" optionKey="id" required="" value="${propostaInstance?.profissional?.id}" class="many-to-one form-control"/>

	</div>
</div>	

<div class="form-group">
	<label for="valor" class="control-label col-lg-2">
		<g:message code="proposta.valor.label" default="Valor" />
	</label>
	<div class="col-lg-10 ${hasErrors(bean: propostaInstance, field: 'valor', 'error')} required">
		<g:field name="valor" value="${fieldValue(bean: propostaInstance, field: 'valor')}" class="form-control"  required=""/>

	</div>
</div>	
