<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'item.label', default: 'Item')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
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
                    <g:link action="show" controller="emprestimo" id="${params.long("emprestimo.id")}">${message(code: 'default.button.create.label', default: 'Create')}</g:link>
                </fieldset>
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
