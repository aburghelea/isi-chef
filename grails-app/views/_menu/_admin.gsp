<ul class="nav pull-right">
    <li class="dropdown">
        <a class="dropdown-toggle" data-toggle="dropdown" href="#"><g:message code="default.admin.label"
                                                                              default="Admin"/><b
                class="caret"></b></a>
        <ul class="dropdown-menu">
            <li class="">
                <a tabindex="-1" href="#"><b><g:message code="default.tech.admin.label" default="Technical Admin"/></b>
                </a>
            </li>
            <g:if env="development">
                <li class=""><a href="${createLink(uri: '/dbconsole')}"><g:message code="default.dbconsole.label"
                                                                                   default="H2 Database Console"/></a>
                </li>
            </g:if>
            <li class=""><a href="${createLink(uri: '/systeminfo')}"><g:message code="default.systeminfo.label"
                                                                                default="System Info"/></a>
            </li>
            <li class="dropdown-submenu">
                <a tabindex="-1" href="#"><g:message code="default.all.controller.label" default="All Controller"/></a>
                <ul class="dropdown-menu">
                    <li class="controller"><g:link controller="home"><g:message code="default.home.controller.label"
                                                                                default="Home Controller"/></g:link></li>
                    <li class="divider"></li>
                    <g:each var="c" in="${grailsApplication.controllerClasses.sort { it.logicalPropertyName }}">
                        <g:if test="${c.logicalPropertyName != 'home'}">
                            <li class="controller"><g:link
                                    controller="${c.logicalPropertyName}">${c?.fullName?.substring(c?.fullName?.lastIndexOf('.') + 1)}</g:link></li>
                        </g:if>
                    </g:each>
                </ul>
            </li>
        </ul>
    </li>
</ul>
