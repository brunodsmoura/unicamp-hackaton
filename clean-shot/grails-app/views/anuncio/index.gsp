
<%@ page import="br.ic.unicamp.hackaton.anuncio.Anuncio" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'anuncio.label', default: 'Anuncio')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<content tag="nav-bar">
			<a href="#list-anuncio" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
			<div role="navigation">
				<ul>
					<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
					<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
				</ul>
			</div>
		</content>
		
		<div class="container">
			<div id="list-anuncio" class="content scaffold-list" role="main">
				<g:if test="${!anuncioInstanceList}">
					<div class="alert alert-warning">
						<p class="bg-warning">Não existem anúncios cadastrados. Clique no botão "Novo Anúncio" para efetuar um novo cadastro.</p>
					</div>
				</g:if>
				<g:else>
					<h1>Listagem de Anúncios do ${usuarioLogado?.nome}</h1>
		
					<g:if test="${flash.message}">
						<div class="message" role="status">${flash.message}</div>
					</g:if>
					<g:if test="${flash.error_message}">
						<div class="alert alert-danger" role="status"><p class="bg-danger">${flash.error_message}</p></div>
					</g:if>
					<g:if test="${flash.success_message}">
						<div class="message" role="status">${flash.success_message}</div>
					</g:if>
		
					<table class="table">
						<thead>
							<tr>
								<th><g:message code="anuncio.categoria.label" default="Categoria" /></th>
								
								<g:sortableColumn property="titulo" title="${message(code: 'anuncio.titulo.label', default: 'Título')}" />
		
								<g:sortableColumn property="descricao" title="${message(code: 'anuncio.descricao.label', default: 'Descricao')}" />
		
								<g:sortableColumn property="dataCriacao" title="${message(code: 'anuncio.dataCriacao.label', default: 'Data Criacao')}" />
		
								<g:sortableColumn property="valorPrevisto" title="${message(code: 'anuncio.valorPrevisto.label', default: 'Valor Previsto')}" />
							</tr>
						</thead>
						<tbody>
						<g:each in="${anuncioInstanceList}" status="i" var="anuncioInstance">
							<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
								<td>${anuncioInstance?.categoria?.nome}</td>
							
								<td>${fieldValue(bean: anuncioInstance, field: "titulo")}</td>
							
								<td>${fieldValue(bean: anuncioInstance, field: "descricao")}</td>
		
								<td><g:formatDate date="${anuncioInstance.dataCriacao}" /></td>
							
								<td>${fieldValue(bean: anuncioInstance, field: "valorPrevisto")}</td>
							</tr>
						</g:each>
						</tbody>
					</table>
				</g:else>
			</div>
		</div>	
	</body>
</html>