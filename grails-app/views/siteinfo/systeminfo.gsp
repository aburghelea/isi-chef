<html>

<head>
    <title><g:message code="default.contact.title" default="Contact"/></title>
    <meta name="layout" content="kickstart"/>
</head>

<body>

<content tag="header">
    <header id="Header" class="jumbotron masthead">
        <div class="inner">
            <div class="container">
                <h1 class="title"><g:message code="default.tech.info.title"
                                             default="Technical Info about ${meta(name: 'app.name')}"/></h1>

                <p class="lead"><g:message code="default.tech.info.message" args="[meta(name: 'app.name')]"
                                           default="This page presents some information about the ${meta(name: 'app.name')} system."/></p>
            </div>
        </div>
    </header>
</content>

<section id="resources">
    <h1><g:message code="default.systeminfo.resources" default="Used Resources"/></h1>
    <ul>
        <li><g:message code="default.systeminfo.web.layout"
                       default="Web Layout: ${'<a href ="http://twitter.github.com/bootstrap/">Bootstrap</a>'}, from Twitter
                    Licensed under the Apache License v2.0. Documentation licensed under CC BY 3.0.
                    (@TwBootstrap , http://twitter.github.com/bootstrap/)"/></li>
        <li><g:message code="default.systeminfo.datepicker"
                       default="Datepicker: ${'<a href ="https://github.com/eternicode/bootstrap-datepicker">Datepicker for Bootstrap</a>'},
                    Copyright 2012 Stefan Petre, Improvements by Andrew Rowls, Licensed under the Apache License v2.0"/></li>
        <li><g:message code="default.systeminfo.flag.icons"
                       default="Flag Icons: ${'<a href="http://www.famfamfam.com/lab/icons/flags/">FamFamFam Flag Icons</a>'} by Mark James. They are
                    ${'<i>"available for free use for any purpose with no requirement for attribution"</i>'}."/></li>
    </ul>
</section>

<section id="application">
    <h1><g:message code="default.systeminfo.status" default="Application Status"/></h1>
    <ul>
        <li><g:message code="default.systeminfo.app.version" args="[meta(name: 'app.version')]"
                       default="App version: ${meta(name: 'app.version')}"/></li>
        <li><g:message code="default.systeminfo.grails.version" args="[meta(name: 'app.grails.version')]"
                       default=" Grails version: ${meta(name: 'app.grails.version')}"/></li>
        <li><g:message code="default.systeminfo.groovy.version"
                       args="[org.codehaus.groovy.runtime.InvokerHelper.getVersion()]"
                       default=" Groovy version: ${org.codehaus.groovy.runtime.InvokerHelper.getVersion()}"/></li>
        <li><g:message code="default.systeminfo.vjm.version" args="[System.getProperty('java.version')]"
                       default="VJM version: ${System.getProperty('java.version')}"/></li>
        <li><g:message code="default.systeminfo.reloading.active" args="[grails.util.Environment.reloadingAgentEnabled]"
                       default="Reloading active: ${grails.util.Environment.reloadingAgentEnabled}"/></li>
        <li><g:message code="default.systeminfo.controllers" args="[grailsApplication.controllerClasses.size()]"
                       default="Controllers: ${grailsApplication.controllerClasses.size()}"/></li>
        <li><g:message code="default.systeminfo.domains" args="[grailsApplication.domainClasses.size()]"
                       default="Domains: ${grailsApplication.domainClasses.size()}"/></li>
        <li><g:message code="default.systeminfo.services" args="[grailsApplication.serviceClasses.size()]"
                       default="Services: ${grailsApplication.serviceClasses.size()}"/></li>
        <li><g:message code="default.systeminfo.tag.libraries" args="[grailsApplication.tagLibClasses.size()]"
                       default="Tag Libraries: ${grailsApplication.tagLibClasses.size()}"/></li>
    </ul>
</section>

<section id="resources">
    <h1><g:message code="default.systeminfo.plugins" default="Installed Plugins"/></h1>
    <ul>
        <g:set var="pluginManager"
               value="${applicationContext.getBean('pluginManager')}"></g:set>

        <g:each var="plugin" in="${pluginManager.allPlugins.sort { it.name }}">
            <li>${plugin.name} - ${plugin.version}</li>
        </g:each>

    </ul>
</section>

</body>

</html>
