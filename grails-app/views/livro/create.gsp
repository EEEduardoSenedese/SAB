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
        <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
		    <div class="container-fluid">
                <div class="nav-header">
		            <a href="${createLink(action: "index")}" class="navbar-brand"><%=entityName%></a>
		        </div>
                <g:form class="navbar-form navbar-right" action="pesquisar">
		            <input class="form-control" placeholder="Pesquisar ${entityName}" type="text" value="${params.parametro}" name="parametro">
		            <input class="form-control" placeholder="ID do ${entityName}" type="number" value="${params.id}" name="id">
		        </g:form>
		        <ul class="nav navbar-right navbar-nav">
                    <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
		        </ul>
		    </div>
		</nav>

		<section class="main col-sm-offset-2">
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
                    <f:with bean="livro">
                        <f:field property="editora">
                            <f:widget property="editora.nome" id="editoras" autofocus="true"/>
                        </f:field>

                        <f:field property="colecao">
                            <f:widget property="colecao.nome" value="${sab.livros.Colecao.list(max: 1)[0]}" id="colecoes"/>
                        </f:field>

                        <f:field property="titulo"/>

                        <f:field property="aquisicao"/>

                        <f:field property="dataDeAquisicao"/>

                        <f:field property="data"/>

                        <f:field property="numeroDePaginas"/>

                        <f:field property="categoria"/>

                        <f:field property="prateleira"/>

                        <f:field property="disponivel"/>

                    </f:with>
                </fieldset>

                <fieldset class="buttons">
                    <g:submitButton name="create" class="save" value="Próximo (Adicionar Autore(s))" />
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
