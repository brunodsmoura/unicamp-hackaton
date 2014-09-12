<!doctype html>
<html>
	<head>
		<meta name="layout" content="main" />
		<title>Cadastro de Usuário</title>
	</head>
	<body>
		<div class="container">
			<g:if test="${usuarioInstance?.hasErrors()}">
				<div class="row">
					<div class="alert alert-danger">
						<g:eachError bean="${usuarioInstance}">
							<p class="bg-danger"><g:message error="${it}" /></p>
						</g:eachError>
					</div>
				</div>
			</g:if>
			
			<div id="create-anuncio" class="content scaffold-create" role="main">
				<h1><g:message code="default.create.label" args="${['Usuário']}" /></h1>
			

				<form method="post" class="form-horizontal">
					<div class="form-group">
						<div class="col-lg-offset-2 col-lg-10">
							<label class="radio-inline">
							  <input type="radio" name="tipo" id="inlineRadio1" value="1" ${isContratante ? 'checked' : ''}> Contratante
							</label>
							<label class="radio-inline">
							  <input type="radio" name="tipo" id="inlineRadio2" value="2" ${!isContratante ? 'checked' : ''}> FreeLancer
							</label>
						</div>
					</div>
					<div class="form-group">
					    <label for="inputNome3" class="col-lg-2 control-label">Nome</label>
					    <div class="col-lg-10">
					      <input type="text" class="form-control" id="inputNome3" name="nome" placeholder="Nome" value="${usuarioInstance?.nome}">
					    </div>
					</div>
					<div class="form-group">
					    <label for="inputEmail3" class="col-lg-2 control-label">E-mail</label>
					    <div class="col-lg-10">
					      <input type="email" class="form-control" id="inputEmail3" name="email" placeholder="Email" value="${usuarioInstance?.email}">
					    </div>
					</div>
					<div class="form-group">
				    	<label for="inputSenha3" class="col-lg-2 control-label">Senha</label>
					    <div class="col-lg-10">
					      <input type="password" class="form-control" id="inputSenha3" name="senha" placeholder="Senha">
					    </div>
				  	</div>
				  	<div class="form-group invisible freelancer">
				    	<label for="inputCelular3" class="col-lg-2 control-label">Celular</label>
					    <div class="col-lg-10">
					      <input type="text" class="form-control" id="inputCelular3" name="celular" placeholder="(99)99999-9999">
					    </div>
				  	</div>
					<div class="form-group">
						<div class="col-lg-offset-2 col-lg-10">
							<g:actionSubmit action="save" value="Salvar" class="btn btn-default" />
							<g:actionSubmit action="cancel" value="Cancelar" class="btn btn-default" />
						</div>
				    </div>
				</form>
			</div>
		</div>
		
		<script type="text/javascript">
			$(document).ready(function(){
				$('input[type=radio][name=tipo]').click(function(){
					
				});
			});
		</script>
	</body>
</html>