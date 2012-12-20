<html>

<head>
    <title><g:message code='spring.security.ui.forgotPassword.title' default="Forgot Password"/></title>
    <meta name='layout' content='register'/>
</head>

<body>

<p/>

<s2ui:form width='350' height='220' elementId='forgotPasswordFormContainer'
           titleCode='spring.security.ui.forgotPassword.header' titleCodeDefault='Forgot Password' center='true'>

    <g:form action='forgotPassword' name="forgotPasswordForm" autocomplete='off'>

        <g:if test='${emailSent}'>
            <br/>
            <g:message code='spring.security.ui.forgotPassword.sent' default="Sent"/>
        </g:if>

        <g:else>

            <br/>
            <h4><g:message code='spring.security.ui.forgotPassword.description' default="Description"/></h4>

            <table>
                <tr>
                    <td><label for="username"><g:message code='spring.security.ui.forgotPassword.username'
                                                         default="Username"/></label></td>
                    <td><g:textField name="username" size="25"/></td>
                </tr>
            </table>

            <s2ui:submitButton elementId='reset' form='forgotPasswordForm'
                               messageCode='spring.security.ui.forgotPassword.submit' messageCodeDefault='Submit'/>

        </g:else>

    </g:form>
</s2ui:form>

<script>
    $(document).ready(function () {
        $('#username').focus();
    });
</script>

</body>
</html>
