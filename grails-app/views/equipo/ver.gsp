<html>
    <head>
        <title><g:message code="equipo.ver" args="[equipo.nombre]" /></title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
    </head>
    <body>
        <div class="nav">
      		<span class="menuButton"><a class="home" href="${resource(dir: '')}"><g:message code="general.inicio"/></a></span>
            <span class="menuButton"><g:link class="list" action="lista"><g:message code="equipo.lista" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="nuevo"><g:message code="equipo.nuevo" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="equipo.ver" args="[equipo.nombre]" /></h1>
            <g:if test="${flash.message}">
	            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="equipo.nombre" /></td>
                            <td valign="top" class="value">${fieldValue(bean: equipo, field: "nombre")}</td>
                        </tr>
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="equipo.correo" /></td>
                            <td valign="top" class="value">${fieldValue(bean: equipo, field: "correo")}</td>
                        </tr>
                        <tr>
                            <td valign="top" class="name"><g:message code="equipo.integrante1" /></td>
                            <td valign="top" class="value">${fieldValue(bean: equipo, field: "integrante1")}</td>
                        </tr>
                        <tr>
                            <td valign="top" class="name"><g:message code="equipo.semestre1" /></td>
                            <td valign="top" class="value">${fieldValue(bean: equipo, field: "semestre1")}</td>
                        </tr>
                        <tr>
                            <td valign="top" class="name"><g:message code="equipo.integrante2" /></td>
                            <td valign="top" class="value">${fieldValue(bean: equipo, field: "integrante2")}</td>
                        </tr>
                        <tr>
                            <td valign="top" class="name"><g:message code="equipo.semestre2" /></td>
                            <td valign="top" class="value">${fieldValue(bean: equipo, field: "semestre2")}</td>
                        </tr>
                        <tr>
                            <td valign="top" class="name"><g:message code="equipo.integrante3" /></td>
                            <td valign="top" class="value">${fieldValue(bean: equipo, field: "integrante3")}</td>
                        </tr>
                        <tr>
                            <td valign="top" class="name"><g:message code="equipo.semestre3" /></td>
                            <td valign="top" class="value">${fieldValue(bean: equipo, field: "semestre3")}</td>
                        </tr>
                        <tr>
                            <td valign="top" class="name"><g:message code="equipo.usuarioPC2" /></td>
                            <td valign="top" class="value">${fieldValue(bean: equipo, field: "usuarioPC2")}</td>
                        </tr>
                        <tr>
                            <td valign="top" class="name"><g:message code="equipo.contraseñaPC2" /></td>
                            <td valign="top" class="value">${fieldValue(bean: equipo, field: "contraseñaPC2")}</td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${equipo?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edita" value="${message(code: 'default.button.edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="elimina" value="${message(code: 'default.button.delete')}" onclick="return confirm('${message(code: 'equipo.confirma.baja', args:[equipo.nombre])}');" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>

