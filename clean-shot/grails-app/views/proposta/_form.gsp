<div class="form-group">
	<label for="anuncio" class="control-label col-lg-2">
		<g:message code="proposta.anuncio.label" default="Anuncio" />
	</label>
	<div class="col-lg-10 ${hasErrors(bean: propostaInstance, field: 'anuncio', 'error')} required">
		<label id="anuncioSelecionado"></label>
		<input type="button" name="modal-anuncio" class="btn btn-default" value="Pesquisar" >
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
	<label for="valor" class="control-label col-lg-2">
		<g:message code="proposta.valor.label" default="Valor" />
	</label>
	<div class="col-lg-10 ${hasErrors(bean: propostaInstance, field: 'valor', 'error')} required">
		<g:field type="number" name="valor" value="${fieldValue(bean: propostaInstance, field: 'valor')}" class="form-control"  required=""/>

	</div>
</div>

<input type="hidden" name="anuncio.id" />

<script type="text/javascript">
	$(document).ready(function(){
		$('input[type=button][name=modal\\-anuncio]').click(function(){
			jQuery.ajax({
				url: '${request.contextPath}' + '/proposta/renderModalAnuncio',
				type: 'GET',
				success: function(data, textStatus, jqXHR){ 
					$('#pesquisar-anuncio').html(data).modal();
				},
				complete: function(data, textStatus, jqXHR){},
				error: function(jqXHR, textStatus, errorThrown){}
			});
		});
	});
</script>