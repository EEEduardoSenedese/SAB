<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'emprestimo.label', default: 'Emprestimo')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
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
                <g:form action="relatorioIndex" class="navbar-form navbar-right">
                    <label for="data">Início</label>
                    <g:datePicker id="data" precision="day" name="data"  value="${data}"/>
                    <g:submitButton name="search" class="edit" value="Alterar dia"/>
                </g:form>
		    </div>
		</nav>

		<section class="main col-sm-offset-2">
            <div id="list-emprestimo" class="content scaffold-list" role="main">
                <h1>Emprestimos do Dia</h1>
                <g:if test="${flash.message}">
                    <div class="message" role="status">${flash.message}</div>
                </g:if>
                <ol class="property-list livro">

                    <li class="fieldcontain">
                        <span id="titulo-label" class="property-label">Total de Emprestimo</span>
                        <div class="property-value" aria-labelledby="titulo-label">${emprestimoList.size()}</div>
                    </li>
                </ol>
                <g:if test="${emprestimoList.size() > 0}">
                    <f:table collection="${emprestimoList}" properties="['id', "pessoa", "ano", "livro", "dataDeEmprestimo"]"/>
                </g:if>
                <g:else>
                <ol class="property-list livro">

                    <li class="fieldcontain">
                        <p>
                            Nenhuma devolução para esta data
                        </p>
                    </li>
                </ol>
                </g:else>
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
