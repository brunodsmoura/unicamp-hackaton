
<%@ page import="br.ic.unicamp.hackaton.anuncio.Proposta" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'proposta.label', default: 'Proposta')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-proposta" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-proposta" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list proposta">
			
				<g:if test="${propostaInstance?.anuncio}">
				<li class="fieldcontain">
					<span id="anuncio-label" class="property-label"><g:message code="proposta.anuncio.label" default="Anuncio" /></span>
					
						<span class="property-value" aria-labelledby="anuncio-label"><g:link controller="anuncio" action="show" id="${propostaInstance?.anuncio?.id}">${propostaInstance?.anuncio?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${propostaInstance?.dataEnvio}">
				<li class="fieldcontain">
					<span id="dataEnvio-label" class="property-label"><g:message code="proposta.dataEnvio.label" default="Data Envio" /></span>
					
						<span class="property-value" aria-labelledby="dataEnvio-label"><g:formatDate date="${propostaInstance?.dataEnvio}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${propostaInstance?.prazo}">
				<li class="fieldcontain">
					<span id="prazo-label" class="property-label"><g:message code="proposta.prazo.label" default="Prazo" /></span>
					
						<span class="property-value" aria-labelledby="prazo-label"><g:fieldValue bean="${propostaInstance}" field="prazo"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${propostaInstance?.profissional}">
				<li class="fieldcontain">
					<span id="profissional-label" class="property-label"><g:message code="proposta.profissional.label" default="Profissional" /></span>
					
						<span class="property-value" aria-labelledby="profissional-label"><g:link controller="freeLancer" action="show" id="${propostaInstance?.profissional?.id}">${propostaInstance?.profissional?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${propostaInstance?.valor}">
				<li class="fieldcontain">
					<span id="valor-label" class="property-label"><g:message code="proposta.valor.label" default="Valor" /></span>
					
						<span class="property-value" aria-labelledby="valor-label"><g:fieldValue bean="${propostaInstance}" field="valor"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:propostaInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${propostaInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
