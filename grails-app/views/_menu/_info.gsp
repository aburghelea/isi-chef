<ul class="nav pull-right">
	<li class="dropdown">
		<a class="dropdown-toggle" href="#"><g:message code="default.info.label" default="Info"/> <b class="caret"></b></a>
		<ul class="dropdown-menu">
		
			<%-- Note: Links to pages without controller are redirected in conf/UrlMappings.groovy --%>
			<li class=""><a href="${createLink(uri: '/about')}"><g:message code="default.about.label" default="About"/></a></li>
			<li class=""><a href="http://wordpress.com/signup/"><i><g:message code="default.blog.label" default="Blog"/></i></a></li>
			<li class=""><a href="${createLink(uri: '/contact')}"><g:message code="default.contact.label" default="Contact"/></a></li>
		</ul>
	</li>
</ul>
