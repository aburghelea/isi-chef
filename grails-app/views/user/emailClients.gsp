<%@ page import="ro.isi.auth.Role" %>
<!doctype html>
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="kickstart"/>
    <g:set var="entityName" value="${message(code: 'role.label', default: 'Role')}"/>
    <title><g:message code="default.send.email.label" args="[entityName]" default="Email clients"/></title>
</head>

<body>

<section id="create-role" class="first">

    <g:form action="email" class="form-horizontal">
        <fieldset class="form">


            <div class="control-group fieldcontain required">

                <div class="controls">
                    <g:message code="user.translates.label" default="#user = Username"/>
                </div>
            </div>
            <div class="control-group fieldcontain required">
                <label for="subject" class="control-label"   >
                <g:message code="user.subject.label" default="Subiect"/>
                <span class="required-indicator">*</span></label>

                <div class="controls">
                    <g:textField style="width:85%" name="subject"/>
                </div>
            </div>

            <div class="control-group fieldcontain required">
                <label for="text" class="control-label">
                <g:message code="user.message.label" default="Message"/>
                <span class="required-indicator">*</span></label>

                <div class="controls">
                    <g:textArea style="width:85%" rows='10' name="text"/>
                </div>
            </div>
        </fieldset>

        <div class="form-actions">
            <g:submitButton name="create" class="btn btn-primary"
                            value="${message(code: 'default.email.label', default: 'Email')}"/>
            <button class="btn" type="reset"><g:message code="default.button.cancel.label" default="Cancel"/></button>
        </div>
    </g:form>

</section>

</body>

</html>
