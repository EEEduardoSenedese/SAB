<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'emprestimo.label', default: 'Emprestimo')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
        <asset:javascript src="jquery-ui.js"/>
        <asset:stylesheet src="jquery-ui.css"/>

        <g:javascript>
            $.get("${createLink(controller: 'Pessoa', action: 'listagem')}", function(pessoas){
                $('#pessoas').autocomplete({source: pessoas});
            });
        </g:javascript>
    </head>
    <body>
        <a href="#create-emprestimo" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
            </ul>
        </div>
        <div id="create-emprestimo" class="content scaffold-create" role="main">
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${this.emprestimo}">
            <ul class="errors" role="alert">
                <g:eachError bean="${this.emprestimo}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                </g:eachError>
            </ul>
            </g:hasErrors>
            <g:form action="save">
                <fieldset class="form">
                    <f:field bean="emprestimo" property="pessoa">
                        <input id="pessoas" name="pessoa.nome" value="${pessoa?.nome}"/>
                    </f:field>
                    <div class="escondido">
                        <f:field bean="emprestimo" property="dataDeEmprestimo"/>
                    </div>

                    <f:all bean="emprestimo" except="dataDeEmprestimo, devolvido, devolvidoEm, pessoa, livro"/>

                    <f:field bean="emprestimo" property="livro">
                        <input type="number" name="livro.id"/>
                    </f:field>
                </fieldset>
                <fieldset class="buttons">
                    <g:submitButton name="create" class="save" value="Próximo" />
                </fieldset>
            </g:form>
        </div>
    </body>
</html>
