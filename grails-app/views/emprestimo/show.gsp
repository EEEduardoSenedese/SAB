<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'emprestimo.label', default: 'Emprestimo')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
		    <div class="container-fluid">
                <div class="nav-header">
		            <a href="${createLink(action: "index")}" class="navbar-brand"><%=entityName%></a>
		        </div>
                <g:form class="navbar-form navbar-right" action="pesquisar">
		            <input class="form-control" placeholder="Pesquisar ${entityName}" type="number" value="${params.parametro}" name="id">
		        </g:form>
		        <ul class="nav navbar-right navbar-nav">
                    <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
                    <li><g:link class="create" action="pesquisarAluno"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
		        </ul>
		    </div>
		</nav>

		<section class="main col-sm-offset-2">
            <div id="show-emprestimo" class="content scaffold-show" role="main">
                <h1><g:message code="default.show.label" args="[entityName]" /></h1>
                <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
                </g:if>
                <!--<f:display bean="emprestimo" except="itens"/>-->
                <ol class="property-list emprestimo">

                    <li class="fieldcontain">
                        <span id="dataDeEmprestimo-label" class="property-label">Devolvido</span>
                        <div class="property-value" aria-labelledby="devolvido-label">
                            <f:display bean="emprestimo" property="devolvido"/>
                        </div>
                    </li>

                    <li class="fieldcontain">
                        <span id="dataDeDevolucao-label" class="property-label">Data de Devolução</span>
                        <div class="property-value" aria-labelledby="dataDeDevolução-label">
                            <f:display bean="emprestimo" property="dataDeDevolucao"/>
                        </div>
                    </li>

                    <li class="fieldcontain">
                        <span id="dataDeDevolucao-label" class="property-label">Devolvido dia</span>
                        <div class="property-value" aria-labelledby="devolvidoEm-label">
                            <f:display bean="emprestimo" property="devolvidoEm"/>
                        </div>
                    </li>

                    <li class="fieldcontain">
                        <span id="pessoa-label" class="property-label">Pessoa</span>
                        <div class="property-value" aria-labelledby="pessoa-label">
                            <g:link controller="Pessoa" action="show" id="${emprestimo.pessoa.id}" target="_blank">${emprestimo.pessoa}</g:link>
                        </div>
                    </li>

                    <li class="fieldcontain">
                        <span id="ano-label" class="property-label">Ano</span>
                        <div class="property-value" aria-labelledby="ano-label">
                            <g:link controller="Pessoa" action="show" id="${emprestimo.ano.id}" target="_blank">${emprestimo.ano}</g:link>
                        </div>
                    </li>

                    <li class="fieldcontain">
                        <span id="dataDeEmprestimo-label" class="property-label">Data de Emprestimo</span>
                        <div class="property-value" aria-labelledby="dataDeEmprestimo-label">
                            <f:display bean="emprestimo" property="dataDeEmprestimo"/>
                        </div>
                    </li>

                    <br>

                    <li class="fieldcontain">
                        <span id="dataDeEmprestimo-label" class="property-label">Livro</span>
                        <div class="property-value" aria-labelledby="livro-label">
                            <f:display bean="emprestimo" property="livro"/>
                        </div>
                    </li>

                    <Br>
                </ol>

                <f:table collection="${sab.Emprestimo.findAllByPessoaAndDevolvido(emprestimo.pessoa, false, [order: desc])}" properties="['id', 'dataDeEmprestimo', 'dataDeDevolucao', 'livro']"/>

                <g:form resource="${this.emprestimo}" method="DELETE">
                    <fieldset class="buttons">
                        <g:link class="edit" action="edit" resource="${this.emprestimo}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
                        <input class="delete" type="submit" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                        <g:if test="${!emprestimo.devolvido}">
                            <g:link class="edit" action="devolver" resource="${this.emprestimo}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');">Devolver</g:link>
                            <g:link class="edit" action="renovar" resource="${this.emprestimo}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');">Renovar</g:link>
                        </g:if>
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
