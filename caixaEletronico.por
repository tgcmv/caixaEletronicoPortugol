programa
{
inclua biblioteca Arquivos --> a
inclua biblioteca Util --> util
inclua biblioteca Texto --> tx
inclua biblioteca Objetos --> o
	
cadeia idioma = "ptBr"
logico logado = falso

funcao inicio()
{
	enquanto(verdadeiro){
		escreval(" Escolha uma opção")
		escreval(" 1 - Acessar sua conta")
		escreval(" 2 - Criar uma conta")
		inteiro opcao
		leia(opcao)
		limpa()
		se(opcao == 1){
			acessarConta()
		}senao se(opcao == 2){
			criarConta()
		} senao {
			escreval("Opção invalida")
		}
	}
}

funcao acessarConta(){
	escreval("Digite o numero da sua conta e sua senha de 6 digitos")
	inteiro conta, senha
	leia(conta, senha)
	inteiro objConta = buscaConta(conta)

	se(objConta == -1){
		escreval("Conta não encontrada")
	} senao {
		//TODO validar senha
		logado = verdadeiro
		telaOperacaoBancaria(objConta)
	}
}

funcao telaOperacaoBancaria(inteiro objConta){
	cadeia nome = o.obter_propriedade_tipo_cadeia(objConta, "nome")
	
	enquanto(logado){
		limpa()
		escreval("Olá " + nome)
		escreval(" Escolha uma opção: ")
		escreval(" 1 - Saldo")
		escreval(" 2 - Extrato")
		escreval(" 3 - Saque")
		escreval(" 4 - Deposito")
		escreval(" 5 - Sair")
		inteiro opcao
		leia(opcao)
		escolha(opcao){

			caso 1: 
				escreva("saldo escolhido")
				pare
			caso 2: 
				escreva("extrato escolhido")
				pare
			caso 3: 
				escreva("saque escolhido")
				pare
			caso 4: 
				escreva("deposito escolhido")
				pare
			caso 5: 
				escreva("sair escolhido")
				logado = falso
				pare
			caso contrario: 
				escreva(" Opção invalida ")
				pare
		}
	}
}

funcao inteiro buscaConta(inteiro conta){
	inteiro objConta = -1
	inteiro arq = a.abrir_arquivo("./arquivo/contas.txt", a.MODO_LEITURA)
	
	enquanto (nao a.fim_arquivo(arq)){
		cadeia linha = a.ler_linha(arq)					
		inteiro posicao = tx.posicao_texto("conta\" : " + conta, linha, 0)
		logico contaEncontrada = (posicao > 0)
		se(contaEncontrada){
			objConta = o.criar_objeto_via_json(linha)
			pare
		}
	}

	retorne objConta;
}

funcao criarConta(){
	cadeia opcao
	cadeia cpf
	cadeia dataNascimento
	cadeia nome
	inteiro senha
	
	escreval("Bem vindo ao Banco do Start Latam!")
	escreval("Você está criando uma conta, digite qualquer coisa para continuar")
	escreval("ou se já tem um conta digite SAIR para voltar a tela inicial!")
	leia(opcao)

	se (opcao == "SAIR" ou opcao == "sair"){
		retorne
	}

	escreval("informe seu cpf:")
	leia(cpf)
	//TODO validar cpf
	escreval("informe sua data de nascimento:")
	leia(dataNascimento)
	//TODO validar data de nascimento só para maiores de 18 anos
	escreval("informe seu nome:")
	leia(nome)
	//TODO Verificar se só tem letras
	//TODO repetir informações para confirmar se está ok
	limpa()
	senha = cadastraSenha()

	inteiro numDaConta = numeroDaConta()
	cadeia dadosDaConta = "{\"conta\" : " + numDaConta + ","
	dadosDaConta = dadosDaConta + " \"cpf\" : \"" + cpf  + "\","
	dadosDaConta += " \"dtNascimento\" : \"" + dataNascimento + "\","
	dadosDaConta += " \"nome\" : \"" + nome + "\",",
	dadosDaConta += " \"senha\" : " + senha + "}"

	escreverNoArquivo("./arquivo/contas.txt", dadosDaConta)
	
}

funcao escreverNoArquivo(cadeia arquivo, cadeia conteudo){
	inteiro arq = a.abrir_arquivo(arquivo, a.MODO_ACRESCENTAR)
	a.escrever_linha(conteudo, arq)
	a.fechar_arquivo(arq)
}

funcao inteiro numeroDaConta(){
	//TODO garantir que o numero da conta não seja repetido com uma conta que já existe
	retorne util.sorteia(1000, 9999)
	
}

funcao inteiro cadastraSenha(){
	logico senhaCadastraComSucesso = falso
	inteiro senha = 0
	inteiro confirmaSenha
	
	enquanto(nao senhaCadastraComSucesso){
		escreval("Digite uma senha com 6 numeros:")
		leia(senha)
		enquanto(nao senhaCom6Numeros(senha)){
			escreval("Senha invalida")
			escreval("digite uma senha com 6 numeros:")
			leia(senha)	
		}
		
		escreval("confirme sua senha")
		leia(confirmaSenha)
		se(senha == confirmaSenha){
			senhaCadastraComSucesso = verdadeiro
		} senao {
			limpa()
			escreval("senhas não conferem!")
		}
	}

	retorne senha
}

funcao logico senhaCom6Numeros(inteiro senha){
	logico senhaTem6Numero = (senha/100000 >= 1 e senha/100000 < 10)
	retorne senhaTem6Numero
}

funcao escreval(cadeia texto){
	//cadeia texto = lerArquivo(idioma, nomeMensagem)
	escreva(texto + "\n")
}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 1545; 
 * @DOBRAMENTO-CODIGO = [140, 146, 152, 179, 184];
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */