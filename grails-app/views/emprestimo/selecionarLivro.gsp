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
                <h1>Emprestimo para ${emprestimo.pessoa.nome}</h1>
                <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
                </g:if>
                <!--<f:display bean="emprestimo" except="itens"/>-->

                <g:form action="finalizarEmprestimo">
                    <fieldset class="form">
                        <f:all bean="emprestimo" except="devolvidoEm, dataDeEmprestimo, devolvido, livro, pessoa"/>
                        <div class="escondido">
                            <f:field bean="emprestimo" property="dataDeEmprestimo"/>
                            <f:field bean="emprestimo" property="pessoa"/>
                        </div>
                        <f:field bean="emprestimo" property="livro.id">
                            <f:widget bean="emprestimo" property="livro.id" autofocus="true"/>
                        </f:field>
                    </fieldset>

                    <f:table collection="${emprestimoList}" properties="['id', "dataDeEmprestimo", "dataDeDevolucao", "livro", "devolvido"]"/>
                    <fieldset class="buttons">
                        <g:link action="index"> Sair</g:link>
                        <g:submitButton name="create" class="save" value="Fazer Emprestimo"/>
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
        <a href="#show-emprestimo" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
                <li><g:link class="create" action="pesquisarAluno"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
                <li>
                    <g:form action="pesquisarLivro">
                        <label for="devolucao">Pesquisar emprestimo</label>
                        <input type="number" name="id" value="" placeholder="Id do livro">
                        <g:submitButton name="search" class="edit" value="Pesquisar"/>
                    </g:form>
                </li>
            </ul>
        </div>

    </body>
</html>
