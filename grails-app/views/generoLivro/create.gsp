<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'generoLivro.label', default: 'GeneroLivro')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
        <asset:javascript src="jquery-ui.js"/>
        <asset:stylesheet src="jquery-ui.css"/>

        <g:javascript>
          $.get("${createLink(controller: 'genero', action: 'listagem')}", function(generos){
            $("#generos").autocomplete({source: generos});
          });
        </g:javascript>
    </head>
    <body>
        <a href="#create-generoLivro" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
            </ul>
        </div>
        <div id="create-generoLivro" class="content scaffold-create" role="main">
            <h1>Adicionar Genero ao Livro</h1>
            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${this.generoLivro}">
            <ul class="errors" role="alert">
                <g:eachError bean="${this.generoLivro}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if><g:message error="${error}"/></li>
                </g:eachError>
            </ul>
            </g:hasErrors>
            <g:form action="save">
                <fieldset class="form">
                    <!-- Escolhe genero -->
                    <f:field bean="generoLivro" property="genero">
                        <input id="generos" autofocus name="genero.nome"/>
                        <g:submitButton name="create" class="botao-normal" value="Adicionar este Genero" />

                    </f:field>
                </fieldset>

                <!-- Livro -->
                <!-- Este item fica escondido -->
                <g:select name="livro.id" optionKey="id" from="${sab.livros.Livro.get(params.long('livro.id'))}" class="escondido"/>
            </g:form>

            <fieldset class="form">
                <!-- Tabela com os livros cadastrados -->
                <div class="fieldcontain">
                    <table class="tabela-de-adicao">
                        <caption>Generos do Livro</caption>
                        <g:each in="${generoLivroList}" var="generoLivro" status="i">
                            <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                                <td>
                                    <g:link action="show" controller="Genero" id="${generoLivro.genero.id}"> ${generoLivro.genero}</g:link>
                                </td>

                                <td>
                                    <g:form resource="${generoLivro}" method="DELETE">
                                        <fieldset class="buttons">
                                            <input class="delete" type="submit" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                                        </fieldset>
                                    </g:form>
                                </td>
                            </tr>
                        </g:each>
                    </table>
                </div>
            </fieldset>

            <fieldset class="buttons">
                <g:link action="show" controller="Livro" id="${params.long('livro.id')}">Voltar</g:link>
            </fieldset>
        </div>
    </body>
</html>
