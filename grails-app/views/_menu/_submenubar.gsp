<!-- 
This menu is used to show function that can be triggered on the content (an object or list of objects).
-->

<%-- Only show the "Pills" navigation menu if a controller exists (but not for home) --%>
<g:if test="${params.controller != null && params.controller != '' && params.controller != 'home'&& params.controller != 'default'}">
    <ul id="Menu" class="nav nav-pills">

        <g:set var="entityName"
               value="${message(code: params.controller + '.label', default: params.controller.substring(0, 1).toUpperCase() + params.controller.substring(1).toLowerCase())}"/>

        <li class="${params.action == "list" ? 'active' : ''}">
            <g:link action="list"><i class="icon-th-list"></i>
                <g:message code="default.list.label" args="[entityName]" default="${entityName} List"/></g:link>
        </li>
        <li class="${params.action == "create" ? 'active' : ''}">
            <g:link action="create"><i class="icon-plus"></i>
                <g:message code="default.new.label" args="[entityName]" default="New ${entityName}"/></g:link>
        </li>

        <g:if test="${params.action == 'show' || params.action == 'edit'}">
            <!-- the item is an object (not a list) -->
            <li class="${params.action == "edit" ? 'active' : ''}">
                <g:link action="edit" id="${params.id}"><i class="icon-pencil"></i>
                    <g:message code="default.edit.label" args="[entityName]" default="Edit ${entityName}"/></g:link>
            </li>
            <li class="">
                <g:render template="/_common/modals/deleteTextLink"/>
            </li>

        </g:if>

        <g:if test="${params.action == 'list' && params.controller == 'produs'}">
            <li>
                <g:link action="printable">
                    <i class="icon-print"></i>
                    <g:message code='produs.printable.label' default='Print'/>
                </g:link>
            </li>
        </g:if>
        <g:if test="${params.action == 'printable' && params.controller == 'produs'}">
            <li>
                <g:link action="menuPdf">
                    <i class="icon-print"></i>
                    <g:message code='produs.print.label' default='Print'/>
                </g:link>
            </li>
        </g:if>

        <g:if test="${params.action == 'nota' && params.controller == 'comanda'}">
            <li>
                <g:link action="notaPdf" id="${params.id}" target="_blank">
                    <i class="icon-print"></i>
                    <g:message code="default.pdf.label" default="Print ${entityName}"/>
                </g:link>
            </li>
        </g:if>

    </ul>
</g:if>
