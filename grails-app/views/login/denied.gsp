<head>
    <meta name='layout' content='kickstart'/>
    <title><g:message code="springSecurity.denied.title"/></title>

    <script type="text/javascript">
        var redirectInterval = '${grailsApplication.config.ro.isi.auth.redirectTime}';
        $(document).ready(function () {
            $("#seconds").html(redirectInterval / 1000);
            setInterval('updateRemainingTime()', 1000);
            setTimeout( 'history.go(-1)' , redirectInterval);
        });

        var updateRemainingTime = function () {
            var container = $("#seconds");
            var value = parseInt($(container).html());
            $(container).html(value - 1);
        };

    </script>
</head>

<body>
<div class='body'>
    <div class='errors'>
        <g:message code="springSecurity.denied.message"/>
        <g:message code="springSecurity.redirect.message"/>
        <span id="seconds"></span>
        <g:message code="springSecurity.redirect.seconds"/></div>
</div>
</body>
