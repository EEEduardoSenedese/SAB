<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'emprestimo.label', default: 'Emprestimo')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#show-emprestimo" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
                <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
            </ul>
        </div>
        <div id="show-emprestimo" class="content scaffold-show" role="main">
            <h1>Emprestimo para ${emprestimo.pessoa.nome}</h1>
            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>
            <!--<f:display bean="emprestimo" except="itens"/>-->

            <g:form action="finalizarEmprestimo">
                <fieldset class="form">
                    <f:all bean="emprestimo" except="devolvidoEm, dataDeEmprestimo, devolvido, livro, pessoa"/>
                    <div class="escondido">
                        <f:field bean="emprestimo" property="dataDeEmprestimo"/>
                        <f:field bean="emprestimo" property="pessoa"/>
                    </div>
                    <f:field bean="emprestimo" property="livro">
                        <input type="number" autofocus="true" name="livro.id"/>
                    </f:field>
                </fieldset>
                <fieldset class="buttons">
                    <g:submitButton name="create" class="save" value="Finalizar Emprestimo"/>
                </fieldset>
            </g:form>

            <f:table collection="${emprestimoList}" properties="['id', "pessoa", "livro", "devolvido"]"/>
        </div>
    </body>
</html>