
<%@ page import="general.Integrante" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'integrante.label', default: 'Integrante')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="id" title="${message(code: 'integrante.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="apellidos" title="${message(code: 'integrante.apellidos.label', default: 'Apellidos')}" />
                        
                            <g:sortableColumn property="isFat" title="${message(code: 'integrante.isFat.label', default: 'Is Fat')}" />
                        
                            <g:sortableColumn property="nombre" title="${message(code: 'integrante.nombre.label', default: 'Nombre')}" />
                        
                            <g:sortableColumn property="semestre" title="${message(code: 'integrante.semestre.label', default: 'Semestre')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${integranteInstanceList}" status="i" var="integranteInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${integranteInstance.id}">${fieldValue(bean: integranteInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: integranteInstance, field: "apellidos")}</td>
                        
                            <td><g:formatBoolean boolean="${integranteInstance.isFat}" /></td>
                        
                            <td>${fieldValue(bean: integranteInstance, field: "nombre")}</td>
                        
                            <td>${fieldValue(bean: integranteInstance, field: "semestre")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${integranteInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
