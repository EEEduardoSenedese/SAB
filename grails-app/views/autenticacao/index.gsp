<!doctype html>
<html>
    <head>
        <title>Bem vindo ao SAB</title>
        <asset:stylesheet src="boasvindas.css"/>
    </head>
    <body>

        <div id="conteiner">

            <div id="controller-list" role="navigation">
                <h1>Bem vindo(a) ao Sistema de Apoio Bibliotecário</h1>
                <section>
                    <g:if test="${flash.message}">
                        <div class="message" role="status">${flash.message}</div>
                    </g:if>
                    <g:form action="autenticar" controller="autenticacao">
                        <fieldset>
                            <div class="">
                                <label for="usuario.usuario">Usuario</label>
                                <input name="usuario.usuario"/>
                            </div>
                            <div class="">
                                <label for="usuario.senha">Senha</label>
                                <input name="usuario.senha" type="password"/>
                            </div>
                        </fieldset>
                        <fieldset>
                            <g:submitButton name="autenticar" value="Autenticar" />
                        </fieldset>
                    </g:form>
                </section>
            </div>
        </div>
    </body>
</html>
