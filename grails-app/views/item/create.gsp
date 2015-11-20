<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'item.label', default: 'Item')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#create-item" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
            </ul>
        </div>
        <div id="create-item" class="content scaffold-create" role="main">
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${this.item}">
            <ul class="errors" role="alert">
                <g:eachError bean="${this.item}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                </g:eachError>
            </ul>
            </g:hasErrors>
            <g:form action="save">
                <fieldset class="form">
                    <div class="escondido">
                        <f:field bean="item" property="emprestimo"/>
                    </div>

                    <f:field bean="item" property="livro">
                        <input type="number" name="livro.id" autofocus/>
                        <g:submitButton name="create" class="botao-normal" value="Adicionar Livro"/>
                    </f:field>
                </fieldset>
            </g:form>

            <fieldset class="form">
                <div class="fieldcontain">
                    <table class="tabela-de-adicao">
                        <caption>Livros adicionados</caption>
                        <g:each in="${sab.Item.findAllByEmprestimo(sab.Emprestimo.get(params.emprestimo.id))}" var="item" status="i">
                            <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                                <td>
                                    <g:link action="show" controller="Livro" id="${item.livro.id}"> ${"$item.livro.id: $item.livro.titulo"} </g:link>
                                </td>
                                <td>
                                    <g:form resource="${item}" method="DELETE">
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
                <g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
            </fieldset>
        </div>
    </body>
</html>
