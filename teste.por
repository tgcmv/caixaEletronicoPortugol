programa
{
	inclua biblioteca Arquivos --> a
	inclua biblioteca Texto --> tx
	inclua biblioteca Objetos --> o
	
funcao inicio()
{ 
	
	inteiro arq = a.abrir_arquivo("./arquivo/contas.txt", a.MODO_ACRESCENTAR)
	//a.escrever_linha("teste \n", arq)
	a.fechar_arquivo(arq)


	arq = a.abrir_arquivo("./arquivo/contas.txt", a.MODO_LEITURA)
	cadeia linha = ""
	enquanto (nao a.fim_arquivo(arq)){
		linha = a.ler_linha(arq)					
		pare
		
	}
	escreva(linha + "\n")
	
	//linha = "{\"conta\": 1234}"
	
	//o.atribuir_propriedade(conta, "teste", 123)
	//o.atribuir_propriedade(conta, "teste1", "oi")
	inteiro dadosDaConta = o.criar_objeto_via_json(linha)
	escreva(o.obter_json(dadosDaConta) + "\n")
	escreva(o.obter_propriedade_tipo_cadeia(dadosDaConta, "nome") + "\n")
	//inteiro posicao = tx.posicao_texto("conta\": 1234", texto, 0)
	//escreva(posicao)
	//inteiro conta = o.criar_objeto()
	//escreva("teste \n \t \" \\ ")
}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 686; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */