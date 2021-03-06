<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'livro.label', default: 'Livro')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
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
            <div id="show-livro" class="content scaffold-show" role="main">
                <h1><g:message code="default.show.label" args="["$entityName $livro.id"]" /></h1>
                <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
                </g:if>

                <ol class="property-list livro">

                    <li class="fieldcontain">
                        <span id="titulo-label" class="property-label">Titulo</span>
                        <div class="property-value" aria-labelledby="titulo-label">${livro.titulo}</div>
                    </li>

                    <li class="fieldcontain">
                        <span id="disponivel-label" class="property-label">Disponível</span>
                        <div class="property-value" aria-labelledby="disponivel-label">
                            <f:display bean="livro" property="disponivel"/>
                        </div>
                    </li>

                    <li class="fieldcontain">
                        <span id="data-label" class="property-label">Data</span>
                        <div class="property-value" aria-labelledby="data-label">${livro.data}</div>
                    </li>

                    <li class="fieldcontain">
                        <span id="numeroDePaginas-label" class="property-label">Numero De Paginas</span>
                        <div class="property-value" aria-labelledby="numeroDePaginas-label">${livro.numeroDePaginas}</div>
                    </li>

                    <li class="fieldcontain">
                        <span id="numeroDePaginas-label" class="property-label">Data de Aquisição</span>
                        <div class="property-value" aria-labelledby="numeroDePaginas-label">${livro.dataDeAquisicao}</div>
                    </li>

                    <li class="fieldcontain">
                        <span id="numeroDePaginas-label" class="property-label">Numero de emprestimos</span>
                        <div class="property-value" aria-labelledby="numeroDePaginas-label">${livro.numeroDeEmprestimos}</div>
                    </li>

                    <li class="fieldcontain">
                        <span id="editora-label" class="property-label">Editora</span>
                        <div class="property-value" aria-labelledby="editora-label">
                            <g:link controller="Editora" action="show" id="${livro.editora.id}" target="_blank">${livro.editora}</g:link>
                        </div>
                    </li>

                    <li class="fieldcontain">
                        <span id="colecao-label" class="property-label">Coleção</span>
                        <div class="property-value" aria-labelledby="colecao-label">
                            <g:link controller="Colecao" action="show" id="${livro.colecao.id}" target="_blank">${livro.colecao}</g:link>
                        </div>
                    </li>

                    <li class="fieldcontain">
                        <span id="prateleira-label" class="property-label">Prateleira</span>
                        <div class="property-value" aria-labelledby="categoria-label">
                            <g:link controller="Prateleira" action="show" id="${livro.categoria.id}" target="_blank">${livro.prateleira}</g:link>
                        </div>
                    </li>

                    <br>

                    <li class="fieldcontain">
                        <span id="aquisicao-label" class="property-label">Aquisicao</span>
                        <div class="property-value" aria-labelledby="aquisicao-label">
                            <g:link controller="Aquisicao" action="show" id="${livro.aquisicao.id}" target="_blank">${livro.aquisicao}</g:link>
                        </div>
                    </li>

                    <li class="fieldcontain">
                        <span id="categoria-label" class="property-label">Categoria</span>
                        <div class="property-value" aria-labelledby="categoria-label">
                            <g:link controller="Categoria" action="show" id="${livro.categoria.id}" target="_blank">${livro.categoria}</g:link>
                        </div>
                    </li>

                    <br>

                    <li class="fieldcontain">
                        <span id="autorLivro-label" class="property-label">Autor(es) do Livro</span>
                        <div class="property-value" aria-labelledby="autorLivro-label">
                            <ul>
                                <g:each var="autorLivro" in="${sab.livros.AutorLivro.findAllByLivro(livro)}">
                                    <li><g:link  controller="Autor" action="show" target="_blank" id="${autorLivro.autor.id}">${autorLivro.autor.nome}</g:link ></li>
                                </g:each>
                            </ul>
                        </div>
                    </li>

                    <br>

                    <li class="fieldcontain">
                        <span id="generoLivro-label" class="property-label">Genero(s) do Livro</span>
                        <div class="property-value" aria-labelledby="generoLivro-label">
                            <ul>
                                <g:each in="${sab.livros.GeneroLivro.findAllByLivro(livro)}" var="generoLivro">
                                    <li>
                                        <g:link controller="Genero" action="show" id="${generoLivro.genero.id}" target="_blank">
                                        ${generoLivro.genero.nome}
                                        </g:link>
                                    </li>
                                </g:each>
                            </ul>
                        </div>
                    </li>
                </ol>

                <g:form resource="${this.livro}" method="DELETE">
                    <fieldset class="buttons">
                        <g:link class="edit" action="edit" resource="${this.livro}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
                        <input class="delete" type="submit" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />

                        <g:link class="edit" controller="AutorLivro" action="create" params="[ 'livro.id': this.livro.id]">Autor(es)</g:link>

                        <g:link class="edit" controller="GeneroLivro" action="create" params="[ 'livro.id': this.livro.id]">Genero(s)</g:link>


                        <g:link class="edit" action="duplicar" resource="${this.livro}">Duplicar Livro</g:link>
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
