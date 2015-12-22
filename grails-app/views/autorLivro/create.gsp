<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'autorLivro.label', default: 'Autor do Livro')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
        <asset:javascript src="jquery-ui.js"/>
        <asset:stylesheet src="jquery-ui.css"/>

        <g:javascript>
          $.get("${createLink(controller: 'autor', action: 'listagem')}", function(autores){
            $('#autores').autocomplete({source: autores})
          });
        </g:javascript>

    </head>
    <body>
        <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
		    <div class="container-fluid">
		        <div class="nav-header">
		            <a href="#" class="navbar-brand"><%=entityName%></a>
		        </div>
		    </div>
		</nav>

		<section class="main col-sm-offset-2">
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

                        <f:with bean="autorLivro">
                            <f:field property="livro">
                                <g:select id="livro.id" from="${sab.livros.Livro.get(params.long('livro.id'))}" optionKey="id" name="livro.id"/>
                            </f:field>

                            <f:field property="autor">
                                <f:widget property="autor.nome" id="autores" autofocus="true"/>
                                <g:submitButton name="create" class="botao-normal" value="Adicionar este Autor"/>
                            </f:field>

                        </f:with>
                    </fieldset>
                </g:form>

                <fieldset class="form">
                    <div class="fieldcontain">
                        <table class="tabela-de-adicao">
                            <caption>Autores cadastrados</caption>
                            <g:each in="${autorLivroList}" var="autorLivro" status="i">
                                <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                                    <td>
                                        <g:link action="show" controller="Autor" id="${autorLivro.autor.id}"> ${autorLivro.autor.nome} </g:link>
                                    </td>
                                    <td>
                                        <g:form resource="${autorLivro}" method="DELETE">
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

                    <g:link action="create" controller="GeneroLivro" params="["livro.id": "${params.long('livro.id')}"]">Próximo (Adicionar Genero(s))</g:link>
                </fieldset>
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
