<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'emprestimo.label', default: 'Emprestimo')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
        <asset:javascript src="jquery-ui.js"/>
        <asset:stylesheet src="jquery-ui.css"/>

        <g:javascript>
            $.get("${createLink(controller: 'Pessoa', action: 'listagem')}", function(pessoas){
                $('#pessoa.nome').autocomplete({source: pessoas});
            });
        </g:javascript>
    </head>
    <body>
        <a href="#edit-emprestimo" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
                <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
                <li>
                    <g:form action="pesquisarLivro">
                        <label for="devolucao">Pesquisar emprestimo</label>
                        <input type="number" name="id" value="" placeholder="Id do livro" autofocus>
                        <g:submitButton name="search" class="edit" value="Pesquisar"/>
                    </g:form>
                </li>
            </ul>
        </div>
        <div id="edit-emprestimo" class="content scaffold-edit" role="main">
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
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
            <g:form resource="${this.emprestimo}" method="PUT">
                <g:hiddenField name="version" value="${this.emprestimo?.version}" />
                <fieldset class="form">
                    <f:all bean="emprestimo" except="livro, pessoa"/>
                    <f:field bean="emprestimo" property="livro.id"/>
                    <f:field bean="emprestimo" property="pessoa.nome"/>
                </fieldset>
                <fieldset class="buttons">
                    <input class="save" type="submit" value="${message(code: 'default.button.update.label', default: 'Update')}" />
                </fieldset>
            </g:form>
        </div>
    </body>
</html>
