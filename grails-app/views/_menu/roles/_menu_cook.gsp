<li class="controller${params.controller == 'produs' ? " active" : ""}">
    <g:link controller='produs' action="list">
        <g:message code="menu.label" default="Menu"/>
    </g:link>
</li>

<li class="controller${params.controller == 'comanda' && params.action == 'listTakenOrders' ? " active" : ""}">
    <g:link controller="comanda" action="listTakenOrders" >
        <g:message code="comanda.preparable.label" default="Preparable"/>
    </g:link>
</li>

