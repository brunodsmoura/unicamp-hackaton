<div class="form-group">
	<label for="categoria" class="col-lg-2"><g:message code="anuncio.categoria.label" default="Categoria" />*</label>
	<div class="col-lg-10 ${hasErrors(bean: anuncioInstance, field: 'categoria', 'error')} required">
		<g:select id="categoria" name="categoria.id" from="${categorias}" optionKey="id" optionValue="nome" noSelection="${['': 'Selecione...']}" value="${anuncioInstance?.categoria?.id}" class="form-control" />
	</div>
</div>

<div class="form-group">
	<label for="titulo" class="col-lg-2"><g:message code="anuncio.titulo.label" default="Titulo" />*</label>
	<div class="col-lg-10 ${hasErrors(bean: anuncioInstance, field: 'titulo', 'error')} required">
		<g:textField name="titulo" class="form-control" required="" value="${anuncioInstance?.titulo}"/>
	</div>
</div>

<div class="form-group">
	<label for="descricao" class="col-lg-2"><g:message code="anuncio.descricao.label" default="Descricao" />*</label>
	<div class="col-lg-10 ${hasErrors(bean: anuncioInstance, field: 'descricao', 'error')} required">
		<g:textField name="descricao" class="form-control" required="" value="${anuncioInstance?.descricao}"/>
	</div>
</div>

<div class="form-group">
	<label for="valorPrevisto" class="col-lg-2"><g:message code="anuncio.valorPrevisto.label" default="Valor Previsto" /></label>
	<div class="col-lg-10 ${hasErrors(bean: anuncioInstance, field: 'valorPrevisto', 'error')} ">
		<g:field type="double" class="form-control" name="valorPrevisto" value="${fieldValue(bean: anuncioInstance, field: 'valorPrevisto')}"/>
	</div>
</div>

<div class="form-group">
	<label for="prazo" class="col-lg-2"><g:message code="anuncio.prazo.label" default="Prazo" />*</label>
	<div class="col-lg-10 ${hasErrors(bean: anuncioInstance, field: 'prazo', 'error')} required">
		<g:field name="prazo" type="number" class="form-control" value="${anuncioInstance.prazo}" required=""/>
	</div>
</div>

<div class="form-group">
	<label for="requisitos" class="col-lg-2"><g:message code="anuncio.requisitos.label" default="Requisitos" />*</label>
	<div class="col-lg-10 ${hasErrors(bean: anuncioInstance, field: 'requisitos', 'error')} ">
		<g:select name="requisitos" from="${requisitos}" multiple="multiple" 
				  optionKey="id" optionValue="descricao" size="5" 
				  value="${anuncioInstance?.requisitos*.id}" 
				  class="form-control many-to-many" />
	</div>
</div>