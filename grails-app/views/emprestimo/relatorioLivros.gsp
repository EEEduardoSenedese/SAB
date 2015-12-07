<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="relatorioEmprestimo" />
        <g:set var="entityName" value="${message(code: 'emprestimo.label', default: 'Emprestimo')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#list-emprestimo" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>

            </ul>
        </div>
        <div id="list-emprestimo" class="content scaffold-list" role="main">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>

            <div class="pagination">
                <g:paginate total="${livroCount ?: 0}" />
            </div>

            <f:table collection="${livroList}" properties="['id', "titulo", "editora", "numeroDeEmprestimos", "disponivel"]"/>

            <div class="pagination">
                <g:paginate total="${livroCount ?: 0}" />
            </div>
        </div>
    </body>
</html>
