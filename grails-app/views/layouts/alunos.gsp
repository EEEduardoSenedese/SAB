<!doctype html>
<html lang="en" class="no-js">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title><g:layoutTitle default="Grails"/></title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <asset:stylesheet src="application.css"/>
        <asset:stylesheet src="estilo.css"/>
        <asset:javascript src="application.js"/>

        <g:layoutHead/>
    </head>
    <body>
        <g:if test="${session['usuario'] != null}">
            <header>
                <nav id="menu-corpo">
                  <h2>Menu</h2>
                  <ul>
                      <li><g:link controller="Pessoa">Pessoas</g:link></li>
                      <li><g:link controller="Ano">Ano</g:link></li>
                      <li><g:link controller="Rua">Rua</g:link></li>
                      <li><g:link controller="Bairro">Bairro</g:link></li>
                      <li><g:link controller="Cidade">Cidade</g:link></li>
                      <li><g:link controller="UF">UF</g:link></li>
                      <li><g:link controller="Sexo">Sexo</g:link></li>
                  </ul>
                </nav>
            </header>

            <section>
                <g:layoutBody/>
            </section>

            <div class="footer" role="contentinfo">
              <h1>Sistema de apoio Bibliotecário</h1>
              <h2>Este software está sobre a licença GPL, e seu código é mantido pela Escola Estadual Eduardo Senedese, Juruaia - Minas Gerais
              </h2>
              <h3>A GPL não permite que o este software seja vendido. Seu código dever ser distribuido livremente</h3>
            </div>
            <div id="spinner" class="spinner" style="display:none;"><g:message code="spinner.alt" default="Loading&hellip;"/></div>
        </body>
    </g:if>
    <g:else>
        <h1>Acesso Negado</h1>
    </g:else>
</html>
