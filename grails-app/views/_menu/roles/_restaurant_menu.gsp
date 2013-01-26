<%@ page import="ro.isi.auth.Roles" %>

<li class="controller${params.controller == 'home' && (params.action == '' || params.action == 'index') ? " active" : ""}">
    <g:link controller='home' action="index">
        <g:message code="default.home.label" default="${'Home'}"/>
    </g:link>
</li>
<sec:ifAllGranted roles="${Roles.ADMINISTRATOR}">
    <g:render template="/_menu/roles/menu_admin"/>
</sec:ifAllGranted>
<sec:ifNotGranted roles="${Roles.ADMINISTRATOR},${Roles.COOK},${Roles.WAITER}">
    <g:render template="/_menu/roles/menu_generic"/>
</sec:ifNotGranted>
<sec:ifAllGranted roles="${Roles.WAITER}">
    <g:render template="/_menu/roles/menu_waiter"/>
</sec:ifAllGranted>
<sec:ifAllGranted roles="${Roles.COOK}">
    <g:render template="/_menu/roles/menu_cook"/>
</sec:ifAllGranted>
