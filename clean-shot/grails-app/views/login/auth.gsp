<html>
<head>
	<meta name='layout' content='main'/>
	<title><g:message code="springSecurity.login.title"/></title>
	<style type='text/css' media='screen'>
	#login {
		margin: 15px 0px;
		padding: 0px;
		text-align: center;
	}

	#login .inner {
		width: 500px;
		padding-bottom: 6px;
		margin: 60px auto;
		text-align: left;
		border: 1px solid #aab;
		background-color: #f0f0fa;
		-moz-box-shadow: 2px 2px 2px #eee;
		-webkit-box-shadow: 2px 2px 2px #eee;
		-khtml-box-shadow: 2px 2px 2px #eee;
		box-shadow: 2px 2px 2px #eee;
	}

	#login .inner .fheader {
		padding: 18px 26px 14px 26px;
		background-color: #f7f7ff;
		margin: 0px 0 14px 0;
		color: #2e3741;
		font-size: 18px;
		font-weight: bold;
	}

	#login .inner .cssform p {
		clear: left;
		margin: 0;
		padding: 4px 0 3px 0;
		padding-left: 105px;
		margin-bottom: 20px;
		height: 1%;
	}

	#login .inner .cssform input[type='text'] {
		width: 120px;
	}

	#login .inner .cssform label {
		font-weight: bold;
		float: left;
		text-align: right;
		margin-left: -105px;
		width: 110px;
		padding-top: 3px;
		padding-right: 10px;
	}

	#login #remember_me_holder {
		padding-left: 120px;
	}

	#login #submit {
		margin-left: 15px;
	}

	#login .inner .login_message {
		padding: 6px 25px 20px 25px;
		color: #c33;
	}

	#login .inner .text_ {
		width: 120px;
	}

	#login .inner .chk {
		height: 12px;
	}
	</style>
</head>

<body>
<div id='login'>
	<div class='inner'>
		<div class='fheader'><g:message code="springSecurity.login.header"/></div>

		<g:if test='${flash.message}'>
			<div class='login_message'>${flash.message}</div>
		</g:if>

		<form action='${postUrl}' method='POST' id='loginForm' class='form-horizontal' autocomplete='off'>
			<div class="form-group">
				<label for='username' class="label-control col-lg-2"><g:message code="springSecurity.login.username.label"/>:</label>
				<div class="col-lg-10">
					<input type='text' class='form-control' name='j_username' id='username'/>
				</div>
			</div>

			<div class="form-group">
				<label for='password' class="label-control col-lg-2"><g:message code="springSecurity.login.password.label"/>:</label>
				<div class="col-lg-10">
					<input type='password' class='form-control' name='j_password' id='password'/>
				</div>
			</div>

			<div class="form-group">
				<div class="col-lg-offset-2 col-lg-8">
					<p><g:link controller="usuario" action="create">Cadastre-se!</g:link></p>
					<p><oauth:connect provider="linkedin" id="linkedin-connect-link">Cadastre-se via Linkedin!</oauth:connect></p>
				</div>
			</div>


			<div class="form-group">
				<div class="col-lg-offset-2 col-lg-10">
					<input type='submit' id="submit" value='${message(code: "springSecurity.login.button")}'/>
				</div>
			</div>
			
		</form>
	</div>
</div>
<script type='text/javascript'>
	<!--
	(function() {
		document.forms['loginForm'].elements['j_username'].focus();
	})();
	// -->
</script>
</body>
</html>
