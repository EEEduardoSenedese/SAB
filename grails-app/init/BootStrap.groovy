import sab.endereco.*
import sab.individuo.*

class BootStrap {

    def init = { servletContext ->
        def pessoa = Pessoa.findByUsuario("admin")

        if(!pessoa){
            pessoa = new Pessoa(
                nome: "Administrador",
                usuario: "admin",
                senha: "admin",
                bairro: Bairro.list(max: 1)[0],
                cidade: Cidade.list(max: 1)[0],
                posicao: Posicao.list(max: 1)[0],
                uf: UF.list(max: 1)[0],
                rua: Rua.list(max: 1)[0],
                sexo: Sexo.list(max:1)[0],
                numeroDaRua: 0,
                dataDeNascimento: new Date(),
                numeroDeEmprestimos: 0,
            ).save()
        }
    }
    def destroy = {
    }
}
