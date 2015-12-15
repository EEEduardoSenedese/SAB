import sab.endereco.*
import sab.individuo.*
import sab.livros.*

class BootStrap {

    def init = { servletContext ->

        def pessoa = Pessoa.findByUsuario("admin")

        if(!pessoa){
            //Endereço
            UF uf = UF.findOrSaveByNome('Não Informado')
            Cidade cidade = Cidade.findOrSaveByNomeAndUf('Não Informada', uf)
            Bairro bairro = Bairro.findOrSaveByNomeAndCidade("Não Informado", cidade)
            Rua rua = Rua.findOrSaveByNomeAndBairro("Não Informada", bairro)

            pessoa = new Pessoa(
                nome: "Administrador",
                usuario: "admin",
                senha: "admin",
                uf: uf,
                cidade: cidade,
                bairro: bairro,
                rua: rua,
                sexo: Sexo.findOrSaveByNome('Não Informado'),
                posicao: Posicao.findOrSaveByNome('Administrador'),
                numeroDaRua: 0,
                dataDeNascimento: new Date(),
                numeroDeEmprestimos: 0,
            ).save()
        }
    }
    def destroy = {
    }
}
