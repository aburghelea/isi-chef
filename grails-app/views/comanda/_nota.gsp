<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strinct//EN"
   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<g:set var="comandaId" value="${comandaInstance.id}"/>
<g:render template="/_common/misc/pdfCss"/>
</head>

<div class="" style="width: 620px">
    <section class="intro" style="text-align: center;">
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
            <div class="row_before"></div>

            <div class="row-fluid">

                <div class="span2 offset2">
                    <g:message code="nota.masa.label" default="Masa"/>
                </div>

                <div class="span2">
                    ${comandaInstance.masa.number}
                </div>
            </div>

            <div class="row_after"></div>

            <div class="row-fluid">
                <div class="span2 offset2">
                    <g:message code="nota.ospatar.label" default="Ospatar"/>
                </div>

                <div class="span2">
                    ${comandaInstance.waiter.username}
                </div>
            </div>

            <div class="row_after"></div>


            <div class="row-fluid">
                <div class="span2 offset2">
                    <g:message code="nota.data.label" default="Data"/>
                </div>

                <div class="span2">
                    ${(new Date()).format("dd-MM-yyyy")}
                </div>
            </div>
        </div>
    </section>
    <div class="row_after"></div>
    <section class="info" id="nota-table">
        <div class="row_before"></div>

        <div class="row show-grid">
            <div class="span2 column">
                <g:message code="nota.produs.label" default="Produs"/>
            </div>

            <div class="span2 column">
                <g:message code="nota.cantitate.label" default="Cantitate"/>
            </div>

            <div class="span2 column">
                <g:message code="nota.pret.label" default="Pret"/>
            </div>

            <div class="span2 column">
                <g:message code="nota.valoare.label" default="Valoare"/>
            </div>
        </div>

        <div class="row_after"></div>
        <g:each in="${produsesQuantityMap}" var="productEntry">
            <g:set var="produs" value="${productEntry.key}"/>
            <g:set var="quantity" value="${productEntry.value}"/>
            <div class="row_before"></div>

            <div class="row show-grid">
                <div class="span2 column">
                    ${produs.name}
                </div>

                <div class="span2 column">
                    ${quantity}
                </div>

                <div class="span2 column">
                    ${produs.price}
                </div>

                <div class="span2 column">
                    ${produs.price * quantity}
                </div>
            </div>

            <div class="row_after"></div>
        </g:each>
    </section>

    <hr>    </hr>
    <section id="info2">
        <div class="row_before"></div>

        <div class="row-fluid show-grid">
            <div class="span10 column">
                <div class="span3">
                    <strong>
                        <g:message code="nota.total.plata.label" default="TOTAL DE PLATA:"/>
                    </strong>
                </div>

                <div class="span2 offset6">
                    <strong>
                        ${comandaInstance.getPrice()}
                    </strong>
                </div>
            </div>
        </div>

        <div class="row_after"></div>

        <div class="row_before"></div>

        <div class="row-fluid show-grid">
            <div class="span12 column">
                <div class="span3">
                    <strong>
                        <g:message code="nota.tips.label" default="Tips:"/>
                    </strong>
                </div>

                <div class="span2 offset6">
                    <strong>
                        ......
                    </strong>
                </div>
            </div>
        </div>

        <div class="row_after"></div>

        <div class="row_before"></div>

        <div class="row-fluid show-grid">
            <div class="span12 column">
                <div class="span3">
                    <strong>
                        <g:message code="nota.total.label" default="Total:"/>
                    </strong>
                </div>

                <div class="span2 offset6">
                    <strong>
                        ......
                    </strong>
                </div>
            </div>
        </div>

        <div class="row_after"></div>

        <p align="center">
            <g:message code="nota.client.label" args="[comandaId]" default=" Client: ${comandaId}"/>
        </p>

        <p align="center">
            <g:message code="nota.thanks.message" default="Multumiri"/>
        </p>

        <p align="center">
            <g:message code="note.rezervari.message"
                       args="[message(code: 'default.phone.number.message', default: '-')]"/>
        </p>
    </section>
</div>

</html>