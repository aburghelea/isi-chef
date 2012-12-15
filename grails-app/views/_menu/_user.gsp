<%@ page import="org.codehaus.groovy.grails.plugins.springsecurity.SpringSecurityUtils; org.springframework.security.core.context.SecurityContextHolder" %>
<ul class="nav pull-right">
    <li class="dropdown dropdown-btn">
        <sec:ifNotLoggedIn>

            <a class="dropdown-toggle" role="button" data-toggle="dropdown" data-target="#" href="#" tabindex="-1">
                <!-- TODO: integrate Springsource Security etc. and show User's name ... -->
                <g:message code="user.signin.label" default="Sign in"/><b class="caret"></b>
            </a>

            <ul class="dropdown-menu" role="menu">
                <li class="form-container">

                    <g:form url="${request.contextPath}${SpringSecurityUtils.securityConfig.apf.filterProcessesUrl}"
                            method="post" accept-charset="UTF-8">
                        <input style="margin-bottom: 15px;" type="text" placeholder="${message(code: 'security.username.label', default: 'Username')}" id="username"
                               name="j_username">
                        <input style="margin-bottom: 15px;" type="password" placeholder="${message(code: 'security.password.label', default: 'Password')}" id="password"
                               name="j_password">
                        <input style="float: left; margin-right: 10px;" type="checkbox"
                               name="name='${SpringSecurityUtils.securityConfig.rememberMe.parameter}" id="remember_me"
                               value="1">
            <label class="string optional" for="remember_me">"${message(code: 'user.remember.label', default:'Remember me')}"</label>
            <input class="btn btn-primary btn-block" type="submit" id="sign-in" value="Sign In">
        </g:form>
            </li>
            <li class="divider"></li>
            <li class="button-container">
                <!-- NOTE: the renderDialog MUST be placed outside the NavBar (at least for Bootstrap 2.1.1): see bottom of main.gsp -->
                <g:render template="/_common/modals/registerTextLink"/>
            </li>
            </ul>

        </sec:ifNotLoggedIn>
        <sec:ifLoggedIn>

            <a class="dropdown-toggle" role="button" data-toggle="dropdown" data-target="#" href="#">
                <i class="icon-user icon-large icon-white"></i>
                ${SecurityContextHolder.context.authentication.name}
            </a>
            <ul class="dropdown-menu" role="menu">
                <!-- TODO: Only show menu items based on permissions -->
                <li class=""><a href="${createLink(uri: '/')}">
                    <i class="icon-user"></i>
                    <g:message code="user.show.label" default="Show"/>
                </a></li>
                <li class=""><a href="${createLink(uri: '/')}">
                    <i class="icon-cogs"></i>
                    <g:message code="user.settings.change.label" default="Settings"/>
                </a></li>

                <li class="divider"></li>
                <li class=""><a href="${createLink(uri: '/j_spring_security_logout')}">
                    <i class="icon-off"></i>
                    <g:message code="security.signoff.label" default="Sign Off"/>
                </a></li>
            </ul>

        </sec:ifLoggedIn>
    </li>
</ul>

<noscript>
    <ul class="nav pull-right">
        <li class="">
            <g:link controller="user" action="show"><g:message code="default.user.unknown.label" default="Unknown User"/></g:link>
        </li>
    </ul>
</noscript>
