<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'autorLivro.label', default: 'AutorLivro')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#create-autorLivro" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
            </ul>
        </div>
        <div id="create-autorLivro" class="content scaffold-create" role="main">
            <h1>Adicionar Autor ao Livro</h1>
            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${this.autorLivro}">
            <ul class="errors" role="alert">
                <g:eachError bean="${this.autorLivro}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                </g:eachError>
            </ul>
            </g:hasErrors>
            <g:form action="save">
                <fieldset class="form">
                    <f:field bean="autorLivro" property="autor">
                        <g:select name="autor.id" from="${sab.Autor.list(sort:'nome')}" optionKey="id"/>
                    </f:field>

                    <g:select name="livro.id" from="${sab.Livro.get(params.long('livro.id'))}" optionKey="id" class="escondido"/>
                </fieldset>
                <fieldset class="buttons">
                    <g:submitButton name="create" class="save" value="Adicionar este Autor ao Livro" />
                </fieldset>
            </g:form>
        </div>
    </body>
</html>
