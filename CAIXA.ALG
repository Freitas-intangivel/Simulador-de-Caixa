Algoritmo "caixa"
//  
//  
// 
//  
// Descrição   : Aqui você descreve o que o programa faz! (função)
// Autor(a)    : G2
// Data atual  : 11/05/2026
Var
// Seção de Declarações das variáveis 
linha, coluna, opcao, decisao, cont, contar, ven, ococobranca, reset: inteiro
entregue, restante, ssaldo, dsaldo,msaldo,csaldo,psaldo, total: real
fecha: logico
produtos: vetor[0..15] de caractere
precos: vetor[0..15] de real
venda: vetor[1..99] de inteiro
historico: vetor[0..10,0..10] de caractere
histvalor: vetor[0..10, 0..4] de real
Inicio
// Seção de Comandos, procedimento, funções, operadores, etc... 
ssaldo <- 80.00  //Saldo inicial do caixa em dinheiro
fecha <- verdadeiro
dsaldo <- 0
csaldo <- 0
psaldo <- 0
coluna <- 0

produtos[1] <- "Arroz camilo"
precos[1] <- 20
produtos[2] <- "Feijao de cobra"
precos[2] <- 10
produtos[3] <- "Macarrao alhólho"
precos[3] <- 8
produtos[4] <- "Carne picanha"
precos[4] <- 35
produtos[5] <- "Leite moço"
precos[5] <- 5
produtos[6] <- "Pão "
precos[6] <- 7
produtos[7] <- "Café"
precos[7] <- 15
produtos[8] <- "Açucar"
precos[8] <- 6
produtos[9] <- "Óleo"
precos[9] <- 9
produtos[10] <- "Sal"
precos[10] <- 3
produtos[11] <- "Refri Guaratatatuba"
precos[11] <- 6
produtos[12] <- "Bolacha"
precos[12] <- 4
produtos[13] <- "Queijo"
precos[13] <- 12
produtos[14] <- "Presunto"
precos[14] <- 11
produtos[15] <- "Frango"
precos[15] <- 25

repita
total <- 0

escreval(" _________________________________________________")
escreval("|Mercadão Duscara                                 |")
escreval("|  1-Registrar Venda  2-Histórico  3-Fechamento   |")
escreval("|                                                 |")
escreval("|                                                 |")
escreval("|                                                 |")
escreval("|                                                 |")
escreval("| Dinheiro: R$", ssaldo, "    Maquininha: R$", msaldo)
escreval("|_________________________________________________|")
escreval("")

leia (decisao)
escolha (decisao)
caso 1
//Registrar Venda
escreval(" _________________________________________________")
escreval("|                                                 ")
para cont de 1 ate 15 faca
escreval("|", cont, " - ", produtos[cont], " R$",precos[cont])
fimpara
escreval("|_________________________________________________")
cont <- 0

repita

escreval(" _________________________________________________")
escreval("|                                                 |")
escreval("|   Quais produtos serão comprados? 0-Finalizar   |")
escreval("|_________________________________________________|")
repita
cont <- cont + 1
leia (ven)

se (ven >= 0) e (ven <= 15) entao
venda[cont] <- ven
total <- total + precos[venda[cont]]
historico[coluna, cont] <- produtos[venda[cont]]
histvalor[coluna] <- total
senao entao
escreval ("Este produto não existe")
cont <- cont -1
fimse
ate ven = 0



contar <- 1
escreval(" _________________________________________________")
escreval("|                                                 ")
enquanto precos[venda[contar]] <> 0 faca
escreval("|  ", produtos[venda[contar]]," R$", precos[venda[contar]])
contar <- contar + 1
fimenquanto
escreval ("|                                                 ")
escreval ("|   Total: R$", total)
escreval ("|_________________________________________________")

se ven = 0 entao
cont <- cont -1
fimse

