<!doctype html>
<html>
    <head>
        <title>Welcome to Grails</title>
        <style type="text/css">
            #conteiner{
              margin: 80px 15%;
              border: 1px solid gray;
              padding: 30px;
              border-radius: 10px;
              background-color: #f2f2f2;
              box-shadow: 1px 1px 5px rgba(0, 0, 0, 1);
            }

            h1{
              color: #3eb0eb;
              margin-bottom: 50px;
              text-shadow: 1px 1px 1px rgba(#3eb0eb, 0.5);
            }

            h2{
              margin: 10px;
              color: #4d4d4d;
              text-shadow: 1px 1px 1px rgba(0, 0, 0, 0.5);
              margin-bottom: 60px;
            }

            section{
              margin: 30px;
            }

            table{
              margin: auto;
              margin-top: 50px;
              margin-bottom: 50px;
              padding: 20px;
            }

            table a{
              margin: 10px;
              padding: 50px 70px;
              background-color: #3eb0eb;
              text-decoration: none;
              font-weight: bold;
              color: white;
              border-radius: 10px;
              box-shadow: 1px 1px 10px rgba(0, 0, 0, 0.5);
              font-size: 15pt;
            }

            body{
              background-color: #252525;
              font-family: monospace sans-serif;
            }

        </style>
    </head>
    <body>

        <div id="conteiner">

            <div id="controller-list" role="navigation">
                <h1>Bem vindo(a) ao Sistema de Apoio Bibliotecário</h1>
                <section>
                  <h2>Módulos disponíveis:</h2>

                  <table>
                    <tr>
                      <td>
                        <g:link controller="livro">Livros</g:link>
                      </td>
                      <td>
                        <g:link controller="aluno">Alunos</g:link>
                      </td>
                    </tr>
                  </table>
                </section>
            </div>
        </div>
    </body>
</html>
