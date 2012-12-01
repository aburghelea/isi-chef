<%@ page import="ro.isi.auth.Roles" %>
<sec:ifLoggedIn>
    <ul class="nav pull-right">
        <li class="">
            <a href="#">
                <sec:ifAnyGranted roles="${Roles.ROLE_WAITER},${Roles.ROLE_COOK}">
                    <span id="ordersIndicator" class="badge badge-important"></span>
                </sec:ifAnyGranted>
            </a>
        </li>
    </ul>

    <g:javascript src="notificator.js"/>

    <r:script>
        var refreshInterval = '${grailsApplication.config.ro.isi.auth.refreshTime}';
        var counterUrl = '${createLink(controller: 'comanda', action: 'takenOrders')}';
    </r:script>

</sec:ifLoggedIn>