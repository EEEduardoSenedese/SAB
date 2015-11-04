<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'livro.label', default: 'Livro')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
        <asset:javascript src="jquery-ui.js"/>
        <asset:stylesheet src="jquery-ui.css"/>
    </head>
    <body>
        <a href="#create-livro" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>

            </ul>
        </div>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
                <li>
                    <g:form action="pesquisar">
                        <label for="parametro" class="escondido">Pesquisa por Titulo</label>
                        <input type="text" name="parametro" value="" placeholder="Pesquisa por Título">
                    </g:form>
                </li>
                <li>
                    <g:form action="pesquisarPorId">
                        <label for="id" class="escondido">Pesquisa por ID</label>
                        <input type="number" name="id" value="" autofocus placeholder="Pesquisa por ID">
                    </g:form>
                </li>
            </ul>
        </div>
        <div id="create-livro" class="content scaffold-create" role="main">
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${this.livro}">
            <ul class="errors" role="alert">
                <g:eachError bean="${this.livro}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                </g:eachError>
            </ul>
            </g:hasErrors>
            <g:form action="save">
                <fieldset class="form">
                    <!--<f:all bean="livro" except="autorLivro, generoLivro"/>-->
                    <!--
                    <f:field bean="livro" property="editora" class="ui-widget">
                        <input id="editoras"/>
                    </f:field>


                    <g:javascript>
                      $(function(){

                        var editoras = [
                          "edioro",
                          "Atica",
                          "Record",
                          "Editora 1",
                          "Editora 2"
                        ]

                        $("#editoras").autocomplete({source: editoras});
                      })
                    </g:javascript>

                  -->
                    <f:field bean="livro" property="editora">
                        <g:select name="editora.id" from="${sab.livros.Editora.list(sort:'nome')}" optionKey="id"/>
                        <g:link action="create" controller="Editora" target="_blank">Nova Editora</g:link>
                    </f:field>

                    <!-- item nenhum é o primeiro item cadastrado no banco, portanto é o item 0-->

                    <f:field bean="livro" property="colecao">
                        <g:select name="colecao.id" from="${sab.livros.Colecao.list(sort: 'nome')}" optionKey="id" noSelection="${['0': '-- Nenhuma --']}"/>
                        <g:link action="create" controller="Colecao" target="_blank">Nova Colecao</g:link>
                    </f:field>

                    <f:field bean="livro" property="titulo"/>
                    <f:field bean="livro" property="aquisicao"/>
                    <f:field bean="livro" property="data"/>
                    <f:field bean="livro" property="numeroDePaginas"/>
                    <f:field bean="livro" property="categoria"/>
                    <f:field bean="livro" property="dataDeAquisicao"/>

                </fieldset>
                <fieldset class="buttons">
                    <g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
                </fieldset>
            </g:form>
        </div>
    </body>
</html>
