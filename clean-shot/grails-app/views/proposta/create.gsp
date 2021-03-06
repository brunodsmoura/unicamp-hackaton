<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'proposta.label', default: 'Proposta')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
		
		<g:javascript src="bootstrap.min.js" />		
		<g:javascript src="jquery.blockUI.js" />		
	</head>
	<body>
		<content tag="nav-bar">
			<div role="navigation">
				<ul>
					<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
					<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				</ul>
			</div>
		</content>
		<div class="container">
			<a href="#create-proposta" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
			<div id="create-proposta" class="content scaffold-create" role="main">
				<h1><g:message code="default.create.label" args="[entityName]" /></h1>
				<g:if test="${flash.message}">
					<div class="row">
						<div class="alert alert-success" role="status">
							<h4 class="bg-success">${flash.message}</h4>
						</div>
					</div>
				</g:if>
				<g:hasErrors bean="${propostaInstance}">
					<div class="row">
						<div class="alert alert-danger">
							<g:eachError bean="${propostaInstance}" var="error">
								<h4 class="bg-danger"><g:message error="${error}"/></h4>
							</g:eachError>
						</div>
					</div>
				</g:hasErrors>
				
				<g:form url="[resource:propostaInstance, action:'save']"  class="form-horizontal">
					<g:render template="form"/>
				
					<div class="form-group">
						<div class="col-lg-offset-2 col-lg-10">
							<g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
						</div>
					</div>
				</g:form>
			</div>
		</div>
		<div class="modal container fade" id="pesquisar-anuncio"></div>
		
		<script type="text/javascript">
			$(document).ajaxStart(function(){
					$.blockUI({ message: 'Carregando...', baseZ: 2000 })
				}).ajaxStop($.unblockUI);
		</script>
	</body>
</html>