<html>
    <head>
        <title><g:message code="integrante.nuevo" /></title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:javascript library="jquery" />
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><g:link class="home" controller="admin"><g:message code="general.admin" /></g:link></span>
            <span class="menuButton"><g:link class="list" action="lista"><g:message code="integrante.lista" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="integrante.nuevo" /></h1>
            <g:if test="${flash.message}">
	            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${integrante}">
            <div class="errors">
                <g:renderErrors bean="${integrante}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="crea" method="post" >
                <div class="dialog">
                    <table>
                        <tbody>
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="nombre"><g:message code="integrante.nombre" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: integrante, field: 'nombre', 'errors')}">
                                    <g:textField name="nombre" maxlength="64" value="${integrante?.nombre}" />
                                </td>
                            </tr>
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="apellido"><g:message code="integrante.apellido" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: integrante, field: 'apellido', 'errors')}">
                                    <g:textField name="apellido" maxlength="64" value="${integrante?.apellido}" />
                                </td>
                            </tr>
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="semestre"><g:message code="integrante.semestre" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: integrante, field: 'semestre', 'errors')}">
                                    <g:select name="semestre" from="${integrante.constraints.semestre.inList}" value="${integrante?.semestre}" valueMessagePrefix="integrante.semestre"  />
                                </td>
                            </tr>
							<tr class="prop">
                                <td valign="top" class="name">
                                    <label for="año"><g:message code="integrante.año.label" default="Año" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: integranteInstance, field: 'año', 'errors')}">
                                    <g:datePicker name="año" precision="year" value="${integranteInstance?.año}"  />
                                </td>
                            </tr>
							<tr class="prop">
                                <td valign="top" class="name">
                                    <label for="correo"><g:message code="integrante.correo" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: integrante, field: 'correo', 'errors')}">
                                    <g:textField name="correo" maxlength="64" value="${integrante?.correo}" />
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:submitButton name="create" class="save" value="${message(code: 'default.button.create')}" /></span>
                </div>
            </g:form>
        </div>
        <g:javascript>
            jQuery(document).ready(function() {
                jQuery('#nombre').focus();
            });
        </g:javascript>
    </body>
</html>

