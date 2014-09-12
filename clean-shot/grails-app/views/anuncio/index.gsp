
<%@ page import="br.ic.unicamp.hackaton.anuncio.Anuncio" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'anuncio.label', default: 'Anuncio')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-anuncio" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-anuncio" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>

			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:if test="${flash.error_message}">
				<div class="alert alert-danger" role="status"><p class="bg-danger">${flash.error_message}</p></div>
			</g:if>
			<g:if test="${flash.success_message}">
				<div class="message" role="status">${flash.success_message}</div>
			</g:if>

			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="valorPrevisto" title="${message(code: 'anuncio.valorPrevisto.label', default: 'Valor Previsto')}" />
					
						<th><g:message code="anuncio.propostaVencedora.label" default="Proposta Vencedora" /></th>
					
						<th><g:message code="anuncio.categoria.label" default="Categoria" /></th>
					
						<th><g:message code="anuncio.contratante.label" default="Contratante" /></th>
					
						<g:sortableColumn property="dataCriacao" title="${message(code: 'anuncio.dataCriacao.label', default: 'Data Criacao')}" />
					
						<g:sortableColumn property="descricao" title="${message(code: 'anuncio.descricao.label', default: 'Descricao')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${anuncioInstanceList}" status="i" var="anuncioInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${anuncioInstance.id}">${fieldValue(bean: anuncioInstance, field: "valorPrevisto")}</g:link></td>
					
						<td>${fieldValue(bean: anuncioInstance, field: "propostaVencedora")}</td>
					
						<td>${fieldValue(bean: anuncioInstance, field: "categoria")}</td>
					
						<td>${fieldValue(bean: anuncioInstance, field: "contratante")}</td>
					
						<td><g:formatDate date="${anuncioInstance.dataCriacao}" /></td>
					
						<td>${fieldValue(bean: anuncioInstance, field: "descricao")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${anuncioInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
