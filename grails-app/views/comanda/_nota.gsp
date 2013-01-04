<div id="container" style="width:300px;">
    <section id="intro" style="text-align: center;">
        <h5><g:message code="nota.info.antet" default="SC MIG-2000 SRL ${'<br>'} CUI: RO3501715"/></h5>

        <h3><g:message code="default.restaurant.name.message" default="isi-Chef"/></h3>
        <g:set var="comandaId" value="${comandaInstance.toString()}"/>

        <p><g:message code="nota.info.message" args="[comandaId]" default="Nota de plata nr. ${comandaId}"/></p>
        <table cellpadding="5" bgcolor="rgb(0,255,0)" style="text-align: left;" align="center">
            <thead>
            <tr>
                <td><g:message code="nota.masa.label" default="Masa"/></td>
                <td><g:message code="nota.ospatar.label" default="Ospatar"/></td>
                <td><g:message code="nota.data.label" default="Data"/></td>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>${comandaInstance.masa.number}</td>
                <td>${comandaInstance.waiter.username}</td>
                <td><script type="text/javascript">
                    var currentTime = new Date();
                    var month = currentTime.getMonth() + 1;
                    var day = currentTime.getDate();
                    var year = currentTime.getFullYear();
                    document.write(month + "/" + day + "/" + year);
                </script>
                </td>
            </tr>

            <tr>
                <td><g:message code="nota.ora.label" default="Ora"/></td>
                <td><script type="text/javascript">
                    var currentTime = new Date();
                    var hours = currentTime.getHours();
                    var minutes = currentTime.getMinutes();
                    if (minutes < 10) {
                        minutes = "0" + minutes
                    }
                    document.write(hours + ":" + minutes + " ");
                    if (hours > 11) {
                        document.write("PM");
                    } else {
                        document.write("AM");
                    }
                </script>
                </td>
            </tr>

            </tbody>

        </table>

    </section>


    <section id="nota-table">
        <table class="table">
            <thead>
            <tr>
                <th valign="top" class="name"><g:message code="nota.produs.label" default="Produs"/></th>
                <th valign="top" class="name"><g:message code="nota.cantitate.label" default="Cantitate"/></th>
                <th valign="top" class="name"><g:message code="nota.pret.label" default="Pret"/></th>
                <th valign="top" class="name"><g:message code="nota.valoare.label" default="Valoare"/></th>
            </tr>
            </thead>
            <tbody>
            <tr cellpaddinng="0" cellspacing="0">
                <td valign="top" style="text-align: left;" class="value">
                    <g:each in="${listProduses}" var="p">
                        ${p?.key}  <br>
                    </g:each>
                </td>
                <td valign="top" style="text-align: left;" class="value">
                    <g:each in="${listProduses}" var="p">
                        ${p?.value}   <br>
                    </g:each>
                </td>
                <td valign="top" style="text-align: left;" class="value">
                    <g:each in="${produsesCost}" var="p">
                        ${p?.key} <br>
                    </g:each>
                </td>
                <td valign="top" style="text-align: left;" class="value">
                    <g:each in="${produsesCost}" var="p">
                        ${p?.value} <br>
                    </g:each>

                </td>

            </tr>
            <tr class="prop" cellpaddinng="0" cellspacing="0">
                <td valign="top" style="text-align: left;" class="value"><g:message code="nota.total.plata.label"
                                                                                    default="TOTAL DE PLATA: ${'<br>'} din care TVA:"/></td>
                <td valign="top" style="text-align: left;" class="value"></td>
                <td valign="top" style="text-align: left;" class="value"></td>
                <td valign="top" style="text-align: left;" class="value">${costTotal} <br><br> ${costTotal * 16 / 100}
                </td>

            </tr>

            </tbody>
        </table>

        <p align="center"><g:message code="nota.client.label" args="[comandaId]" default=" Client: ${comandaId}"/></p>

        <p align="center"><g:message code="nota.thanks.message"
                                     default="TIPS NOT INCLUDED ${'<br>'} VA MULTUMIM ${'<br>'} THANK YOU ${'<br>'} REZERVARI LA TELEFON: 0743.061.489"/></p>
    </section>

</div>