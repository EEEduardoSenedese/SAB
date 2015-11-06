<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="alunos" />
        <g:set var="entityName" value="${message(code: 'aluno.label', default: 'Aluno')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#list-aluno" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
                <li>
                    <g:form action="pesquisar">
                        <label for="parametro" class="escondido">Pesquisa por Nome</label>
                        <input type="text" name="parametro" value="" placeholder="Pesquisa">
                    </g:form>
                </li>
                <li>
                    <g:form action="pesquisarPorCodigo">
                        <label for="id" class="escondido">Pesquisa por Codigo</label>
                        <input type="number" name="codigo" value="" autofocus placeholder="Pesquisa por Código">
                    </g:form>
                </li>
            </ul>
        </div>
        <div id="list-aluno" class="content scaffold-list" role="main">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>
            <f:table collection="${alunoList}" properties="["codigo", "nome", "arquivo"]"/>

            <div class="pagination">
                <g:paginate total="${alunoCount ?: 0}" />
            </div>
        </div>
    </body>
</html>
