<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'devolucao.label', default: 'Devolução')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#list-devolucao" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
            </ul>
        </div>
        <div id="list-devolucao" class="content scaffold-list" role="main">
            <h1>Devolução</h1>
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>

            <g:form action="show">
                <fieldset class="form">

                </fieldset>
                <ol class="property-list devolucao">
                    <li class="fieldcontain">
                        <span class="property-label">ID do livro</span>
                        <div class="property-value">
                            <input name="id-devolucao" autofocus/>
                            <g:submitButton name="devolver" class="save" value="Pesquisar"/>
                        </div>
                    </li>
                </ol>
            </g:form>
        </div>
    </body>
</html>
