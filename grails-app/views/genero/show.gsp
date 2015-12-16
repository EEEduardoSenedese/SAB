<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'genero.label', default: 'Genero')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#show-genero" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
                <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
                <li>
                    <g:form action="pesquisar">
                      <input type="text" name="parametro" value="" placeholder="Pesquisar por nome">
                    </g:form>
                </li>
            </ul>
        </div>
        <div id="show-genero" class="content scaffold-show" role="main">
            <h1><g:message code="default.show.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>

            <ol class="property-list genero">
                <li class="fieldcontain">
                    <span id="nome-label" class="property-label">Nome</span>
                    <div class="property-value" aria-labelledby="nome-label"><f:display bean="genero" property="nome"/></div>
                </li>

                <li class="fieldcontain">
                    <span id="generoLivro-label" class="property-label">Livro</span>
                    <div class="property-value" aria-labelledby="generoLivro-label">
                        <ul>
                            <g:each var="generoLivro" in="${sab.livros.GeneroLivro.findAllByGenero(genero)}">
                                <li><g:link action="show" controller="livro" id="${generoLivro.livro.id}">${generoLivro.livro.titulo}</g:link></li>
                            </g:>
                        </ul>
                    </div>
                </li>
            </ol>

            <g:form resource="${this.genero}" method="DELETE">
                <fieldset class="buttons">
                    <g:link class="edit" action="edit" resource="${this.genero}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
                    <input class="delete" type="submit" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                </fieldset>
            </g:form>
        </div>
    </body>
</html>
