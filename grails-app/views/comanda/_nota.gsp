<g:set var="comandaId" value="${comandaInstance.id}"/>
<div class="container">
    <section id="intro" style="text-align: center;">
        <h4>
            <g:message code="default.restaurant.name.message" default="isi-Chef"/>
        </h4>

        <h5>
            <g:message code="nota.info.antet" default="SC MIG-2000 SRL ${'<br>'} CUI: RO3501715"/>
        </h5>

        <h3>
            <g:message code="nota.info.message" args="[comandaId]" default="Nota de plata nr. ${comandaId}"/>
        </h3>

        <div class="container">
            <div class="row-fluid">

                <div class="span3 offset3">
                    <g:message code="nota.masa.label" default="Masa"/>
                </div>

                <div class="span3">
                    ${comandaInstance.masa.number}
                </div>
            </div>


            <div class="row-fluid">
                <div class="span3 offset3">
                    <g:message code="nota.ospatar.label" default="Ospatar"/>
                </div>

                <div class="span3">
                    ${comandaInstance.waiter.username}
                </div>
            </div>

            <div class="row-fluid">
                <div class="span3 offset3">
                    <g:message code="nota.data.label" default="Data"/>
                </div>

                <div class="span3">
                    ${(new Date()).format("dd-MM-yyyy")}
                </div>
            </div>
        </div>
    </section>

    <div class="container" id="nota-table">

        <div class="row show-grid">
            <div class="span3 column">
                <g:message code="nota.produs.label" default="Produs"/>
            </div>

            <div class="span3 column">
                <g:message code="nota.cantitate.label" default="Cantitate"/>
            </div>

            <div class="span3 column">
                <g:message code="nota.pret.label" default="Pret"/>
            </div>

            <div class="span3 column">
                <g:message code="nota.valoare.label" default="Valoare"/>
            </div>
        </div>
        <g:each in="${produsesQuantityMap}" var="productEntry">
            <g:set var="produs" value="${productEntry.key}"/>
            <g:set var="quantity" value="${productEntry.value}"/>
            <div class="row show-grid">
                <div class="span3 column">
                    ${produs.name}
                </div>

                <div class="span3 column">
                    ${quantity}
                </div>

                <div class="span3 column">
                    ${produs.price}
                </div>

                <div class="span3 column">
                    ${produs.price * quantity}
                </div>
            </div>
        </g:each>
    </div>
    <hr>

    <div class="row-fluid show-grid">
        <div class="span12 column">
            <div class="span3">
                <strong>
                    <g:message code="nota.total.plata.label" default="TOTAL DE PLATA:"/>
                </strong>
            </div>

            <div class="span3 offset6">
                <strong>
                    ${comandaInstance.getPrice()}
                </strong>
            </div>
        </div>
    </div>

    <div class="row-fluid show-grid">
        <div class="span12 column">
            <div class="span3">
                <strong>
                    <g:message code="nota.tips.label" default="Tips:"/>
                </strong>
            </div>

            <div class="span3 offset6">
                <strong>
                    ...
                </strong>
            </div>
        </div>
    </div>

    <div class="row-fluid show-grid">
        <div class="span12 column">
            <div class="span3">
                <strong>
                    <g:message code="nota.total.label" default="Total:"/>
                </strong>
            </div>

            <div class="span3 offset6">
                <strong>
                    ...
                </strong>
            </div>
        </div>
    </div>

    <p align="center">
        <g:message code="nota.client.label" args="[comandaId]" default=" Client: ${comandaId}"/>
    </p>

    <p align="center">
        <g:message code="nota.thanks.message" default="Multumiri"/>
    </p>
    <p align="center">
        <g:message code="note.rezervari.message"
                   args="[message(code:'default.phone.number.message', default: '-')]"/>
    </p>

</div>