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
                <li><a class="home" href="${createLink(controller: "emprestimo")}">Voltar</a></li>

            </ul>
        </div>
        <div id="list-emprestimo" class="content scaffold-list" role="main">
            <h1>Relatório de Anos</h1>
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>

            <div class="pagination">
                <g:paginate total="${anosCout ?: 0}" />
            </div>

            <f:table collection="${anosList}" properties="['id', "nome", 'numeroDeEmprestimos']"/>

            <div class="pagination">
                <g:paginate total="${anosCout ?: 0}" />
            </div>
        </div>
    </body>
</html>
