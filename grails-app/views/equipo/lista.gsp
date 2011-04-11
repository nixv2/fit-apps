<html>
    <head>
        <title><g:message code="equipo.lista" /></title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
		<g:javascript library="jquery" />
    </head>
    <body>
        <div class="nav">
      		<span class="menuButton"><a class="home" href="${resource(dir: '')}"><g:message code="general.inicio"/></a></span>
            <span class="menuButton"><g:link class="create" action="nuevo"><g:message code="equipo.nuevo" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="equipo.lista" /></h1>
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
                          <label for="filtro"><g:message code="equipo.buscar" />:</label>
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
                <table id="equipos">
                    <thead>
                        <tr>
                            <g:sortableColumn property="nombre" title="${message(code:'equipo.nombre')}" />
							<g:sortableColumn property="nombre" title="${message(code:'equipo.usuarioPC2')}" />
                        </tr>
                    </thead>
                    <tbody>
	                    <g:each in="${equipos}" status="i" var="equipo">
	                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
	                            <td><g:link action="ver" id="${equipo.id}">${fieldValue(bean: equipo, field: "nombre")}</g:link></td>
	                            <td>${fieldValue(bean: equipo, field: "usuarioPC2")}</td>
							</tr>
                	    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${totalDeEquipos}" />
            </div>
        </div>
		<g:javascript>
          jQuery$(document).ready(function() {

            highlightTableRows('equipos')
          });
        </g:javascript>
    </body>
</html>

