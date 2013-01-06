<html>

<head>
    <title><g:message code="default.about.title" args="[meta(name: 'app.name')]"/></title>
    <meta name="layout" content="kickstart"/>
</head>

<body>

<section id="intro">
    <h1><g:message code="default.about.welcome"/></h1>

    <p>
        <g:message code="default.about.message1"/>
        <g:message code="default.about.message2"/>
        <g:message code="default.about.message3"/>
    </p>
</section>

<section id="additional">
    <div class="pic1" style="float:left; margin-left:20px; margin-bottom:80px;">
        <span style=" font-family: Arial, Helvetica, sans-serif; font-size: 20px; color: #BBBBBB;">
            <g:message code="default.about.atmo" default="Atmosfera deosebita"/>
        </span><br>
        <img height="300" width="300" src="${resource(dir: 'images', file: 'about1.jpg')}" alt="About1"/>
    </div>

    <div class="pic1" style="float:left; margin-left:60px; margin-bottom:80px;">
        <span style=" font-family: Arial, Helvetica, sans-serif; font-size: 20px; color: #BBBBBB;">
            <g:message code="default.about.kitchen" default="Bucatarie internationala"/>
        </span><br>
        <img height="300" width="300" src="${resource(dir: 'images', file: 'about2.jpg')}" alt="About2"/>

    </div>
</section>

<div style="clear:both"/>
%{--<section  style="padding-top: 0">--}%
    <div id="fb-root"></div>
    <script>(function (d, s, id) {
        var js, fjs = d.getElementsByTagName(s)[0];
        if (d.getElementById(id)) return;
        js = d.createElement(s);
        js.id = id;
        js.src = "//connect.facebook.net/en_US/all.js#xfbml=1";
        fjs.parentNode.insertBefore(js, fjs);
    }(document, 'script', 'facebook-jssdk'));</script>

    %{--<div class="pic1" style="float:left; margin-left:20px; margin-bottom:80px;">--}%
        <div class="fb-comments" data-href="http://isi.arr.com" data-width="600" data-num-posts="4"
             data-colorscheme="light"></div>
    %{--</div>--}%
%{--</section>--}%

</body>

</html>
