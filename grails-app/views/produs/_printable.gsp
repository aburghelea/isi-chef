<g:each in="${produsInstanceMap.keySet()}" var="produsKey">
    <h2>${produsKey}</h2>
    <ul class="nav">
        <li class="row-fluid">
            <strong>
                <span class="span1"><g:message code='produs.nr.label' default='Crt. nr.'/> </span>
                <span class="span3"><g:message code='produs.name.label' default='Name'/></span>
                <span class="span1"><g:message code='produs.code.label' default='Code'/></span>
                <span class="span1"><g:message code='produs.price.label' default='Price'/></span>
                <span class="span1"><g:message code='produs.preparationTime.label' default='Preparation Time'/></span>
                <span class="span5"><g:message code='produs.description.label' default='Description'/></span>
            </strong>
        </li>
        <g:each in="${produsInstanceMap.get(produsKey)}" var="produs" status="i">
            <li class="row-fluid">
                <span class="span1">${i}</span>
                <span class="span3">${produs.name}</span>
                <span class="span1">${produs.code}</span>
                <span class="span1">${produs.price}</span>
                <span class="span1">${produs.preparationTime}</span>
                <span class="span5">${produs.description}</span>
            </li>
        </g:each>
    </ul>
</g:each>