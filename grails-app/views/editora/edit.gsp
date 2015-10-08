<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'editora.label', default: 'Editora')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#edit-editora" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
                <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
                <li>
                    <g:form action="pesquisar">
                      <input type="text" name="parametro" value="" placeholder="Pesquisar por nome">
                    </g:form>
                </li>
            </ul>
        </div>
        <div id="edit-editora" class="content scaffold-edit" role="main">
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${this.editora}">
            <ul class="errors" role="alert">
                <g:eachError bean="${this.editora}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                </g:eachError>
            </ul>
            </g:hasErrors>
            <g:form resource="${this.editora}" method="PUT">
                <g:hiddenField name="version" value="${this.editora?.version}" />
                <fieldset class="form">
                    <f:all bean="editora"/>
                </fieldset>
                <fieldset class="buttons">
                    <input class="save" type="submit" value="${message(code: 'default.button.update.label', default: 'Update')}" />
                </fieldset>
            </g:form>
        </div>
        <div class="nav" role="navigation">
            <ul>
                <li><g:link class="create" controller="Autor" action="create">Novo Autor</g:link></li>
            </ul>
        </div>
    </body>
</html>
