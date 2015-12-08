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
                    <g:form action="relatorioIndex">
                        <li><a class="home" href="${createLink(controller: "emprestimo")}">Voltar</a></li>
                        <li>
                            <label for="data">Início</label>
                            <g:datePicker id="data" precision="day" name="data"  value="${data}"/>
                        </li>

                        <g:submitButton name="search" class="edit" value="Alterar dia"/>
                    </g:form>
                </li>
            </ul>
        </div>
        <div id="list-emprestimo" class="content scaffold-list" role="main">
            <h1>Emprestimos do Dia</h1>
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>
            <ol class="property-list livro">

                <li class="fieldcontain">
                    <span id="titulo-label" class="property-label">Total de Emprestimo</span>
                    <div class="property-value" aria-labelledby="titulo-label">${emprestimoList.size()}</div>
                </li>
            </ol>
            <g:if test="${emprestimoList.size() > 0}">
                <f:table collection="${emprestimoList}" properties="['id', "pessoa", "ano", "livro", "dataDeEmprestimo"]"/>
            </g:if>
            <g:else>
            <ol class="property-list livro">

                <li class="fieldcontain">
                    <p>
                        Nenhuma devolução para esta data
                    </p>
                </li>
            </ol>
            </g:else>
        </div>
    </body>
</html>
