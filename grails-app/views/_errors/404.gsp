<html>
	<head>
		<title><g:message code="default.error404.title" default="404 - Page Not Found!"/></title>
		<meta name="layout" content="kickstart" />
	</head>

<body>
	<content tag="header">
		<!-- Empty Header -->
	</content>
	
  	<section id="Error" class="">
		<div class="big-message">
			<div class="container">
				<h1><g:message code="default.error.message" default="Oops!"/></h1>
				<h2><g:message code="default.error404.title" default="404 - Page Not Found!"/></h2>
				<p>
					<g:message code="default.error404.message" default="Sorry, an error has occured, requested page not found!"/>
				</p>
				
				<div class="actions">
					<a href="./" class="btn btn-large btn-primary">
						<i class="icon-chevron-left icon-white"></i>
						<g:message code="default.error.back.message" default="Back to Home"/>
					</a>
					<a href="/contact" class="btn btn-large btn-success">
						<i class="icon-envelope"></i>
						<g:message code="default.error.contact.support.message" default="Contact Support"/>
					</a>					
				</div>
			</div>
		</div>
	</section>
  
  
  </body>
</html>