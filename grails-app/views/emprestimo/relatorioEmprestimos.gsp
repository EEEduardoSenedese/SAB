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
                <li>
                    <g:form action="relatorioEmprestimos">
                        <li>
                            <label for="inicio">Início</label>
                            <g:datePicker id="inicio" precision="day" name="inicio" value="${inicio}"/>
                        </li>
                        <li>
                            <label for="fim">Fim</label>
                            <g:datePicker id="fim" precision="day" name="fim" value="${fim}"/>
                        </li>

                        <g:submitButton name="search" class="edit" value="Alterar"/>
                    </g:form>
                </li>
            </ul>
        </div>
        <div id="list-emprestimo" class="content scaffold-list" role="main">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>
            <ol class="property-list livro">

                <li class="fieldcontain">
                    <span id="titulo-label" class="property-label">Total de Emprestimo</span>
                    <div class="property-value" aria-labelledby="titulo-label">${emprestimoCount}</div>
                </li>
            </ol>
            <f:table collection="${emprestimoList}" properties="['id', "pessoa", "livro", "dataDeEmprestimo", "dataDeDevolucao", "devolvido"]"/>
        </div>
    </body>
</html>
