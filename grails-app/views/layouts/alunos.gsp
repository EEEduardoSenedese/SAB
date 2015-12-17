<!doctype html>
<html lang="en" class="no-js">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title><g:layoutTitle default="Grails"/></title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <asset:stylesheet src="bootstrap.css"/>
        <asset:stylesheet src="dashboard.css"/>
        <asset:stylesheet src="estilo.css"/>
        <asset:stylesheet src="application.css"/>
        <asset:javascript src="application.js"/>
        <asset:javascript src="jquery-2.1.3.js"/>

        <g:layoutHead/>
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

		        </ul>
		    </div>
		</nav>

		<section class="main col-sm-offset-2">


		    <div class="footer" role="contentinfo">
		      <h1>Sistema de apoio Bibliotecário</h1>
		      <h2>Este software está sobre a licença GPL, e seu código é mantido pela Escola Estadual Eduardo Senedese, Juruaia - Minas Gerais
		      </h2>
		      <h3>A GPL não permite que o este software seja vendido. Seu código dever ser distribuido livremente</h3>
		    </div>
		</section>


        <g:if test="${session['usuario'] != null}">
        <div class="col-md-2 col-sm-2 sidebar ">
            <ul class="nav nav-sidebar">
                <li><g:link controller="Livro">Livros</g:link></li>
                <li><g:link controller="Genero">Gêneros</g:link></li>
                <li><g:link controller="Autor">Autores</g:link></li>
                <li><g:link controller="Editora">Editoras</g:link></li>
                <li><g:link controller="Emprestimo">Emprestimos</g:link></li>
                <li><g:link controller="Categoria">Categorias</g:link></li>
                <li><g:link controller="Aquisicao">Aquisições</g:link></li>
                <li><g:link controller="Colecao">Coleções</g:link></li>
                <li><g:link controller="Prateleira">Prateleiras</g:link></li>
            </ul>


            <ul class="nav nav-sidebar">
                <li><g:link controller="Pessoa">Pessoas</g:link></li>
                <li><g:link controller="Ano">Ano</g:link></li>
                <li><g:link controller="Rua">Rua</g:link></li>
                <li><g:link controller="Bairro">Bairro</g:link></li>
                <li><g:link controller="Cidade">Cidade</g:link></li>
                <li><g:link controller="UF">UF</g:link></li>
                <li><g:link controller="Sexo">Sexo</g:link></li>
            </ul>
        </div>
            <g:layoutBody/>

            <div id="spinner" class="spinner" style="display:none;"><g:message code="spinner.alt" default="Loading&hellip;"/></div>
        </g:if>
        <g:else>
            <h1>Acesso Negado</h1>
            faça o login: <g:link controller="autenticacao">Fazer Login</g:link>
        </g:else>

        <g:javascript src="bootstrap.min.js" />
    </body>
</html>
