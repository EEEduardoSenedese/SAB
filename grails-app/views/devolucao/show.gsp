<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'emprestimo.label', default: 'Devolução')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#show-devolucao" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
            </ul>
        </div>
        <div id="show-devolucao" class="content scaffold-show" role="main">
            <h1><g:message code="default.show.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>
            <!--<f:display bean="emprestimo" except="itens"/>-->
            <ol class="property-list emprestimo">
                <li class="fieldcontain">
                    <span id="dataDeEmprestimo-label" class="property-label">Data de Emprestimo</span>
                    <div class="property-value" aria-labelledby="dataDeEmprestimo-label">
                        <f:display bean="emprestimo" property="dataDeEmprestimo"/>
                    </div>
                </li>

                <li class="fieldcontain">
                    <span id="dataDeDevolucao-label" class="property-label">Data de Devolução</span>
                    <div class="property-value" aria-labelledby="dataDeDevolução-label">
                        <f:display bean="emprestimo" property="dataDeDevolucao"/>
                    </div>
                </li>

                <li class="fieldcontain">
                    <span id="pessoa-label" class="property-label">Pessoa</span>
                    <div class="property-value" aria-labelledby="pessoa-label">
                        <g:link controller="Pessoa" action="show" id="${emprestimo.pessoa.id}" target="_blank">${emprestimo.pessoa}</g:link>
                    </div>
                </li>

                <li class="fieldcontain">
                    <span id="serie-label" class="property-label">Serie</span>
                    <div class="property-value" aria-labelledby="serie-label">
                        <g:link controller="Pessoa" action="show" id="${emprestimo.serie.id}" target="_blank">${emprestimo.serie}</g:link>
                    </div>
                </li>

                <br>

                <!-- Livro -->
                <li class="fieldcontain">
                    <span id="titulo-label" class="property-label">Titulo</span>
                    <div class="property-value" aria-labelledby="titulo-label">${itemDevolucao.livro.titulo}</div>
                </li>

                <li class="fieldcontain">
                    <span id="editora-label" class="property-label">Editora</span>
                    <div class="property-value" aria-labelledby="editora-label">
                        <g:link controller="Editora" action="show" id="${itemDevolucao.livro.editora.id}" target="_blank">${itemDevolucao.livro.editora}</g:link>
                    </div>
                </li>

                <li class="fieldcontain">
                    <span id="colecao-label" class="property-label">Coleção</span>
                    <div class="property-value" aria-labelledby="colecao-label">
                        <g:link controller="Colecao" action="show" id="${itemDevolucao.livro.colecao.id}" target="_blank">${itemDevolucao.livro.colecao}</g:link>
                    </div>
                </li>

                <li class="fieldcontain">
                    <span id="categoria-label" class="property-label">Categoria</span>
                    <div class="property-value" aria-labelledby="categoria-label">
                        <g:link controller="Categoria" action="show" id="${itemDevolucao.livro.categoria.id}" target="_blank">${itemDevolucao.livro.categoria}</g:link>
                    </div>
                </li>

                <br>

                <li class="fieldcontain">
                    <span id="autorLivro-label" class="property-label">Autor(es) do Livro</span>
                    <div class="property-value" aria-labelledby="autorLivro-label">
                        <ul>
                            <g:each var="autorLivro" in="${sab.livros.AutorLivro.findAllByLivro(itemDevolucao.livro)}">
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
                            <g:each in="${sab.livros.GeneroLivro.findAllByLivro(itemDevolucao.livro)}" var="generoLivro">
                                <li>
                                    <g:link controller="Genero" action="show" id="${generoLivro.genero.id}" target="_blank">
                                    ${generoLivro.genero.nome}
                                    </g:link>
                                </li>
                            </g:each>
                        </ul>
                    </div>
                </li>

                <br><br>

                <li class="fieldcontain">
                    <span id="itens-label" class="property-label">Livro(s) do emprestimo</span>
                    <div class="property-value" aria-labelledby="itens-label">
                        <ul>
                            <g:each var="item" in="${sab.Item.findAllByEmprestimo(emprestimo)}">
                                <li><g:link  controller="item" action="show" target="_blank" id="${item.livro.id}">${item.livro.titulo}</g:link >
                                    <br>
                                <span id="devolvido-label" class="property-label">Devolvido</span>
                                <div class="property-value" aria-labelledby="devolvido-label">
                                    <f:display bean="${item}" property="devolvido"/>
                                </div>
                                </li>
                            </g:each>
                        </ul>
                    </div>
                </li>
            </ol>

            <g:form resource="${this.itemDevolucao}" method="DELETE">
                <fieldset class="buttons">
                    <g:link class="edit" action="devolver" resource="${this.itemDevolucao}">Finalizar</g:link>
                </fieldset>
            </g:form>
        </div>
    </body>
</html>
