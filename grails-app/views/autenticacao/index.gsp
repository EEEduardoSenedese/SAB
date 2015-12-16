<!doctype html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE-edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Bem vindo ao SAB</title>
        <asset:stylesheet src="bootstrap.css"/>
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

                    <g:form action="autenticar" class="form-signin">
                        <div class="form-signin">
                            <fieldset>
                                <label for="pessoa.usuario" class="sr-only">Usuario</label>
                                <input name="usuario" class="form-control" placeholder="Usuário" autofocus="true" id="usuario"/>

                                <label for="pessoa.senha" class="sr-only">Senha</label>
                                <input name="senha" type="password" class="form-control" placeholder="Senha" id="senha"/>
                            </fieldset>
                            <fieldset>
                                <g:submitButton name="autenticar" value="Autenticar" class="btn btn-lg btn-primary btn-block" />
                            </fieldset>
                        </div>
                    </g:form>
                </section>
            </div>
        </div>
        <g:javascript src="bootstrap.min.js"/>
    </body>
</html>
