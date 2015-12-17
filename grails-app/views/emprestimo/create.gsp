<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'emprestimo.label', default: 'Emprestimo')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
        <asset:javascript src="jquery-ui.js"/>
        <asset:stylesheet src="jquery-ui.css"/>

        <g:javascript>
            $.get("${createLink(controller: 'Pessoa', action: 'listagem')}", function(pessoas){
                $('#pessoas').autocomplete({source: pessoas});
            });
        </g:javascript>
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
		        <ul class="nav navbar-right navbar-nav">
                    <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
		        </ul>
		    </div>
		</nav>

		<section class="main col-sm-offset-2">
            <div id="create-emprestimo" class="content scaffold-create" role="main">
                <h1><g:message code="default.create.label" args="[entityName]" /></h1>
                <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
                </g:if>
                <g:hasErrors bean="${this.emprestimo}">
                <ul class="errors" role="alert">
                    <g:eachError bean="${this.emprestimo}" var="error">
                    <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                    </g:eachError>
                </ul>
                </g:hasErrors>
                <g:form action="save">
                    <fieldset class="form">
                        <f:field bean="emprestimo" property="pessoa">
                            <input id="pessoas" name="pessoa.nome" value="${emprestimo?.pessoa?.nome}"/>
                        </f:field>
                        <div class="escondido">
                            <f:field bean="emprestimo" property="dataDeEmprestimo"/>
                        </div>

                        <f:all bean="emprestimo" except="dataDeEmprestimo, devolvido, devolvidoEm, pessoa, livro"/>

                        <f:field bean="emprestimo" property="livro">
                            <input type="number" name="livro.id" value=""/>
                        </f:field>
                    </fieldset>
                    <fieldset class="buttons">
                        <g:submitButton name="create" class="save" value="Próximo" />
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
