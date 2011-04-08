<html>
    <head>
        <title><g:message code="integrante.ver" args="[integrante.nombre]" /></title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><g:link class="home" controller="admin"><g:message code="general.admin" /></g:link></span>
            <span class="menuButton"><g:link class="list" action="lista"><g:message code="integrante.lista" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="nuevo"><g:message code="integrante.nuevo" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="integrante.ver" args="[integrante.nombre]" /></h1>
            <g:if test="${flash.message}">
	            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="integrante.nombreCompleto" /></td>
                            <td valign="top" class="value">${fieldValue(bean: integrante, field: "nombreCompleto")}</td>
                        </tr>
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="integrante.semestre" /></td>
                            <td valign="top" class="value">${fieldValue(bean: integrante, field: "semestre")}</td>
                        </tr>
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="integrante.correo" /></td>
                            <td valign="top" class="value">${fieldValue(bean: integrante, field: "correo")}</td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${integrante?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edita" value="${message(code: 'default.button.edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="elimina" value="${message(code: 'default.button.delete')}" onclick="return confirm('${message(code: 'integrante.confirma.baja', args:[integrante.nombre])}');" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>

