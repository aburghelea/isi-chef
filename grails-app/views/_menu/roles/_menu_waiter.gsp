%{--<div style="color: #22e337">--}%
%{--EU SUNT ALPHA--}%
%{--</div>--}%

<li class="controller${params.controller == 'rezervare' ? " active" : ""}">
    <g:link controller='rezervare' action="list">
        <g:message code="rezervare.label" default="rezervare"/>
    </g:link>
</li>

<li class="controller${params.controller == 'comanda' && params.action == 'create' ? " active" : ""}">
    <g:link controller='comanda' action="create">
        <g:message code="default.create.label" args="[message(code: 'comanda.label', default: 'order')]" default="Take order"/>
    </g:link>
</li>

<li class="controller${params.controller == 'comanda' && params.action == 'deliver' ? " active" : ""}">
    <g:link controller="comanda" action="list" params="[drinks: true, sort: 'dateCreated', order: 'asc']">
        <g:message code="comanda.drinks.label" default="Deliver drinks"/>
    </g:link>
</li>