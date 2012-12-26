<head>
    <meta name='layout' content='kickstart'/>
    <title><g:message code="springSecurity.denied.title" default="Denied"/></title>
</head>

<body>
<div class='body'>
    <div class='errors'><g:message code="springSecurity.redirect.message" default="Authentification denied"
                                   args="[3]"/></div>

    <INPUT TYPE="BUTTON" VALUE="Go Back" ONCLICK="history.go(-1)">
</div>
<r:script>
    var redirectInterval = parseInt('${grailsApplication.config.ro.isi.auth.redirectTime}');
    $(document).ready(function() {
            console.log(redirectInterval);
            setInterval('updateSeconds()', 1000);
    });

    function updateSeconds() {
        if (redirectInterval == 0)
            history.go(-1);
        $('#redir_secs').html(redirectInterval / 1000);
        redirectInterval -= 1000;

    }
</r:script>
</body>
