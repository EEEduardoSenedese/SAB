<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="alunos" />
        <g:set var="entityName" value="${message(code: 'aluno.label', default: 'Aluno')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#create-aluno" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
            </ul>
        </div>
        <div id="create-aluno" class="content scaffold-create" role="main">
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${this.aluno}">
            <ul class="errors" role="alert">
                <g:eachError bean="${this.aluno}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                </g:eachError>
            </ul>
            </g:hasErrors>
            <g:form action="save">
                <fieldset class="form">

                    <f:field bean="aluno" property="arquivo"/>
                    <f:field bean="aluno" property="codigo">
                      <input type="number" autofocus name="codigo"/>
                    </f:field>
                    <f:field bean="aluno" property="nome"/>
                    <f:field bean="aluno" property="dataDeNascimento"/>
                    <f:field bean="aluno" property="sexo"/>
                    <f:field bean="aluno" property="pai"/>
                    <f:field bean="aluno" property="mae"/>
                    <f:field bean="aluno" property="naturalidade"/>
                    <f:field bean="aluno" property="estadoDoAluno"/>
                    <f:field bean="aluno" property="serie"/>
                    <f:field bean="aluno" property="ultimoAno"/>

                    <br>

                    <f:all bean="aluno" except="nome, arquivo, dataDeNascimento, sexo, serie, ultimoAno, naturalidade, pai, mae, estadoDoAluno, senha, email, usuario, codigo"/>

                </fieldset>
                <fieldset class="buttons">
                    <g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
                </fieldset>
            </g:form>
        </div>
    </body>
</html>