escreval(" _________________________________________________")
escreval("|                                                 |")
escreval("|        1-Continuar      2-Adicionar Mais        |")
escreval("|_________________________________________________|")
leia (opcao)
ate opcao <> 2

se opcao = 1 entao
repita
escreval(" _________________________________________________")
escreval("|Forma de Pagamento                               |")
escreval("|                1 - Dinheiro                     |")
escreval("|                2 - Debito                       |")
escreval("|                3 - Crédito                      |")
escreval("|                4 - PIX                          |")
escreval("|_________________________________________________|")

leia (opcao)
escolha (opcao)

caso 1
//Dinheiro
escreval (" Total: R$", total)
escreva("Dinheiro entregue: R$")
leia (entregue)
restante <- entregue - total
escreval ("Troco: R$", restante)

ssaldo <- entregue + ssaldo

se restante < 0 entao
escreval("")
escreval ("Faltam", (-1 * restante), " reais, finalizar com qual metodo?")
total <- restante * -1
fimse

se restante > 0 entao
ssaldo <- ssaldo - restante
fimse
histvalor[coluna, 1] <- entregue

caso 2
//Débito
escreval (" Total: R$", total)
escreva("Cobrar: R$")
leia (entregue)
restante <- entregue - total

dsaldo <- entregue + dsaldo

se entregue > total entao
escreval ("Ocorrecia registrada! - Valor cobrado exedido o total da compra")
ococobranca <- ococobranca + 1
fimse

se restante < 0 entao
escreval("")
escreval ("Faltam", (-1 * restante), " reais, finalizar com qual metodo?")
total <- restante * -1
fimse
histvalor[coluna, 2] <- entregue

caso 3
//Crédito

escreval (" Total: R$", total)
escreva("Cobrar: R$")
leia (entregue)
restante <- entregue - total

csaldo <- entregue + csaldo

se entregue > total entao
escreval ("Ocorrecia registrada! - Valor cobrado exedido o total da compra")
ococobranca <- ococobranca + 1
fimse

se restante < 0 entao
escreval("")
escreval ("Faltam", (-1 * restante), " reais, finalizar com qual metodo?")
total <- restante * -1
fimse
histvalor[coluna, 3] <- entregue
caso 4
//PIX
escreval (" Total: R$", total)
escreva("Cobrar: R$")
leia (entregue)
restante <- entregue - total

psaldo <- entregue + psaldo

se entregue > total entao
escreval ("Ocorrecia registrada! - Valor cobrado exedido o total da compra")
ococobranca <- ococobranca + 1
fimse

se restante < 0 entao
escreval("")
escreval ("Faltam", (-1 * restante), " reais, finalizar com qual metodo?")
total <- restante * -1
fimse
histvalor[coluna, 4] <- entregue
outrocaso
escreval ("Meio de pagamento invalido!")

fimescolha
ate restante >= 0
coluna <- coluna + 1
fimse
fecha <- verdadeiro
   
caso 2
//Historico
para contar de 0 ate 10 faca
para cont de 0 ate 10 faca
escreva (historico [contar,cont], " ")
fimpara
fimpara

caso 3
//Fechamento
escreval(" _________________________________________________")
escreval("|Fechamento...                                    |")
escreval("|   Dinheiro:   R$", ssaldo)
escreval("|   Debito:     R$", dsaldo)
escreval("|   Crédito:    R$", csaldo)
escreval("|   PIX:        R$", psaldo)
escreval("|     Total:  R$", msaldo + ssaldo)
escreval("|_________________________________________________|")

escreval(" _________________________________________________")
escreval("|Concluir Fechamento?                             |")
escreval("|         1 - Concluir      2 - Voltar            |")
escreval("|_________________________________________________|")
leia(opcao)
se opcao = 1 entao
fecha <- falso

senao entao
fecha <- verdadeiro
fimse

outrocaso

fimescolha
msaldo <- msaldo + dsaldo + csaldo + psaldo
ate fecha = falso
Fimalgoritmo