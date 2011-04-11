<html>
    <head>
        <title><g:message code="equipo.edita" args="[equipo.nombre]" /></title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:javascript library="jquery" />
    </head>
    <body>
        <div class="nav">
		    <span class="menuButton"><a class="home" href="${resource(dir: '')}"><g:message code="general.inicio"/></a></span>
            <span class="menuButton"><g:link class="list" action="lista"><g:message code="equipo.lista" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="equipo.edita" args="[equipo.nombre]" /></h1>
            <g:if test="${flash.message}">
	            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${equipo}">
            <div class="errors">
                <g:renderErrors bean="${equipo}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="actualiza" method="post" >
                <g:hiddenField name="id" value="${equipo?.id}" />
                <g:hiddenField name="version" value="${equipo?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="nombre"><g:message code="equipo.nombre" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: equipo, field: 'nombre', 'errors')}">
                                    <g:textField name="nombre" maxlength="64" value="${equipo?.nombre}" />
                                </td>
                            </tr>
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="integrante1"><g:message code="equipo.integrante1" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: equipo, field: 'integrante1', 'errors')}">
                                    <g:textField name="integrante1" maxlength="64" value="${equipo?.integrante1}" />
                                </td>
                            </tr>
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="semestre1"><g:message code="equipo.semestre1" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: equipo, field: 'semestre1', 'errors')}">
                                    <g:select name="semestre1" from="${equipo.constraints.semestre1.inList}" value="${equipo?.semestre1}" valueMessagePrefix="equipo.semestre1"  />
                                </td>
                            </tr>
							<tr class="prop">
                                <td valign="top" class="name">
                                    <label for="correo"><g:message code="equipo.correo" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: equipo, field: 'correo', 'errors')}">
                                    <g:textField name="correo" maxlength="64" value="${equipo?.correo}" />
                                </td>
                            </tr>
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="equipo2"><g:message code="equipo.integrante2" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: equipo, field: 'integrante2', 'errors')}">
                                    <g:textField name="integrante2" maxlength="64" value="${equipo?.integrante2}" />
                                </td>
                            </tr>
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="semestre2"><g:message code="equipo.semestre2" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: equipo, field: 'semestre2', 'errors')}">
                                    <g:select name="semestre2" from="${equipo.constraints.semestre2.inList}" value="${equipo?.semestre2}" valueMessagePrefix="equipo.semestre2"  />
                                </td>
                            </tr>
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="integrant3"><g:message code="equipo.integrante3" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: equipo, field: 'integrante2', 'errors')}">
                                    <g:textField name="integrante3" maxlength="64" value="${equipo?.integrante3}" />
                                </td>
                            </tr>
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="semestre3"><g:message code="equipo.semestre3" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: equipo, field: 'semestre3', 'errors')}">
                                    <g:select name="semestre3" from="${equipo.constraints.semestre3.inList}" value="${equipo?.semestre3}" valueMessagePrefix="equipo.semestre3"  />
                                </td>
                            </tr>
                        	<tr class="prop">
                            	<td valign="top" class="name">
                            	 	<label for="usuarioPC2"><g:message code="equipo.usuarioPC2" /></label>
                            	 </td>
                            	<td valign="top" class="value">
                            		${fieldValue(bean: equipo, field: "usuarioPC2")}
                            	</td>
                        	</tr>
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="contraseñaPC2"><g:message code="equipo.contraseñaPC2" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: equipo, field: 'contraseñaPC2', 'errors')}">
                                    <g:passwordField name="contraseñaPC2" maxlength="64" value="${equipo?.contraseñaPC2}" disable="true"/>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:submitButton name="lista" class="save" value="${message(code: 'default.button.update')}" /></span>
                </div>
            </g:form>
        </div>
	<g:javascript>
        jQuery(document).ready(function() {
            jQuery('#username').focus();
        });
    </g:javascript>
    </body>
</html>

