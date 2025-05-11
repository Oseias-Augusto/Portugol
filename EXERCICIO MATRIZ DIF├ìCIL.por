programa
{
	
	funcao inicio()
	{
		inteiro linha = 0, coluna = 0, matriz[3][3], soma[8], ord =0

		
		

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
				se(linha == 0)
				{
					soma[ord] += matriz[linha][coluna]
				}senao se(linha == 1)
				{
					soma[ord] += matriz[linha][coluna]
				}senao se(linha == 2)
				{
					soma[ord] += matriz[linha][coluna]
				}senao se(linha == coluna)
				{
					soma[ord] += matriz[linha][coluna]
				}senao se( linha + coluna == 2)
				{
					soma[ord] += matriz[linha][coluna]
				}
			}
			ord++
		}

		para( inteiro ord = 0; i < 7; i++)
		{
			se (soma[ord] == soma[ord+1])
			{
				
			}
		}

	para
		

		
	}
}

/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 921; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */