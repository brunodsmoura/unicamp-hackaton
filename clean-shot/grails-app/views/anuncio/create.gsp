<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'anuncio.label', default: 'Anuncio')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
	</head>
	<body>
		<content tag="nav-bar">
			<a href="#create-anuncio" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
			<div role="navigation">
				<ul>
					<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
					<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				</ul>
			</div>
		</content>
	
		<div class="container">
			<div id="create-anuncio" class="content scaffold-create" role="main">
				<h1><g:message code="default.create.label" args="[entityName]" /></h1>
				
				<g:if test="${flash.message}">
					<div class="message" role="status">${flash.message}</div>
				</g:if>
				
				<g:hasErrors bean="${anuncioInstance}">
					<ul class="errors" role="alert">
						<g:eachError bean="${anuncioInstance}" var="error">
						<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
						</g:eachError>
					</ul>
				</g:hasErrors>
				
				<g:form url="[resource:anuncioInstance, action:'save']" class="form-horizontal">
					<g:render template="form"/>
					<div class="form-group">
						<div class="col-lg-offset-2 col-lg-10">
							<g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
						</div>
					</div>
				</g:form>
			</div>
		</div>
	</body>
</html>
