<html>
    <head>
        <title><g:message code="usuario.lista" /></title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
		<g:javascript library="jquery" />
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><g:link class="home" action="admin"><g:message code="general.admin" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="nuevo"><g:message code="usuario.nuevo" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="usuario.lista" /></h1>
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
                          <label for="filtro"><g:message code="usuario.buscar" />:</label>
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
                <table id="usuarios">
                    <thead>
                        <tr>
                            <g:sortableColumn property="username" title="${message(code:'usuario.username')}" />
                            <g:sortableColumn property="nombreCompleto" title="${message(code:'usuario.nombreCompleto')}" />
                            <g:sortableColumn property="enabled" title="${message(code:'usuario.enabled')}" />
                            <g:sortableColumn property="correo" title="${message(code:'usuario.correo')}" />
                        </tr>
                    </thead>
                    <tbody>
	                    <g:each in="${usuarios}" status="i" var="usuario">
	                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
	                            <td><g:link action="ver" id="${usuario.id}">${fieldValue(bean: usuario, field: "username")}</g:link></td>
    	                        <td>${fieldValue(bean: usuario, field: "nombreCompleto")}</td>
								<td><g:checkBox name="enabled" value="${usuario.enabled}" disabled="true"/></td>
    	                        <td>${fieldValue(bean: usuario, field: "correo")}</td>
							</tr>
                	    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${totalDeUsuarios}" />
            </div>
        </div>
		<g:javascript>
          jQuery$(document).ready(function() {

            highlightTableRows('usuarios')
          });
        </g:javascript>
    </body>
</html>
