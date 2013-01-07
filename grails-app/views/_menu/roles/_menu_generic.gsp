<li class="controller${params.controller == 'rezervare' ? " active" : ""}">
    <g:link controller='rezervare' action="create">
        <g:message code="rezervare.label" default="Rezervare"/>
    </g:link>
</li>

<li class="controller${params.controller == 'home' && params.action =='about' ? " active" : ""}">
    <g:link controller='home' action="about">
        <g:message code="default.about.label" default="About"/>
    </g:link>
</li>


<li class="controller${params.controller == 'home' && params.action =='contact' ? " active" : ""}">
    <g:link controller='home' action="contact">
        <g:message code="default.contact.label" default="Contact"/>
    </g:link>
</li>

<li class="controller${params.controller == 'produs' ? " active" : ""}">
    <g:link controller='produs' action="list">
        <g:message code="menu.label" default="Menu"/>
    </g:link>
</li>