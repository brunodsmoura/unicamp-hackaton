
<%@ page import="br.ic.unicamp.hackaton.anuncio.Proposta" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'proposta.label', default: 'Proposta')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<content tag="nav-bar">
			<a href="#list-proposta" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
			<div role="navigation">
				<ul>
					<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
					<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
				</ul>
			</div>
		</content>
		<div class="container">
			<div id="list-proposta" class="content scaffold-list" role="main">
				<g:if test="${!propostaInstanceList}">
					<div class="alert alert-warning">
						<p class="bg-warning">Não existem propostas cadastradas. Clique no botão "Nova Proposta" para efetuar um novo cadastro.</p>
					</div>
				</g:if>
				<g:else>
					<h1>Listagem de Propostas: ${usuarioLogado?.nome}</h1>
					<g:if test="${flash.message}">
						<div class="message" role="status">${flash.message}</div>
					</g:if>
				
					<table>
					<thead>
							<tr>
							
								<th><g:message code="proposta.anuncio.label" default="Anuncio" /></th>
							
								<g:sortableColumn property="dataEnvio" title="${message(code: 'proposta.dataEnvio.label', default: 'Data Envio')}" />
							
								<g:sortableColumn property="prazo" title="${message(code: 'proposta.prazo.label', default: 'Prazo')}" />
							
								<g:sortableColumn property="valor" title="${message(code: 'proposta.valor.label', default: 'Valor')}" />
							
							</tr>
						</thead>
						<tbody>
						<g:each in="${propostaInstanceList}" status="i" var="propostaInstance">
							<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
							
								<td><g:link action="show" id="${propostaInstance.id}">${propostaInstance?.anuncio?.titulo}</g:link></td>
							
								<td><g:formatDate date="${propostaInstance.dataEnvio}" /></td>
							
								<td>${fieldValue(bean: propostaInstance, field: "prazo")} dias</td>
							
								<td>${fieldValue(bean: propostaInstance, field: "valor")}</td>
							
							</tr>
						</g:each>
						</tbody>
					</table>
				</g:else>
			</div>
		</div>
	</body>
</html>
