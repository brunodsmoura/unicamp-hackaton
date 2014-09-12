
<%@ page import="br.ic.unicamp.hackaton.anuncio.Anuncio" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'anuncio.label', default: 'Anuncio')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-anuncio" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-anuncio" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:if test="${flash.created}">
				<div class="message" role="status">Você acabou de criar um novo anúncio! <oauth:connect provider="twitter" id="twitter-connect-link" redirectUrl="http://127.0.0.1:8080/sendTweet?id=${params.long('id')}">Clique aqui</oauth:connect> para compartilhá-lo no Twitter!</div>
			</g:if>
			
			<ol class="property-list anuncio">
			
				<g:if test="${anuncioInstance?.valorPrevisto}">
				<li class="fieldcontain">
					<span id="valorPrevisto-label" class="property-label"><g:message code="anuncio.valorPrevisto.label" default="Valor Previsto" /></span>
					
						<span class="property-value" aria-labelledby="valorPrevisto-label"><g:fieldValue bean="${anuncioInstance}" field="valorPrevisto"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${anuncioInstance?.propostaVencedora}">
				<li class="fieldcontain">
					<span id="propostaVencedora-label" class="property-label"><g:message code="anuncio.propostaVencedora.label" default="Proposta Vencedora" /></span>
					
						<span class="property-value" aria-labelledby="propostaVencedora-label"><g:link controller="proposta" action="show" id="${anuncioInstance?.propostaVencedora?.id}">${anuncioInstance?.propostaVencedora?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${anuncioInstance?.categoria}">
				<li class="fieldcontain">
					<span id="categoria-label" class="property-label"><g:message code="anuncio.categoria.label" default="Categoria" /></span>
					
						<span class="property-value" aria-labelledby="categoria-label"><g:link controller="categoria" action="show" id="${anuncioInstance?.categoria?.id}">${anuncioInstance?.categoria?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${anuncioInstance?.contratante}">
				<li class="fieldcontain">
					<span id="contratante-label" class="property-label"><g:message code="anuncio.contratante.label" default="Contratante" /></span>
					
						<span class="property-value" aria-labelledby="contratante-label"><g:link controller="contratante" action="show" id="${anuncioInstance?.contratante?.id}">${anuncioInstance?.contratante?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${anuncioInstance?.dataCriacao}">
				<li class="fieldcontain">
					<span id="dataCriacao-label" class="property-label"><g:message code="anuncio.dataCriacao.label" default="Data Criacao" /></span>
					
						<span class="property-value" aria-labelledby="dataCriacao-label"><g:formatDate date="${anuncioInstance?.dataCriacao}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${anuncioInstance?.descricao}">
				<li class="fieldcontain">
					<span id="descricao-label" class="property-label"><g:message code="anuncio.descricao.label" default="Descricao" /></span>
					
						<span class="property-value" aria-labelledby="descricao-label"><g:fieldValue bean="${anuncioInstance}" field="descricao"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${anuncioInstance?.prazo}">
				<li class="fieldcontain">
					<span id="prazo-label" class="property-label"><g:message code="anuncio.prazo.label" default="Prazo" /></span>
					
						<span class="property-value" aria-labelledby="prazo-label"><g:fieldValue bean="${anuncioInstance}" field="prazo"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${anuncioInstance?.propostas}">
				<li class="fieldcontain">
					<span id="propostas-label" class="property-label"><g:message code="anuncio.propostas.label" default="Propostas" /></span>
					
						<g:each in="${anuncioInstance.propostas}" var="p">
						<span class="property-value" aria-labelledby="propostas-label"><g:link controller="proposta" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${anuncioInstance?.requisitos}">
				<li class="fieldcontain">
					<span id="requisitos-label" class="property-label"><g:message code="anuncio.requisitos.label" default="Requisitos" /></span>
					
						<g:each in="${anuncioInstance.requisitos}" var="r">
						<span class="property-value" aria-labelledby="requisitos-label"><g:link controller="requisito" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${anuncioInstance?.titulo}">
				<li class="fieldcontain">
					<span id="titulo-label" class="property-label"><g:message code="anuncio.titulo.label" default="Titulo" /></span>
					
						<span class="property-value" aria-labelledby="titulo-label"><g:fieldValue bean="${anuncioInstance}" field="titulo"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:anuncioInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${anuncioInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
