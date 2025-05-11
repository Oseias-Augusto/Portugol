programa
{
	
	funcao inicio()
	{
		inteiro matriz[3][3], linha, coluna

		para( linha = 0; linha < 3; linha++)
		{
			para( coluna = 0; coluna < 3; coluna++)
			{
				escreva("\nDigite o número que estará na ", linha + 1, "ª linha e ", coluna + 1, "ª coluna ")
				leia(matriz[linha][coluna])
			}
		}


		para( linha = 0; linha < 3; linha++)
		{
			escreva("\n")
			para( coluna = 0; coluna < 3; coluna++) 
			{
				se( linha != coluna)
				{
					escreva("", matriz[linha][coluna], " ") 
				}senao{
					escreva(" ")
				}
			}
		
		}
		escreva("\n")

		
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 569; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */