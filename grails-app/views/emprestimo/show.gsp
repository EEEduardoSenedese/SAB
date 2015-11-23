<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'emprestimo.label', default: 'Emprestimo')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#show-emprestimo" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
                <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
            </ul>
        </div>
        <div id="show-emprestimo" class="content scaffold-show" role="main">
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

                <li class="fieldcontain">
                    <span id="itens-label" class="property-label">Livro(s) do emprestimo</span>
                    <div class="property-value" aria-labelledby="itens-label">
                        <ul>
                            <g:each var="item" in="${sab.Item.findAllByEmprestimo(emprestimo)}">
                                <li><g:link  controller="item" action="show" target="_blank" id="${item.livro.id}">${item.livro.titulo}</g:link ></li>
                            </g:each>
                        </ul>
                    </div>
                </li>
            </ol>

            <g:form resource="${this.emprestimo}" method="DELETE">
                <fieldset class="buttons">
                    <g:link class="edit" action="edit" resource="${this.emprestimo}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
                    <input class="delete" type="submit" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                </fieldset>
            </g:form>
        </div>
    </body>
</html>
