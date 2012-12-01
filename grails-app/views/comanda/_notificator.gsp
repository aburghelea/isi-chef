<%@ page import="ro.isi.auth.Roles" %>
<sec:ifAnyGranted roles="${Roles.ROLE_WAITER},${Roles.ROLE_COOK}">
    <ul class="nav pull-right">
        <li class="">
            <a href="#">

                <span id="ordersIndicator" style="display: block" class="badge badge-important"></span>
            </a>
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