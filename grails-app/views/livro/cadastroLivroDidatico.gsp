<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'livro.label', default: 'Livro')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
        <asset:javascript src="jquery-ui.js"/>
        <asset:stylesheet src="jquery-ui.css"/>
        <g:javascript>

          $.get("${createLink(controller: 'editora', action: 'listagem')}", function(editoras){
            $('#editoras').autocomplete({source: editoras});
          });

          $.get("${createLink(controller: 'colecao', action: 'listagem')}", function(colecoes){
            $('#colecoes').autocomplete({source: colecoes});
          });

        </g:javascript>
    </head>
    <body>

        <a href="#create-livro" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>

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
                        <input type="number" name="id" value="" placeholder="Pesquisa por ID">
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
                        <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if><g:message error="${error}"/></li>
                    </g:eachError>
                </ul>
            </g:hasErrors>

            <g:form action="save">
                <fieldset class="form">

                    <div class="fieldcontain required">
                      <label for="data">Registro (Inicial)
                        <span class="required-indicator">*</span>
                    </label><input name="data" value="0" required="" id="data" type="number">
                    </div>

                    <div class="fieldcontain required">
                      <label for="data">Qtd
                        <span class="required-indicator">*</span>
                    </label><input name="data" value="1" required="" id="data" type="number">
                    </div>

                    <div class="fieldcontain">
                      <label for="disponivel">Manual do Professor</label><input name="_disponivel" type="hidden"><input name="disponivel" id="disponivel" type="checkbox">
                    </div>

                    <div class="fieldcontain">
                      <label for="disponivel">Aluno</label><input name="_disponivel" type="hidden"><input name="disponivel" checked="checked" id="disponivel" type="checkbox">
                    </div>

                    <div class="fieldcontain required">
                        <label for="editora">Editora
                            <span class="required-indicator">*</span>
                        </label>
                        <input autocomplete="off" class="ui-autocomplete-input" id="editoras" autofocus="true" name="editora.nome" value="" required="" type="text">
                    </div>

                    <div class="fieldcontain required">
                        <label for="editora">Titulo
                            <span class="required-indicator">*</span>
                        </label>
                        <input autocomplete="off" class="ui-autocomplete-input" id="editoras" autofocus="true" name="editora.nome" value="" required="" type="text">
                    </div>

                    <div class="fieldcontain required">
                        <label for="aquisicao">Materia
                            <span class="required-indicator">*</span>
                        </label>
                        <select name="aquisicao.id" required="" id="aquisicao">
                            <option value="1">----- Selecione ----</option>
                            <option value="2">História</option>
                            <option value="3">Matemática</option>
                            <option value="4">Filosofia</option>
                            <option value="5">Sociologia</option>
                            <option value="6">Ciências</option>
                        </select>
                    </div>

                    <div class="fieldcontain required">
                        <label for="aquisicao">Ano
                            <span class="required-indicator">*</span>
                        </label>
                        <select name="aquisicao.id" required="" id="aquisicao">
                            <option value="1">----- Selecione ----</option>
                            <option value="2">6º</option>
                            <option value="3">7º</option>
                            <option value="4">8º</option>
                            <option value="5">9º</option>
                        </select>
                    </div>

                    <div class="fieldcontain required">
                      <label for="data">Ano Inicio
                        <span class="required-indicator">*</span>
                    </label><input name="data" value="1" required="" id="data" type="number">
                    </div>

                    <div class="fieldcontain required">
                      <label for="data">Ano Final
                        <span class="required-indicator">*</span>
                    </label><input name="data" value="1" required="" id="data" type="number">
                    </div>
                </fieldset>
                <fieldset class="buttons">
                    <g:submitButton name="create" class="save" value="Próximo (Adicionar Autore(s))" />
                </fieldset>
            </g:form>
        </div>
    </body>
</html>
