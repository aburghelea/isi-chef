<div id="Content" class="container">

<!-- print system messages (infos, warnings, etc) - not validation errors -->
    <g:if test="${flash.message}">
        <div class="alert alert-info">${flash.message}</div>
    </g:if>
    <g:if test="${request.message}">
        <div class="alert alert-info">${request.message}</div>
    </g:if>

    <div class="row-fluid">
        <div class="span12">
            <g:render template="/_menu/submenubar"/>
        </div>
    </div>
    <!-- Show page's content -->
    <g:layoutBody/>
    <g:pageProperty name="page.body"/>
</div>
