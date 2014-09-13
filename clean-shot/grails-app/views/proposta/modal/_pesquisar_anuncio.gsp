  <div class="modal-content">
    <div class="modal-header">
      <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
      <h4 class="modal-title">Pesquisar Anúncios</h4>
    </div>
    <div class="modal-body">
    	<div class="form-horizontal">
	    	<div class="form-group">
				<label for="categoria" class="control-label col-lg-2">
					<g:message code="anuncio.categoria.label" default="Categoria" />
				</label>
				<div class="col-lg-10">
					<g:select id="categoria" name="categoria.id" 
							  from="${categorias}" optionKey="id" optionValue="nome" 
							  value="${anuncioInstance?.categoria?.id}" 
							  noSelection="${['':'Selecione...']}"
							  class="form-control"/>
				</div>
	    	</div>
	    	<div class="form-group">
				<label for="dataCriacao" class="control-label col-lg-2">
					<g:message code="anuncio.dataCriacao.label" default="Data de Criação" />
				</label>
				<div class="col-lg-10">
					<g:datePicker name="dataCriacao" class="form-control" noSelection="${['':'--']}" default="none" precision="day" />
				</div>
	    	</div>
	    	<div class="form-group">
				<label for="requisito.id" class="control-label col-lg-2">
					<g:message code="anuncio.requisito.label" default="Requisito" />
				</label>
				<div class="col-lg-10">
					<g:select name="requisito.id" from="${requisitos}" 
							  optionKey="id" optionValue="descricao"
							  value="${requisitosSelecionados*.id}"
							  multiple="true" class="form-control" />
				</div>
	    	</div>
    	</div>
    	<div class="row results" id="tabela-resultados"></div>
    </div>
    <div class="modal-footer">
      <button type="button" class="btn btn-default" data-dismiss="modal">Fechar</button>
      <button type="button" class="btn btn-primary" name="pesquisar">Pesquisar</button>
    </div>
  </div><!-- /.modal-content -->

<script type="text/javascript">
	$(document).ready(function(){
		$('button[name=pesquisar]').click(function(){
			var categoria = $('select[name=categoria\\.id]').val()
			var dataCriacao = $('input[name=dataCriacao]').val()
			var requisitos = $.map($('select[name=requisito\\.id]:selected'), function (el, i) {
		         return $(el).val();
		    });
			var requisito = requisitos.join(",")

			jQuery.ajax({
				type: 'POST',
				url: '${request.contextPath}' + '/proposta/recuperarAnuncios',
				data: { 'categoria': categoria, 'dataCriacao': dataCriacao,
						'requisito': requisito },
				success: function(data, textStatus, jqXHR){
					$('#tabela-resultados').html(data);
				},
				error: function(jqXHR, textStatus, errorThrown){},
				complete: function(data, textStatus, jqXHR){} 
			})
		});
	});
</script>