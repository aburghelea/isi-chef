<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strinct//EN"
   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <g:render template="/_common/misc/pdfCss"/>
</head>

<body>

<section id="list-produs" class="first">

    %{--<div style="width: 50%;font-size: 10px">--}%
    %{--<div style="zoom: 0.9; -moz-transform: scale(0.9); -moz-transform-origin: 0 0;font-size:0.9em">--}%
        <g:each in="${produsInstanceMap.keySet()}" var="produsKey">
            <h2>${produsKey}</h2>
            <ul class="nav">
                <li class="row show-grid">
                    <strong>
                        <span class="span1 column">
                            <g:message code='produs.nr.label' default='Crt. nr.'/>
                        </span>
                        <span class="span2 column">
                            <g:message code='produs.name.label' default='Name'/>
                        </span>
                        <span class="span1 column">
                            <g:message code='produs.code.label' default='Code'/>
                        </span>
                        <span class="span1 column">
                            <g:message code='produs.price.label' default='Price'/>
                        </span>
                        <span class="span2 column">
                            <g:message code='produs.preparationTime.label' default='Preparation Time'/>
                        </span>
                        <span class="span5 column">
                            <g:message code='produs.description.label' default='Description'/>
                        </span>
                    </strong>
                </li>

                <div class="row_after"></div>

                <div class="row_before"></div>
                <g:each in="${produsInstanceMap.get(produsKey)}" var="produs" status="i">
                    <div class="row_before"></div>
                    <li class="row show-grid">
                        <span class="span1 column">
                            ${i}
                        </span>
                        <span class="span2 column">
                            ${produs.name}
                        </span>
                        <span class="span1 column">
                            ${produs.code}
                        </span>
                        <span class="span1 column">
                            ${produs.price}
                        </span>
                        <span class="span2 column">
                            ${produs.preparationTime}
                        </span>
                        <span class="span5 column">
                            ${produs.description}
                        </span>
                    </li>

                    <div class="row_after"></div>
                </g:each>
            </ul>
        </g:each>
    %{--</div>--}%
</section>
</body>
</html>