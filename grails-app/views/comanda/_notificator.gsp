<%@ page import="ro.isi.auth.Roles" %>
<sec:ifAnyGranted roles="${Roles.ROLE_WAITER},${Roles.ROLE_COOK}">
    <ul class="nav pull-right">
        <li>
            <sec:ifAllGranted roles="${Roles.ROLE_COOK}">
                <g:link controller="comanda" action="listTakenOrders">
                    <g:message code="order.taken.label" default="Comenzi preluate"/>
                    <span name="ordersIndicator" class="badge badge-important"></span>
                </g:link>
            </sec:ifAllGranted>
            <sec:ifAllGranted roles="${Roles.ROLE_WAITER}">
                <g:link controller="comanda" action="listPreparedOrders">
                    <g:message code="order.prepared.label" default="Comenzi preparate"/>
                    <span name="ordersIndicator" class="badge badge-important"></span>
                </g:link>
            </sec:ifAllGranted>
        </li>
    </ul>

    <g:javascript src="notificator.js"/>

    <script type="text/javascript">
        var refreshInterval = '${grailsApplication.config.ro.isi.auth.refreshTime}';
        var soundEffect = "${resource(dir: 'audio', file: 'excalamation.wav')}";

        /*
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