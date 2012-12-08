<html>

<head>
    <title><g:message code="default.contact.message" default="Contact"/></title>
    <meta name="layout" content="kickstart"/>
    <g:set var="googleMap"
           value="https://maps.google.ro/maps?f=q&amp;source=s_q&amp;hl=en&amp;geocode=&amp;q=Strada+Stavropoleos+5,+Bucure%C8%99ti&amp;aq=0&amp;oq=Strada+Stavropoleos+5&amp;sll=44.4383,26.095222&amp;sspn=0.342697,0.837021&amp;ie=UTF8&amp;hq=&amp;hnear=Strada+Stavropoleos+5,+Sector+3,+Bucure%C8%99ti,+Bucure%C5%9Fti&amp;t=m&amp;ll=44.435496,26.09798&amp;spn=0.010725,0.018196&amp;z=15"/>
</head>

<body>

<section id="intro">
    <p class="lead">
        <g:message code="default.intro.message" default="Pentru orice alte informaţii, vă stăm la dispoziţie!"/>
    </p>
</section>

<section id="address">
    <div class="row">
        <div class="span4">
            <h1><g:message code="default.address.title.message" default="Adresa :"/></h1>
            <address>
                <strong>
                    <g:message code="default.restaurant.name.message" default="isi-Chef"/>
                </strong>
                <br/>
                <g:message code="default.address.street.message" default="Strada Stavropoleos 5"/>
                <br/>
                <g:message code="default.address.region.message" default="Sector 6, Bucuresti."/>
                <br/>
            </address>
            <address>
                <div class="row">
                    <span class="span1">
                        <strong><abbr title="${message(code: 'default.phone.title.message', default: "Phone: ")}">
                            <g:message code="default.phone.title.message" default="Telefon :"/></abbr></strong>
                    </span>
                    <span class="span3">
                        <g:message code="default.phone.number.message" default="0743.061.489"/>
                    </span>
                </div>

                <div class="row">
                    <span class="span1">
                        <strong><abbr title="${message(code: 'default.fax.title.message', default: "Fax: ")}"><g:message
                                code="default.fax.title.message" default="Fax :"/></abbr>
                        </strong>
                    </span>
                    <span class="span3">
                        <g:message code="default.fax.number.message" default="021 313.75.60"/>
                    </span>
                </div>
            </address>
            <address>
                <div class="row">
                    <span class="span1">
                        <strong><g:message code="default.email.title.message" default="Email :"/></strong>
                    </span>
                    <span class="span3">
                        <a href="mailto:${message(code: 'default.email.address.message', default: "icemanftg@gmail.com: ")}">
                            <g:message code="default.email.address.message" default="iceman.ftg@gmail.com"/></a>
                    </span>
                </div>
            </address>
            <address>
                <div class="row">
                    <span class="span1">
                        <strong><g:message code="default.team.title.message" default="Echipa:"/></strong>
                    </span>
                    <span class="span3">
                        <g:message code="default.team.member1.message" default="Burghelea Alexandru"/><br/>
                        <g:message code="default.team.member2.message" default="Manea Razvan"/><br/>
                        <g:message code="default.team.member3.message" default="Lapadus Razvan"/><br/>
                        <g:message code="default.team.member4.message" default="Stoenescu Radu"/><br/>
                        <g:message code="default.team.member5.message" default="Bocearov Irina"/><br/>
                    </span>
                </div>
            </address>
        </div>

        <div class="span8">
            <iframe width="650"
                    height="350"
                    frameborder="0"
                    scrolling="no"
                    marginheight="0"
                    marginwidth="0"
                    src="${googleMap}&amp;output=embed">

            </iframe>
            <br/>
            <small>
                <a href="${googleMap}" style="color:#0000FF;text-align:left">
                    <g:message code="default.map.label" default="View Larger Map"/>
                </a>
            </small>
        </div>
    </div>
</section>

</body>

</html>
