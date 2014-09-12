<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="\${message(code: '${domainClass.propertyName}.label', default: '${className}')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="container">
			<a href="#create-${domainClass.propertyName}" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
			<div class="nav" role="navigation">
				<ul>
					<li><a class="home" href="\${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
					<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				</ul>
			</div>
			<div id="create-${domainClass.propertyName}" class="content scaffold-create" role="main">
				<h1><g:message code="default.create.label" args="[entityName]" /></h1>
				<g:if test="\${flash.message}">
					<div class="row">
						<div class="alert alert-success" role="status">
							<h4 class="bg-success">\${flash.message}</h4>
						</div>
					</div>
				</g:if>
				<g:hasErrors bean="\${${propertyName}}">
					<div class="row">
						<div class="alert alert-danger">
							<g:eachError bean="\${${propertyName}}" var="error">
								<h4 class="bg-danger"><g:message error="\${error}"/></h4>
							</g:eachError>
						</div>
					</div>
				</g:hasErrors>
				
				<g:form url="[resource:${propertyName}, action:'save']" <%= multiPart ? ' enctype="multipart/form-data"' : '' %> class="form-horizontal">
					<g:render template="form"/>
				
					<div class="form-group">
						<div class="col-lg-offset-2 col-lg-10">
							<g:submitButton name="create" class="save" value="\${message(code: 'default.button.create.label', default: 'Create')}" />
						</div>
					</div>
				</g:form>
			</div>
		</div>
	</body>
</html>