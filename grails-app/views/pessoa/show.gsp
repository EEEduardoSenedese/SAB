<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="alunos" />
        <g:set var="entityName" value="${message(code: 'pessoa.label', default: 'Pessoa')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
            <div class="container-fluid">
                <div class="nav-header">
                    <a href="#" class="navbar-brand"><%=entityName%></a>
                </div>
                <g:form class="navbar-form navbar-right" action="pesquisar">
                    <input class="form-control" placeholder="Pesquisar Pessoa" type="text">
                </g:form>
                <ul class="nav navbar-right navbar-nav">
                    <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
                    <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
                </ul>
            </div>
        </nav>
        <section class="main col-sm-offset-2">
            <div id="show-pessoa" class="content scaffold-show" role="main">
                <h1><g:message code="default.show.label" args="[entityName]" /></h1>
                <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
                </g:if>
                <!--<f:display bean="pessoa" except="emprestimo"/>-->

                <ol class="property-list pessoa">

                    <li class="fieldcontain">
                        <span id="nome-label" class="property-label">Nome</span>
                        <div class="property-value" aria-labelledby="nome-label"><f:display bean="pessoa" property="nome"/></div>
                    </li>

                    <li class="fieldcontain">
                        <span id="email-label" class="property-label">Email</span>
                        <div class="property-value" aria-labelledby="email-label"><f:display bean="pessoa" property="email"/></div>
                    </li>

                    <li class="fieldcontain">
                        <span id="usuario-label" class="property-label">Usuario</span>
                        <div class="property-value" aria-labelledby="usuario-label"><f:display bean="pessoa" property="usuario"/></div>
                    </li>

                    <li class="fieldcontain">
                        <span id="numeroDaRua-label" class="property-label">Numero Da Rua</span>
                        <div class="property-value" aria-labelledby="numeroDaRua-label"><f:display bean="pessoa" property="numeroDaRua"/></div>
                    </li>

                    <li class="fieldcontain">
                        <span id="telefone-label" class="property-label">Telefone</span>
                        <div class="property-value" aria-labelledby="telefone-label"><f:display bean="pessoa" property="telefone"/></div>
                    </li>

                    <li class="fieldcontain">
                        <span id="cep-label" class="property-label">Cep</span>
                        <div class="property-value" aria-labelledby="cep-label"><f:display bean="pessoa" property="cep"/></div>
                    </li>

                    <li class="fieldcontain">
                        <span id="complemento-label" class="property-label">Complemento</span>
                        <div class="property-value" aria-labelledby="complemento-label"><f:display bean="pessoa" property="complemento"/></div>
                    </li>

                    <li class="fieldcontain">
                        <span id="nacionalidade-label" class="property-label">Nacionalidade</span>
                        <div class="property-value" aria-labelledby="nacionalidade-label"><f:display bean="pessoa" property="nacionalidade"/></div>
                    </li>

                    <li class="fieldcontain">
                        <span id="pai-label" class="property-label">Pai</span>
                        <div class="property-value" aria-labelledby="pai-label"><f:display bean="pessoa" property="pai"/></div>
                    </li>

                    <li class="fieldcontain">
                        <span id="mae-label" class="property-label">Mae</span>
                        <div class="property-value" aria-labelledby="mae-label"><f:display bean="pessoa" property="mae"/></div>
                    </li>

                    <li class="fieldcontain">
                        <span id="naturalidade-label" class="property-label">Naturalidade</span>
                        <div class="property-value" aria-labelledby="naturalidade-label"><f:display bean="pessoa" property="naturalidade"/></div>
                    </li>

                    <li class="fieldcontain">
                        <span id="bairro-label" class="property-label">Bairro</span>
                        <div class="property-value" aria-labelledby="bairro-label"><f:display bean="pessoa" property="bairro"/></div>
                    </li>

                    <li class="fieldcontain">
                        <span id="cidade-label" class="property-label">Cidade</span>
                        <div class="property-value" aria-labelledby="cidade-label"><f:display bean="pessoa" property="cidade"/></div>
                    </li>

                    <li class="fieldcontain">
                        <span id="dataDeNascimento-label" class="property-label">Data De Nascimento</span>
                        <div class="property-value" aria-labelledby="dataDeNascimento-label"><f:display bean="pessoa" property="dataDeNascimento"/></div>
                    </li>

                    <li class="fieldcontain">
                        <span id="numeroDeEmprestimos-label" class="property-label">Numero De Emprestimos</span>
                        <div class="property-value" aria-labelledby="numeroDeEmprestimos-label"><f:display bean="pessoa" property="numeroDeEmprestimos"/></div>
                    </li>

                    <li class="fieldcontain">
                        <span id="posicao-label" class="property-label">Posicao</span>
                        <div class="property-value" aria-labelledby="posicao-label"><f:display bean="pessoa" property="posicao"/></div>
                    </li>

                    <li class="fieldcontain">
                        <span id="rua-label" class="property-label">Rua</span>
                        <div class="property-value" aria-labelledby="rua-label"><f:display bean="pessoa" property="rua"/></div>
                    </li>

                    <li class="fieldcontain">
                        <span id="sexo-label" class="property-label">Sexo</span>
                        <div class="property-value" aria-labelledby="sexo-label"><f:display bean="pessoa" property="sexo"/></div>
                    </li>

                    <li class="fieldcontain">
                        <span id="uf-label" class="property-label">Uf</span>
                        <div class="property-value" aria-labelledby="uf-label"><f:display bean="pessoa" property="uf"/></div>
                    </li>

            </ol>
                <g:form resource="${this.pessoa}" method="DELETE">
                    <fieldset class="buttons">
                        <g:link class="edit" action="edit" resource="${this.pessoa}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
                        <input class="delete" type="submit" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
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
