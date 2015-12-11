<!doctype html>
<html>
    <head>
        <title>Bem vindo ao SAB</title>
        <asset:stylesheet src="boasvindas.css"/>
    </head>
    <body>

        <div id="conteiner">

            <div id="controller-list" role="navigation">
                <h1>Bem vindo(a) ${session['usuario'].nome}, ao Sistema de Apoio Bibliotecário</h1>
                <section>
                  <h2>Módulos disponíveis:</h2>

                  <table>
                    <tr>
                      <td>
                        <g:link controller="livro">Livros</g:link>
                      </td>
                      <td>
                        <g:link controller="Pessoa">Alunos e Professores</g:link>
                      </td>
                      <td>
                        <g:link controller="Autenticacao" action="sair">Sair</g:link>
                      </td>
                    </tr>
                  </table>
                </section>
            </div>
        </div>
    </body>
</html>
