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
        <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
		    <div class="container-fluid">
                <div class="nav-header">
		            <a href="${createLink(action: "index")}" class="navbar-brand"><%=entityName%></a>
		        </div>
                <g:form class="navbar-form navbar-right" action="pesquisar">
		            <input class="form-control" placeholder="Pesquisar ${entityName}" type="text" value="${params.parametro}" name="parametro">
		        </g:form>
		        <ul class="nav navbar-right navbar-nav">

		        </ul>
		    </div>
		</nav>

		<section class="main col-sm-offset-2">
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
    
                        <f:with bean="generoLivro">
                            <f:field property="livro">
                                <g:select name="livro.id" id="livro.id" from="${sab.livros.Livro.get(params.long('livro.id'))}" optionKey="id"/>
                            </f:field>
    
                            <f:field property="genero">
                                <f:widget property="genero.nome" id="generos" autofocus="true"/>
                                <g:submitButton name="create" class="botao-normal" value="Adicionar este Genero"/>
                            </f:field>
                        </f:with>
    
                    </fieldset>
    
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
                    <g:link action="show" controller="Livro" id="${params.long('livro.id')}">Finalizar Cadastro</g:link>
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
