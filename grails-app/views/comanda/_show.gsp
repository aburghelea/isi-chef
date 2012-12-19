<section id="show-comanda" class="first">

    <table class="table">
        <tbody>
        <tr class="prop">
            <td valign="top" class="name"><g:message code="comanda.waiter.label" default="Waiter"/></td>

            <td valign="top" class="value">
                <g:link controller="user" action="show" id="${comandaInstance?.waiter?.id}">
                    ${comandaInstance?.waiter?.username?.encodeAsHTML()}
                </g:link>
            </td>

        </tr>


        <tr class="prop">
            <td valign="top" class="name"><g:message code="comanda.masa.label" default="Masa"/></td>

            <td valign="top" class="value">
                <g:link controller="masa" action="show" id="${comandaInstance?.masa?.id}">
                    ${comandaInstance?.masa?.number?.encodeAsHTML() + " " + comandaInstance?.masa?.description?.encodeAsHTML()}
                </g:link>
            </td>

        </tr>
        <tr class="prop">
            <td valign="top" class="name"><g:message code="comanda.drinks.label" default="Drinks served?"/> </td>
            <td valign="top" class="value">
                <g:formatBoolean boolean="${comandaInstance?.drinksServerd}" />
            </td>
        </tr>

        <tr class="prop">
            <td valign="top" class="name"><g:message code="comanda.produses.label" default="Produses"/></td>

            <td valign="top" style="text-align: left;" class="value">

                <g:each in="${comandaInstance.produses}" var="p">
                    <ul>
                        <li>
                            <g:link controller="produs" action="show" id="${p.id}">
                                ${p?.name?.encodeAsHTML()}
                            </g:link>
                        </li>
                        <li>
                            ${p?.description?.encodeAsHTML()}
                        </li>
                        <li>
                            Price: ${p?.price?.encodeAsHTML()}
                        </li>
                        <li>
                            Type: ${p?.type?.encodeAsHTML()}
                        </li>
                    </ul>
                </g:each>

            </td>

        </tr>
        <tr class="prop">
            <td valign="top" class="name"><g:message code="comanda.cook.label" default="Cook"/></td>

            <td valign="top" class="value"><g:link controller="user" action="show"
                                                   id="${comandaInstance?.cook?.id}">${comandaInstance?.cook?.username?.encodeAsHTML()}</g:link></td>

        </tr>

        </tbody>
    </table>
</section>