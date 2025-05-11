programa
{
    // Importa biblioteca utilitária para funções de sorteio
    inclua biblioteca Util --> u
    
    funcao inicio()
    {
        // Declaração de variáveis
        inteiro linha = 1, coluna = 1
        inteiro NumAleatorio = 0, comparar
        inteiro contadorMinas = 0, qtdBombas, qtdSeguros = 0, jogadorL, jogadorC
        caracter dif
        caracter menu = ' '
        logico perder = falso


        enquanto( menu != 'S' ou menu != 's')
        {

		// Zera contadores e flags a cada volta de menu
            contadorMinas = 0
            qtdSeguros = 0
            perder = falso
            
	        // Semente inicial (não altera lógica existente)
	        NumAleatorio = u.sorteia(1,10)
	        
	        // Cabeçalho do jogo
	        escreva("\n\t| CAMPO MINADO |\t\n")
	
	        escreva("\nMenu:\nJogar\t-\tJ\nRegras\t-\tR\nSair\t-\tS\n")
	        escreva("Digite: ")
	        leia(menu)

	        se(menu == 'R' ou menu == 'r')
	        {
			escreva("\nRegras do Campo Minado:\n")
                escreva("- Abra todas as casas que não têm bomba.\n")
                escreva("- Se escolher uma casa com bomba, você perde.\n")
                escreva("- Vitória ao revelar todas as casas seguras.\n\n")
	        	
	        }senao se( menu == 'J' ou menu == 'j')
	        {
	
		        escreva("\n")
		        
		        // Seleção de dificuldade
		        escreva("\nSelecione a dificuldade conforme o menu abaixo: ")
		        escreva("\nFácil\t-\tF")
		        escreva(" \nMedio\t-\tM")
		        escreva(" \nDificil\t-\tD\n")
		        escreva("\nDificuldade: ")
		        leia(dif)
		
		        escreva("\n")
		        escolha(dif)
		        {
		        	//Dificuldade Fácil
				caso 'F':
					escreva("\n")
		                // Declaração das matrizes para dificuldade Fácil
		                inteiro mapaFacil[4][4]
		                logico visivel[4][4]
		
		                // Inicializa matriz de visibilidade com falso
		                para(linha = 0; linha <= 3; linha++)
		                {
		                    para(coluna = 0; coluna <= 3; coluna++)
		                    {
		                        visivel[linha][coluna] = falso
		                    }   
		                }
		
		                // Inicializa mapa com zeros
		                para(linha = 0; linha <= 3; linha++)
		                {
		                    para(coluna = 0; coluna <= 3; coluna++)
		                    {
		                        mapaFacil[linha][coluna] = 0
		                    }   
		                }
		
		                // Coloca as bombas (1) aleatoriamente
		                para(qtdBombas = 3; contadorMinas < qtdBombas; contadorMinas++)
		                {
		                    linha  = u.sorteia(0, 3)
		                    coluna = u.sorteia(0, 3)
		
		                    se(mapaFacil[linha][coluna] == 0)
		                    {
		                        mapaFacil[linha][coluna] = 1
		                    }
		                    senao
		                    {
		                        // Re-sorteia até encontrar posição vazia
		                        enquanto(mapaFacil[linha][coluna] == 1)
		                        {
		                            linha  = u.sorteia(0, 3)
		                            coluna = u.sorteia(0, 3)
		                            
		                            se(mapaFacil[linha][coluna] == 0)
		                            {
		                                mapaFacil[linha][coluna] = 1
		                            }
		                        }
		                    }
		                }
		                
		                // Exibe mapas iniciais com X (não reveladas)
		                escreva("     ")
		                para(coluna = 0; coluna <= 3; coluna++)
		                {
		                    escreva(" ", coluna+1, "  ")
		                }
		                para(linha = 0; linha <= 3; linha++)
		                {   
		                    escreva("\n")
		                    escreva(" ", linha+1, "  ")
		                    para(coluna = 0; coluna <= 3; coluna++)
		                    {
		                        escreva("| X ")
		                    }
		                    escreva("|")
		                }
		
		                // Início do loop de jogo
		                enquanto(perder == falso)
		                {	
		                	escreva("\n")
		                    // Entrada da linha do jogador
		                    escreva("\nDigite a linha: ")
		                    leia(jogadorL)
		                    enquanto(jogadorL < 0 ou jogadorL > 4)
		                    {
		                        escreva("\nErro: Valor inválido de linha \n")
		                        escreva("\nDigite a linha: ")
		                        leia(jogadorL)
		                    }
		                    jogadorL--  // Ajusta para índice 0-based
		                    
		                    // Entrada da coluna do jogador
		                    escreva("\nDigite a Coluna: ")
		                    leia(jogadorC)
		                    enquanto(jogadorC < 0 ou jogadorC > 4)
		                    {
		                        escreva("\nErro: Valor inválido de coluna \n")
		                        escreva("\nDigite a Coluna: ")
		                        leia(jogadorC)
		                    }
		                    jogadorC-- // Ajusta para índice 0-based
		                    
		                    // Verifica se é bomba
		                    se(mapaFacil[jogadorL][jogadorC] == 1)
		                    {
		                        // Jogador perde - revela todo o mapa
		                        escreva("\nVocê Perdeu!! \n")
		                      
						    escreva("     ")
				              para(coluna = 0; coluna <= 3; coluna++)
				              {
				              		escreva(" ", coluna+1, "  ")
				              }
				              para(linha = 0; linha <= 3; linha++)
				              {
				              		escreva("\n")
								escreva(" ", linha+1, "  ")
				                    para(coluna = 0; coluna <= 3; coluna++)
				                    {
				                        escreva("| ", mapaFacil[linha][coluna])
				                    }
				                    escreva("|")
				              }
				              
		                        pare
		                        
		                    }senao{
		                        // Marca célula escolhida como visível
		                        visivel[jogadorL][jogadorC] = verdadeiro
		
		                        // Revela vizinhos não-bomba nas quatro direções
		                        // Cima
		                        se(jogadorL - 1 >= 0)
		                        {
		                            se(mapaFacil[jogadorL - 1][jogadorC] == 0)
		                            {
		                                visivel[jogadorL - 1][jogadorC] = verdadeiro
		                            }
		                        }
		                        // Baixo
		                        se(jogadorL + 1 <= 3)
		                        {
		                            se(mapaFacil[jogadorL + 1][jogadorC] == 0)
		                            {
		                                visivel[jogadorL + 1][jogadorC] = verdadeiro
		                            }
		                        }
		                        // Esquerda
		                        se(jogadorC - 1 >= 0)
		                        {
		                            se(mapaFacil[jogadorL][jogadorC - 1] == 0)
		                            {
		                                visivel[jogadorL][jogadorC - 1] = verdadeiro
		                            }
		                        }
		                        // Direita
		                        se(jogadorC + 1 <= 3)
		                        {
		                            se(mapaFacil[jogadorL][jogadorC + 1] == 0)
		                            {
		                                visivel[jogadorL][jogadorC + 1] = verdadeiro
		                            }
		                        }
		                    }
		
						 escreva("     ")
			                para(coluna = 0; coluna <= 3; coluna++)
			                {
			                    escreva(" ", coluna+1, "  ")
			                }
			                para(linha = 0; linha <= 3; linha++)
			                {   
			                    escreva("\n")
			                    escreva(" ", linha+1, "  ")
			                    para(coluna = 0; coluna <= 3; coluna++)
			                    {
			                    	se( visivel[linha][coluna] == verdadeiro)
			                    	{
			                    		escreva("| ", mapaFacil[jogadorL][jogadorC], " ")
			                    		qtdSeguros++  
			                    	}senao{
			                    		escreva("| X ")
			                    	}
			                    }
			                    escreva("|")
			                }
		
			                se( qtdSeguros == 13)
			                {
			                	escreva("\n\tVOCÊ GANHOU\t\n")
			                	perder = verdadeiro
			                }
		                    
		                }
					pare
		
					//Dificuldade Média
					caso 'M':
		
					escreva("\n")
					 // Declaração das matrizes para dificuldade media
		                inteiro mapaMedio[8][8]
		                logico visivelM[8][8]
		
		                // Inicializa matriz de visibilidade com falso
		                para(linha = 0; linha <= 7; linha++)
		                {
		                    para(coluna = 0; coluna <= 7; coluna++)
		                    {
		                        visivelM[linha][coluna] = falso
		                    }   
		                }
		
		                // Inicializa mapa com zeros
		                para(linha = 0; linha <= 7; linha++)
		                {
		                    para(coluna = 0; coluna <= 7; coluna++)
		                    {
		                        mapaMedio[linha][coluna] = 0
		                    }   
		                }
		
		                // Coloca as bombas (1) aleatoriamente
		                para(qtdBombas = 6; contadorMinas < qtdBombas; contadorMinas++)
		                {
		                    linha  = u.sorteia(0, 7)
		                    coluna = u.sorteia(0, 7)
		
		                    se(mapaMedio[linha][coluna] == 0)
		                    {
		                        mapaMedio[linha][coluna] = 1
		                    }
		                    senao
		                    {
		                        // Re-sorteia até encontrar posição vazia
		                        enquanto(mapaMedio[linha][coluna] == 1)
		                        {
		                            linha  = u.sorteia(0, 7)
		                            coluna = u.sorteia(0, 7)
		                            
		                            se(mapaMedio[linha][coluna] == 0)
		                            {
		                                mapaMedio[linha][coluna] = 1
		                            }
		                        }
		                    }
		                }
		                
		                // Exibe mapas iniciais com X (não reveladas)
		                escreva("     ")
		                para(coluna = 0; coluna <= 7; coluna++)
		                {
		                    escreva(" ", coluna+1, "  ")
		                }
		                para(linha = 0; linha <= 7; linha++)
		                {   
		                    escreva("\n")
		                    escreva(" ", linha+1, "  ")
		                    para(coluna = 0; coluna <= 7; coluna++)
		                    {
		                        escreva("| X ")
		                    }
		                    escreva("|")
		                }
		
		                // Início do loop de jogo
		                enquanto(perder == falso)
		                {
		                	escreva("\n")
		                    // Entrada da linha do jogador
		                    escreva("\nDigite a linha: ")
		                    leia(jogadorL)
		                    enquanto(jogadorL < 0 ou jogadorL > 8)
		                    {
		                        escreva("\nErro: Valor inválido de linha \n")
		                        escreva("\nDigite a linha: ")
		                        leia(jogadorL)
		                    }
		                    jogadorL--  // Ajusta para índice 0-based
		                    
		                    // Entrada da coluna do jogador
		                    escreva("\nDigite a Coluna: ")
		                    leia(jogadorC)
		                    enquanto(jogadorC < 0 ou jogadorC > 8)
		                    {
		                        escreva("\nErro: Valor inválido de coluna \n")
		                        escreva("\nDigite a Coluna: ")
		                        leia(jogadorC)
		                    }
		                    jogadorC-- // Ajusta para índice 0-based
		                    
		                    // Verifica se é bomba
		                    se(mapaMedio[jogadorL][jogadorC] == 1)
		                    {
		                        // Jogador perde - revela todo o mapa
		                        escreva("\nVocê Perdeu!! \n")
		                      
						    escreva("     ")
				              para(coluna = 0; coluna <= 7; coluna++)
				              {
				              		escreva(" ", coluna+1, "  ")
				              }
				              para(linha = 0; linha <= 7; linha++)
				              {
				              		escreva("\n")
								escreva(" ", linha+1, "  ")
				                    para(coluna = 0; coluna <= 7; coluna++)
				                    {
				                        escreva("| ", mapaMedio[linha][coluna], " ")
				                    }
				                    escreva("|")
				              }
				              escreva("\n")
		                        pare
		                        
		                    }senao{
		                        // Marca célula escolhida como visível
		                        visivelM[jogadorL][jogadorC] = verdadeiro
		
		                        // Revela vizinhos não-bomba nas quatro direções
		                        // Cima
		                        se(jogadorL - 1 >= 0)
		                        {
		                            se(mapaMedio[jogadorL - 1][jogadorC] == 0)
		                            {
		                                visivelM[jogadorL - 1][jogadorC] = verdadeiro
		                            }
		                        }
		                        // Baixo
		                        se(jogadorL + 1 <= 7)
		                        {
		                            se(mapaMedio[jogadorL + 1][jogadorC] == 0)
		                            {
		                                visivelM[jogadorL + 1][jogadorC] = verdadeiro
		                            }
		                        }
		                        // Esquerda
		                        se(jogadorC - 1 >= 0)
		                        {
		                            se(mapaMedio[jogadorL][jogadorC - 1] == 0)
		                            {
		                                visivelM[jogadorL][jogadorC - 1] = verdadeiro
		                            }
		                        }
		                        // Direita
		                        se(jogadorC + 1 <= 7)
		                        {
		                            se(mapaMedio[jogadorL][jogadorC + 1] == 0)
		                            {
		                                visivelM[jogadorL][jogadorC + 1] = verdadeiro
		                            }
		                        }
		                    }
		
						 escreva("     ")
			                para(coluna = 0; coluna <= 7; coluna++)
			                {
			                    escreva(" ", coluna+1, "  ")
			                }
			                para(linha = 0; linha <= 7; linha++)
			                {   
			                    escreva("\n")
			                    escreva(" ", linha+1, "  ")
			                    para(coluna = 0; coluna <= 7; coluna++)
			                    {
			                    	se( visivelM[linha][coluna] == verdadeiro)
			                    	{
			                    		escreva("| ", mapaMedio[jogadorL][jogadorC], " ")
			                    		qtdSeguros++  
			                    	}senao{
			                    		escreva("| X ")
			                    	}
			                    }
			                    escreva("|")
			                }
		
			                se( qtdSeguros == 8*8)
			                {
			                	escreva("\n\tVOCÊ GANHOU\t\n")
			                	perder = verdadeiro
			                }
		                    
		                }
		               escreva("\n")
					pare
		
					caso 'D':
		
					escreva("\n")
					 // Declaração das matrizes para dificuldade Dificil
		                inteiro mapaDificil[16][16]
		                logico visivelD[16][16]
		
		                // Inicializa matriz de visibilidade com falso
		                para(linha = 0; linha <= 15; linha++)
		                {
		                    para(coluna = 0; coluna <= 15; coluna++)
		                    {
		                        visivelD[linha][coluna] = falso
		                    }   
		                }
		
		                // Inicializa mapa com zeros
		                para(linha = 0; linha <= 15; linha++)
		                {
		                    para(coluna = 0; coluna <= 15; coluna++)
		                    {
		                        mapaDificil[linha][coluna] = 0
		                    }   
		                }
		
		                // Coloca as bombas (1) aleatoriamente
		                para(qtdBombas = 12; contadorMinas < qtdBombas; contadorMinas++)
		                {
		                    linha  = u.sorteia(0, 15)
		                    coluna = u.sorteia(0, 15)
		
		                    se(mapaDificil[linha][coluna] == 0)
		                    {
		                        mapaDificil[linha][coluna] = 1
		                    }
		                    senao
		                    {
		                        // Re-sorteia até encontrar posição vazia
		                        enquanto(mapaDificil[linha][coluna] == 1)
		                        {
		                            linha  = u.sorteia(0, 15)
		                            coluna = u.sorteia(0, 15)
		                            
		                            se(mapaDificil[linha][coluna] == 0)
		                            {
		                                mapaDificil[linha][coluna] = 1
		                            }
		                        }
		                    }
		                }
		                
		                // Exibe mapas iniciais com X (não reveladas)
		                escreva("     ")
		                para(coluna = 0; coluna <= 15; coluna++)
		                {
		                    se(coluna + 1 >= 10)
		                    {
		                    	escreva(" ", coluna+1, " ")
		                    }senao{
		                    	escreva(" ", coluna+1, "  ")
		                    }
		                }
		                para(linha = 0; linha <= 15; linha++)
		                {   
		                    escreva("\n")
		                    se(linha + 1 >= 10)
		                    {
		                    	escreva(" ", linha+1, " ")
		                    }senao{
		                    	escreva(" ", linha+1, "  ")
		                    }
		                    para(coluna = 0; coluna <= 15; coluna++)
		                    {
		                        escreva("| X ")
		                    }
		                    escreva("|")
		                }
		
		                // Início do loop de jogo
		                enquanto(perder == falso)
		                {
		                	escreva("\n")
		                    // Entrada da linha do jogador
		                    escreva("\nDigite a linha: ")
		                    leia(jogadorL)
		                    enquanto(jogadorL < 0 ou jogadorL > 16)
		                    {
		                        escreva("\nErro: Valor inválido de linha \n")
		                        escreva("\nDigite a linha: ")
		                        leia(jogadorL)
		                    }
		                    jogadorL--  // Ajusta para índice 0-based
		                    
		                    // Entrada da coluna do jogador
		                    escreva("\nDigite a Coluna: ")
		                    leia(jogadorC)
		                    enquanto(jogadorC < 0 ou jogadorC > 16)
		                    {
		                        escreva("\nErro: Valor inválido de coluna \n")
		                        escreva("\nDigite a Coluna: ")
		                        leia(jogadorC)
		                    }
		                    jogadorC-- // Ajusta para índice 0-based
		                    
		                    // Verifica se é bomba
		                    se(mapaDificil[jogadorL][jogadorC] == 1)
		                    {
		                        // Jogador perde - revela todo o mapa
		                        escreva("\nVocê Perdeu!! \n")
		                      
						    escreva("     ")
				              para(coluna = 0; coluna <= 15; coluna++)
				              {
				              		se(coluna+1 >= 10){
				              			escreva(" ", coluna+1, " ")
				              		}senao{
				              			escreva(" ", coluna+1, "  ")
				              		}
				              }
				              para(linha = 0; linha <= 15; linha++)
				              {
				              		escreva("\n")
				              		se(linha + 1 >= 10){
				              			escreva(" ", linha+1, " ")
				              		}senao{
								escreva(" ", linha+1, "  ")
				              		}
				              		
				                    para(coluna = 0; coluna <= 15; coluna++)
				                    {
				                        escreva("| ", mapaDificil[linha][coluna], " ")
				                    }
				                    escreva("|")
				              }
				              escreva("\n")
		                        pare
		                        
		                    }senao{
		                        // Marca célula escolhida como visível
		                        visivelD[jogadorL][jogadorC] = verdadeiro
		
		                        // Revela vizinhos não-bomba nas quatro direções
		                        // Cima
		                        se(jogadorL - 1 >= 0)
		                        {
		                            se(mapaDificil[jogadorL - 1][jogadorC] == 0)
		                            {
		                                visivelD[jogadorL - 1][jogadorC] = verdadeiro
		                            }
		                        }
		                        // Baixo
		                        se(jogadorL + 1 <= 15)
		                        {
		                            se(mapaDificil[jogadorL + 1][jogadorC] == 0)
		                            {
		                                visivelD[jogadorL + 1][jogadorC] = verdadeiro
		                            }
		                        }
		                        // Esquerda
		                        se(jogadorC - 1 >= 0)
		                        {
		                            se(mapaDificil[jogadorL][jogadorC - 1] == 0)
		                            {
		                                visivelD[jogadorL][jogadorC - 1] = verdadeiro
		                            }
		                        }
		                        // Direita
		                        se(jogadorC + 1 <= 15)
		                        {
		                            se(mapaDificil[jogadorL][jogadorC + 1] == 0)
		                            {
		                                visivelD[jogadorL][jogadorC + 1] = verdadeiro
		                            }
		                        }
		                    }
		
						 escreva("     ")
			                para(coluna = 0; coluna <= 15; coluna++)
			                {
			                	se(coluna+1 >= 10)
			                	{
			                		escreva(" ", coluna+1, " ")
			                	}senao{
			                    	escreva(" ", coluna+1, "  ")
			                	}
			                }
			                para(linha = 0; linha <= 15; linha++)
			                {   
			                    escreva("\n")
			                    se(linha + 1 >= 10){
			                    	escreva(" ", linha+1, " ")
			                    }senao{
			                    	escreva(" ", linha+1, "  ")
			                    }
			                    
			                    para(coluna = 0; coluna <= 15; coluna++)
			                    {
			                    	se( visivelD[linha][coluna] == verdadeiro)
			                    	{
			                    		escreva("| ", mapaDificil[jogadorL][jogadorC], " ")
			                    		qtdSeguros++  
			                    	}senao{
			                    		escreva("| X ")
			                    	}
			                    }
			                    escreva("|")
			                }
		
			                se( qtdSeguros == 13*13)
			                {
			                	escreva("\n\tVOCÊ GANHOU\t\n")
			                	perder = verdadeiro
			                }
		                    
		                }
		               escreva("\n")
					pare
		
					caso contrario:
						se( dif == 'f' ou dif == 'm' ou dif == 'd')
						{
							escreva("\nErro: Código de dificuldade deve ser em maiúsculo\n")
						}senao{
							escreva("\nErro: Código de dificuldade inválido\n")
						}
					
		        }
	        }
        }
    }
}

/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 898; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */