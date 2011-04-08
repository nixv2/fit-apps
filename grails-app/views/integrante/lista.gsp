<html>
    <head>
        <title><g:message code="integrante.lista" /></title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
		<g:javascript library="jquery" />
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><g:link class="home" controller="admin"><g:message code="general.admin" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="nuevo"><g:message code="integrante.nuevo" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="integrante.lista" /></h1>
            <g:if test="${flash.message}">
	        	<div class="message">${flash.message}</div>
            </g:if>
			<div class="search">
              <g:form method="post">
                <div>
                  <table>
                    <tbody>
                      <tr>
                        <td style="vertical-align:middle;width:95px;">
                          <label for="filtro"><g:message code="integrante.buscar" />:</label>
                        </td>
                        <td style="width:320px; vertical-align: middle;">
                          <input type="text" maxlength="64" size="32" id="filtro" name="filtro" value="${params.filtro}" style="width:300px;"/>
                        </td>
                        <td>
                          <g:actionSubmit action="lista" value="${message(code:'general.buscar')}" class="save" style="vertical-align: middle;" />
                        </td>
                      </tr>
                    </tbody>
                  </table>
                </div>
              </g:form>
            </div>
            <div class="list">
                <table id="integrantes">
                    <thead>
                        <tr>
                            <g:sortableColumn property="nombre" title="${message(code:'integrante.nombre')}" />
                            <g:sortableColumn property="apellido" title="${message(code:'integrante.apellido')}" />
                            <g:sortableColumn property="semestre" title="${message(code:'integrante.semestre')}" />
                            <g:sortableColumn property="correo" title="${message(code:'integrante.correo')}" />
                        </tr>
                    </thead>
                    <tbody>
	                    <g:each in="${integrantes}" status="i" var="integrante">
	                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
	                            <td><g:link action="ver" id="${integrante.id}">${fieldValue(bean: integrante, field: "nombre")}</g:link></td>
								<td>${fieldValue(bean: integrante, field: "apellido")}</td>
								<td>${fieldValue(bean: integrante, field: "semestre")}</td>
								<td>${fieldValue(bean: integrante, field: "correo")}</td>
							</tr>
                	    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${totalDeIntegrantes}" />
            </div>
        </div>
		<g:javascript>
          jQuery$(document).ready(function() {

            highlightTableRows('integrantes')
          });
        </g:javascript>
    </body>
</html>

