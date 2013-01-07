%{--<div style="color: #e32556">--}%
    %{--EU SUNT ALPHA SI OMEGA--}%
%{--</div>--}%
%{--<g:each status="i" var="c" in="${grailsApplication.controllerClasses.sort { it.logicalPropertyName }}">--}%
%{--<li class="controller${params.controller == c.logicalPropertyName ? " active" : ""}">--}%
%{--<g:link controller="${c.logicalPropertyName}" action="index">--}%
%{--<g:message code="${c.logicalPropertyName}.label" default="${c.logicalPropertyName.capitalize()}"/>--}%
%{--</g:link>--}%
%{--</li>--}%
%{--</g:each>--}%

<li class="controller${params.controller == 'produs' ? " active" : ""}">
    <g:link controller='produs' action="index">
    <g:message code="produs.label" default="${'produs'.capitalize()}"/>
    </g:link>
</li>

<li class="controller${params.controller == 'masa' ? " active" : ""}">
    <g:link controller='masa' action="index">
        <g:message code="masa.label" default="${'masa'.capitalize()}"/>
    </g:link>
</li>


<li class="controller${params.controller == 'user' && params.action != 'emailClients' ? " active" : ""}">
    <g:link controller='user' action="index">
        <g:message code="user.label" default="${'user'.capitalize()}"/>
    </g:link>
</li>

<li class="controller${params.controller == 'user' && params.action == 'emailClients' ? " active" : ""}">
    <g:link controller='user' action="emailClients">
        <g:message code="security.email.label" default="${'email'.capitalize()}"/>
    </g:link>
</li>