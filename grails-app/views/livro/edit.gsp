<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'livro.label', default: 'Livro')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
        <asset:javascript src="jquery-ui.js"/>
        <asset:stylesheet src="jquery-ui.css"/>

        <g:javascript>
          $.get("${createLink(action: 'listagem', controller: 'editora')}", function(editoras){
            $("#editoras").autocomplete({source: editoras});
          });

          $.get("${createLink(action: 'listagem', controller: 'colecao')}", function(colecoes){
            $("#colecoes").autocomplete({source: colecoes});
          });
        </g:javascript>
    </head>
    <body>
        <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
		    <div class="container-fluid">
                <div class="nav-header">
		            <a href="${createLink(action: "index")}" class="navbar-brand"><%=entityName%></a>
		        </div>
                <g:form class="navbar-form navbar-right" action="pesquisar">
		            <input class="form-control" placeholder="Título do Livro ${entityName}" type="text" value="${params.parametro}" name="parametro">
		        </g:form>
                <g:form class="navbar-form navbar-right" action="pesquisarPorId">
		            <input class="form-control" placeholder="ID do ${entityName}" type="number" value="${params.id}" name="id">
		        </g:form>
		        <ul class="nav navbar-right navbar-nav">
                    <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
                    <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
		        </ul>
		    </div>
		</nav>

		<section class="main col-sm-offset-2">
            <div id="edit-livro" class="content scaffold-edit" role="main">
                <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
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
                <g:form resource="${this.livro}" method="PUT">
                    <g:hiddenField name="version" value="${this.livro?.version}" />
                    <fieldset class="form">
                        <f:field bean="livro" property="colecao">
                            <input id="colecoes" name="colecao.nome" value="${this.livro.colecao.nome}"/>
                        </f:field>

                        <f:field bean="livro" property="editora">
                            <input id="editoras" name="editora.nome" value="${this.livro.editora.nome}"/>
                        </f:field>

                        <f:field bean="livro" property="data">
                            <input type="number" name="data" value="${livro.data}"/>
                        </f:field>

                        <f:field bean="livro" property="numeroDePaginas">
                            <input type="number" name="numeroDePaginas" value="${livro.numeroDePaginas}">
                        </f:field>

                        <f:all bean="livro" except="editora, generoLivro, autorLivro, data, numeroDePaginas, colecao, emprestimo"/>
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
