programa
{
	inclua biblioteca Arquivos --> a
	inclua biblioteca Texto --> tx
	
funcao inicio()
{ 
	
	inteiro arq = a.abrir_arquivo("./arquivo/contas.txt", a.MODO_ACRESCENTAR)
	//a.escrever_linha("teste \n", arq)
	a.fechar_arquivo(arq)

/*
	arq = a.abrir_arquivo("./arquivo/contas.txt", a.MODO_LEITURA)
	enquanto (nao a.fim_arquivo(arq)){
		cadeia linha = a.ler_linha(arq)					
		inteiro posicao = tx.posicao_texto("conta\": 1234", linha, 0)
		pare
		escreva(posicao + " - " + linha + "\n")		
		
	}
*/

	cadeia texto = "{\"conta\": 987654, \"cpf\":012345674890 ....."
	inteiro posicao = tx.posicao_texto("conta\": 1234", texto, 0)
	escreva(posicao)
	//escreva("teste \n \t \" \\ ")
}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 76; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */