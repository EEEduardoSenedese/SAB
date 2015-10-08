<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'autor.label', default: 'Autor')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#list-autor" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
                <li>
                    <g:form action="pesquisar">
                      <input type="text" name="parametro" value="" placeholder="Pesquisar por nome">
                    </g:form>
                </li>
            </ul>
        </div>
        <div id="list-autor" class="content scaffold-list" role="main">
          <div class="pagination">
              <g:paginate total="${autorCount ?: 0}" />
          </div>

            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>
            <f:table collection="${autorList}" sort="nome" />

            <div class="pagination">
                <g:paginate total="${autorCount ?: 0}" />
            </div>
        </div>
    </body>
</html>
