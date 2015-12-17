<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'editora.label', default: 'Editora')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
		    <div class="container-fluid">
		        <div class="nav-header">
		            <a href="#" class="navbar-brand"><%=entityName%></a>
		        </div>
                <g:form class="navbar-form navbar-right" action="pesquisar">
		            <input class="form-control" placeholder="Pesquisar ${entityName}" type="text" value="${params.parametro}" name="parametro">
		        </g:form>
		        <ul class="nav navbar-right navbar-nav">
                    <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
		        </ul>
		    </div>
		</nav>

		<section class="main col-sm-offset-2">
            <div id="list-editora" class="content scaffold-list" role="main">

                <div class="pagination">
                    <g:paginate total="${editoraCount ?: 0}" />
                </div>
                <h1><g:message code="default.list.label" args="[entityName]" /></h1>
                <g:if test="${flash.message}">
                    <div class="message" role="status">${flash.message}</div>
                </g:if>
                <f:table collection="${editoraList}" />

                <div class="pagination">
                    <g:paginate total="${editoraCount ?: 0}" />
                </div>
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
