<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'emprestimo.label', default: 'Emprestimo')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#list-emprestimo" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                <li><g:link class="create" action="pesquisarAluno"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
                <li>
                    <g:form action="pesquisarLivro">
                        <label for="devolucao">Devolver livro</label>
                        <input type="number" name="id" value="" placeholder="Id do livro">
                        <g:submitButton name="search" class="edit" value="Pesquisar"/>
                    </g:form>
                </li>
            </ul>
        </div>
        <div id="list-emprestimo" class="content scaffold-list" role="main">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>
            <f:table collection="${emprestimoList}" properties="['id', "pessoa", "livro", "devolvido"]"/>
            <div class="pagination">
                <g:paginate total="${emprestimoCount ?: 0}" />
            </div>
        </div>
    </body>
</html>
