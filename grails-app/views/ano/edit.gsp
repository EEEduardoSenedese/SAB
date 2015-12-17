<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="alunos" />
        <g:set var="entityName" value="${message(code: 'ano.label', default: 'Ano')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
        <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
            <div class="container-fluid">
                <div class="nav-header">
                    <a href="#" class="navbar-brand"><%=entityName%></a>
                </div>
                <g:form class="navbar-form navbar-right" action="pesquisar">
                    <input class="form-control" placeholder="Pesquisar Ano" type="text">
                </g:form>
                <ul class="nav navbar-right navbar-nav">
                    <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
                    <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
                </ul>
            </div>
        </nav>

        <section class="main col-sm-offset-2">
            <div id="edit-ano" class="content scaffold-edit" role="main">
                <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
                <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
                </g:if>
                <g:hasErrors bean="${this.ano}">
                <ul class="errors" role="alert">
                    <g:eachError bean="${this.ano}" var="error">
                    <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                    </g:eachError>
                </ul>
                </g:hasErrors>
                <g:form resource="${this.ano}" method="PUT">
                    <g:hiddenField name="version" value="${this.ano?.version}" />
                    <fieldset class="form">
                        <f:all bean="ano" except="numeroDeEmprestimos, emprestimo"/>
                    </fieldset>
                    <fieldset class="buttons">
                        <input class="save" type="submit" value="${message(code: 'default.button.update.label', default: 'Update')}" />
                    </fieldset>
                </g:form>
            </div>

            <div class="footer" role="contentinfo">
              <h1>Sistema de apoio Bibliotecário</h1>
              <h2>Este software está sobre a licença GPL, e seu código é mantido pela Escola Estadual Eduardo Senedese, Juruaia - Minas Gerais
              </h2>
              <h3>A GPL não permite que o este software seja vendido. Seu código dever ser distribuido livremente</h3>
            </div>
        </section>
    </body>
</html>
