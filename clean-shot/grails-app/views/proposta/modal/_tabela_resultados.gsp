<g:if test="${!anuncios}">
	<div class="form-group">
		<div class="alert alert-warning">
			<g:if test="${!hasErrors}">
				<p class="bg-warning">Não foram encontrados registros.</p>
			</g:if>
			<g:else>
				<p class="bg-danger">${flash.error_message}</p>
			</g:else>
		</div>
	</div>
</g:if>
<g:else>
	<table class="table">
		<thead>
			<tr>
				<th><g:message code="anuncio.categoria.label" default="Categoria" /></th>
				
				<g:sortableColumn property="titulo" title="${message(code: 'anuncio.titulo.label', default: 'Título')}" />

				<g:sortableColumn property="descricao" title="${message(code: 'anuncio.descricao.label', default: 'Descricao')}" />

				<g:sortableColumn property="dataCriacao" title="${message(code: 'anuncio.dataCriacao.label', default: 'Data Criacao')}" />

				<g:sortableColumn property="valorPrevisto" title="${message(code: 'anuncio.valorPrevisto.label', default: 'Valor Previsto')}" />
				
				<g:sortableColumn property="prazo" title="${message(code: 'anuncio.prazo.label', default: 'Prazo')}" />
				
				<th></th>
			</tr>
		</thead>
		<tbody>
			<g:each in="${anuncios}" status="i" var="anuncioInstance">
				<tr class="${(i % 2) == 0 ? 'even' : 'odd'}" id="anuncio_${anuncioInstance?.id}">
					<td>${anuncioInstance?.categoria?.nome}</td>
				
					<td class="anuncio-title">${fieldValue(bean: anuncioInstance, field: "titulo")}</td>
				
					<td>${fieldValue(bean: anuncioInstance, field: "descricao")}</td>
	
					<td><g:formatDate date="${anuncioInstance.dataCriacao}" /></td>
				
					<td>${fieldValue(bean: anuncioInstance, field: "valorPrevisto")}</td>
					
					<td class="anuncio-prazo">${fieldValue(bean: anuncioInstance, field: "prazo")}</td>
					
					<td><button name="selecionar" class="btn btn-default">Selecionar</button></td>
			</g:each>
		</tbody>
	</table>
	
	<script type="text/javascript">
		$(document).ready(function(){
			$('button[name=selecionar]').click(function(){
				var id = $(this).closest('tr').attr('id').replace('anuncio_', '')
				var anuncioSelecionado = $(this).parent().siblings('.anuncio-title').text()
				var prazo = $(this).parent().siblings('.anuncio-prazo').text()

				$('input[type=hidden][name=anuncio\\.id]').attr('value', id)
				$('#anuncioSelecionado').html(anuncioSelecionado + ' - Prazo: ' + prazo + ' dias.')
				$('#pesquisar-anuncio').modal('hide');
			});
		});
	</script>
</g:else>