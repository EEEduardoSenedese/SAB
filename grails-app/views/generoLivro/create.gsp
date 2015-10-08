<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'generoLivro.label', default: 'GeneroLivro')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
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
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                </g:eachError>
            </ul>
            </g:hasErrors>
            <g:form action="save">
                <fieldset class="form">
                    <!-- Escolhe genero -->
                    <f:field bean="generoLivro" property="genero">
                        <g:select name="genero.id" optionKey="id" from="${sab.Genero.list(sort: 'nome')}"/>
                        <g:submitButton name="create" class="save" value="Adicionar este Genero" />
                    </f:field>
                </fieldset>

                <!-- Livro -->
                <!-- Este item fica escondido -->
                <g:select name="livro.id" optionKey="id" from="${sab.Livro.get(params.long('livro.id'))}" class="escondido"/>


            </g:form>


                <fieldset class="form">
                    <!-- Tabela com os livros cadastrados -->
                    <div class="fieldcontain">
                        <table class="tabela-de-adicao">
                            <caption>Generos do Livro</caption>
                            <g:each in="${generoLivroList}" var="generoLivro" status="i">
                                <tr>
                                    <td>
                                        ${generoLivro.genero}
                                    </td>
                                    <td>
                                        <g:form resource="${this.generoLivro}" method="DELETE">
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
                <g:submitButton name="create" class="save" value="Adicionar este Genero" />
            </fieldset>
        </div>
    </body>
</html>
