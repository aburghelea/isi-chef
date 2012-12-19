<%@ page import="ro.isi.auth.Roles" %>
<sec:ifAnyGranted roles="${Roles.ROLE_WAITER},${Roles.ROLE_COOK}">
    <ul class="nav pull-right">
        <li class="">
            <sec:ifAllGranted roles="${Roles.ROLE_COOK}">
                <g:message code="comandas.label" default="Orders"/>:
                <g:link controller="comanda" action="listTakenOrders">
                    <span id="ordersIndicator" class="badge badge-important"></span>
                </g:link>
            </sec:ifAllGranted>
            <sec:ifAllGranted roles="${Roles.ROLE_WAITER}">
                <g:link controller="comanda" action="listTakenOrders">
                    <g:message code="comandas.label" default="Orders"/>:
                    <span id="ordersIndicator" class="badge badge-important"></span>
                </g:link>
            </sec:ifAllGranted>
        </li>
        <li>
            <sec:ifAllGranted roles="${Roles.ROLE_WAITER}">
                <g:link controller="comanda" action="listPreparedOrders">
                    <g:message code="drinks.label" default="Drinks"/>:
                    <span id="ordersIndicator" class="badge badge-success">10</span>
                </g:link>
            </sec:ifAllGranted>
        </li>
    </ul>

    <g:javascript src="notificator.js"/>

    <script>
        var refreshInterval = '${grailsApplication.config.ro.isi.auth.refreshTime}';
        var soundEffect = "${resource(dir: 'audio', file: 'excalamation.wav')}";

        /**
         * Seteaza variabila contentUrl (linkul de unde sa citeasca nummarul de notifcari)
         * in functie de rolul utilizatorului logat in aplicatie
         */


                <sec:ifAllGranted roles="${Roles.ROLE_COOK}">
        var counterUrl = '${createLink(controller: 'comanda', action: 'takenOrdersCounter')}';
        </sec:ifAllGranted>
        <sec:ifAllGranted roles="${Roles.ROLE_WAITER}">
        var counterUrl = '${createLink(controller: 'comanda', action: 'preparedOrdersCount')}';
        </sec:ifAllGranted>
    </script>

</sec:ifAnyGranted>