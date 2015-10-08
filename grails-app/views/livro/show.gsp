<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'livro.label', default: 'Livro')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#show-livro" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>

        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
                <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
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
        <div id="show-livro" class="content scaffold-show" role="main">
            <h1><g:message code="default.show.label" args="["$entityName $livro.id"]" /></h1>
            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>
            <f:display bean="livro"/>

            <g:form resource="${this.livro}" method="DELETE">
                <fieldset class="buttons">
                    <g:link class="edit" action="edit" resource="${this.livro}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
                    <input class="delete" type="submit" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />

                    <g:link class="edit" controller="GeneroLivro" action="create" params="[ 'livro.id': this.livro.id]">Adicionar Genero</g:link>

                    <g:link class="edit" controller="AutorLivro" action="create" params="[ 'livro.id': this.livro.id]">Adicionar Autor</g:link>

                    <g:link class="edit" action="duplicar" resource="${this.livro}">Duplicar Livro</g:link>
                </fieldset>
            </g:form>
        </div>
    </body>
</html>
