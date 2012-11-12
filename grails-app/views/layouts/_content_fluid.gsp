<div id="Content" class="container-fluid">
	<div class="row-fluid">

		<!-- Main content on the right side -->
		<div class="span10">

			<!-- print system messages (infos, warnings, etc) - not validation errors -->
			<g:if test="${flash.message}">
				<div class="alert alert-info">${flash.message}</div>
			</g:if>

			<!-- Show page's content -->
			<g:layoutBody />
			<g:pageProperty name="page.body" />

		</div>
	</div>
</div>
