:- use_module(library(clpfd)).
:- use_module(library(lists)).

/*função para ver se o número escolhido é uma flecha, e verificar a direção da flecha e as regras*/

/*
Arrow: 1 - direita, 2 - baixo, 3 - esquerda, 4 - cima
*/

verificarFlechasMatriz([], _).
verificarFlechasMatriz([L|Ls], Matriz) :- 
    verificarFlechasMatrizCelula(L, Matriz),
    verificarFlechasMatriz(Ls, Matriz).

verificarFlechasMatrizCelula([], _).
verificarFlechasMatrizCelula([C|Cs], Matriz) :-
    verificarAdjacenciasFlecha(C, Matriz),
    verificarFlechasMatrizCelula(Cs, Matriz).


verificarAdjacenciasFlecha(cell(Linha,Coluna,Regiao,Value), Matriz) :- 
    not(member(Regiao,[0]));
    (member(Regiao,[0]), length(Matriz, Tamanho), verificarDirecaoFlecha(Linha, Coluna, Value, Matriz, Tamanho)).

verificarDirecaoFlecha(_,_,0,_,_).
verificarDirecaoFlecha(Linha,Coluna,1,Matriz,Tamanho) :- NovoValor is Coluna+1, verificarValorDirecaoMatriz(Linha, NovoValor, Matriz, NumeroElementoDirecao), (var(NumeroElementoDirecao) ; verificarAdjacenciasFlecha(Linha, Coluna, Matriz, NumeroElementoDirecao, Tamanho, Linha, NovoValor)).
verificarDirecaoFlecha(Linha,Coluna,2,Matriz,Tamanho) :- NovoValor is Linha+1, verificarValorDirecaoMatriz(NovoValor, Coluna, Matriz, NumeroElementoDirecao), (var(NumeroElementoDirecao) ; verificarAdjacenciasFlecha(Linha, Coluna, Matriz, NumeroElementoDirecao, Tamanho, NovoValor, Coluna)).
verificarDirecaoFlecha(Linha,Coluna,3,Matriz,Tamanho) :- NovoValor is Coluna-1, verificarValorDirecaoMatriz(Linha, NovoValor, Matriz, NumeroElementoDirecao), (var(NumeroElementoDirecao) ; verificarAdjacenciasFlecha(Linha, Coluna, Matriz, NumeroElementoDirecao, Tamanho, Linha, NovoValor)).
verificarDirecaoFlecha(Linha,Coluna,4,Matriz,Tamanho) :- NovoValor is Linha-1, verificarValorDirecaoMatriz(NovoValor, Coluna, Matriz, NumeroElementoDirecao), (var(NumeroElementoDirecao) ; verificarAdjacenciasFlecha(Linha, Coluna, Matriz, NumeroElementoDirecao, Tamanho, NovoValor, Coluna)).

verificarValorDirecaoMatriz(Linha, Coluna, Matriz, NumeroElementoDirecao) :-
    NovoValorLinha is Linha-1, nth0(NovoValorLinha, Matriz, LinhaElemento),
    NovoValorColuna is Coluna-1, nth0(NovoValorColuna, LinhaElemento, Elemento),
    verificarValorDirecaoCelula(Elemento, NumeroElementoDirecao).

verificarValorDirecaoCelula(cell(_,_,_,Valor), Valor).


verificarAdjacenciasFlecha(1,       1,       Matriz,Valor,_,LinhaMaiorElemento,ColunaMaiorElemento) :- 
    VerificarAbaixo is 1+1, VerificarDireita is 1+1,
    verificarAdjacenciasFlechaCelula(VerificarAbaixo, 1, Matriz, Valor,LinhaMaiorElemento,ColunaMaiorElemento), 
    verificarAdjacenciasFlechaCelula(1, VerificarDireita, Matriz, Valor,LinhaMaiorElemento,ColunaMaiorElemento).

verificarAdjacenciasFlecha(1,       Tamanho, Matriz,Valor,Tamanho,LinhaMaiorElemento,ColunaMaiorElemento) :- 
    VerificarAbaixo is 1+1, VerificarEsquerda is Tamanho-1, 
    verificarAdjacenciasFlechaCelula(VerificarAbaixo, Tamanho, Matriz, Valor,LinhaMaiorElemento,ColunaMaiorElemento), 
    verificarAdjacenciasFlechaCelula(1, VerificarEsquerda, Matriz, Valor,LinhaMaiorElemento,ColunaMaiorElemento).

verificarAdjacenciasFlecha(Tamanho, 1,       Matriz,Valor,Tamanho,LinhaMaiorElemento,ColunaMaiorElemento) :- 
    VerificarDireita is 1+1, VerificarAcima is Tamanho-1,
    verificarAdjacenciasFlechaCelula(VerificarAcima, 1, Matriz, Valor,LinhaMaiorElemento,ColunaMaiorElemento), 
    verificarAdjacenciasFlechaCelula(Tamanho, VerificarDireita, Matriz, Valor,LinhaMaiorElemento,ColunaMaiorElemento).

verificarAdjacenciasFlecha(Tamanho, Tamanho, Matriz,Valor,Tamanho,LinhaMaiorElemento,ColunaMaiorElemento) :- 
    VerificarAcima is Tamanho-1, VerificarEsquerda is Tamanho-1,
    verificarAdjacenciasFlechaCelula(VerificarAcima, Tamanho, Matriz, Valor,LinhaMaiorElemento,ColunaMaiorElemento), 
    verificarAdjacenciasFlechaCelula(Tamanho, VerificarEsquerda, Matriz, Valor,LinhaMaiorElemento,ColunaMaiorElemento).

verificarAdjacenciasFlecha(1,       Coluna,  Matriz,Valor,Tamanho,LinhaMaiorElemento,ColunaMaiorElemento) :- 
    Coluna =\= 1, Coluna < Tamanho, VerificarAbaixo is 1+1, VerificarEsquerda is Coluna-1, VerificarDireita is Coluna+1,
    verificarAdjacenciasFlechaCelula(VerificarAbaixo, Coluna, Matriz, Valor,LinhaMaiorElemento,ColunaMaiorElemento), 
    verificarAdjacenciasFlechaCelula(1, VerificarEsquerda, Matriz, Valor,LinhaMaiorElemento,ColunaMaiorElemento), 
    verificarAdjacenciasFlechaCelula(1, VerificarDireita, Matriz, Valor,LinhaMaiorElemento,ColunaMaiorElemento).

verificarAdjacenciasFlecha(Tamanho, Coluna,  Matriz,Valor,Tamanho,LinhaMaiorElemento,ColunaMaiorElemento) :- 
    Coluna =\= 1, Coluna < Tamanho, VerificarAcima is Tamanho-1, VerificarEsquerda is Coluna-1, VerificarDireita is Coluna+1,
    verificarAdjacenciasFlechaCelula(VerificarAcima, Coluna, Matriz, Valor,LinhaMaiorElemento,ColunaMaiorElemento), 
    verificarAdjacenciasFlechaCelula(Tamanho, VerificarEsquerda, Matriz, Valor,LinhaMaiorElemento,ColunaMaiorElemento), 
    verificarAdjacenciasFlechaCelula(Tamanho, VerificarDireita, Matriz, Valor,LinhaMaiorElemento,ColunaMaiorElemento).

verificarAdjacenciasFlecha(Linha,   1,       Matriz,Valor,Tamanho,LinhaMaiorElemento,ColunaMaiorElemento) :- 
    Linha =\= 1, Linha < Tamanho, VerificarDireita is 1+1, VerificarAcima is Linha-1, VerificarAbaixo is Linha+1, 
    verificarAdjacenciasFlechaCelula(Linha, VerificarDireita, Matriz, Valor,LinhaMaiorElemento,ColunaMaiorElemento), 
    verificarAdjacenciasFlechaCelula(VerificarAcima, 1, Matriz, Valor,LinhaMaiorElemento,ColunaMaiorElemento), 
    verificarAdjacenciasFlechaCelula(VerificarAbaixo, 1, Matriz, Valor,LinhaMaiorElemento,ColunaMaiorElemento).

verificarAdjacenciasFlecha(Linha,   Tamanho, Matriz,Valor,Tamanho,LinhaMaiorElemento,ColunaMaiorElemento) :- 
    Linha =\= 1, Linha < Tamanho, VerificarEsquerda is Tamanho-1, VerificarAcima is Linha-1, VerificarAbaixo is Linha+1,
    verificarAdjacenciasFlechaCelula(Linha, VerificarEsquerda, Matriz, Valor,LinhaMaiorElemento,ColunaMaiorElemento), 
    verificarAdjacenciasFlechaCelula(VerificarAcima, Tamanho, Matriz, Valor,LinhaMaiorElemento,ColunaMaiorElemento), 
    verificarAdjacenciasFlechaCelula(VerificarAbaixo, Tamanho, Matriz, Valor,LinhaMaiorElemento,ColunaMaiorElemento).

verificarAdjacenciasFlecha(Linha,   Coluna,  Matriz,Valor,Tamanho,LinhaMaiorElemento,ColunaMaiorElemento) :- 
    Linha =\= 1, Coluna =\= 1, Linha < Tamanho, Coluna < Tamanho, VerificarDireita is Coluna+1, VerificarEsquerda is Coluna-1, VerificarAbaixo is Linha+1, VerificarAcima is Linha-1,
    verificarAdjacenciasFlechaCelula(Linha, VerificarDireita, Matriz, Valor,LinhaMaiorElemento,ColunaMaiorElemento), 
    verificarAdjacenciasFlechaCelula(Linha, VerificarEsquerda, Matriz, Valor,LinhaMaiorElemento,ColunaMaiorElemento), 
    verificarAdjacenciasFlechaCelula(VerificarAbaixo, Coluna, Matriz, Valor,LinhaMaiorElemento,ColunaMaiorElemento), 
    verificarAdjacenciasFlechaCelula(VerificarAcima, Coluna, Matriz, Valor,LinhaMaiorElemento,ColunaMaiorElemento).


verificarAdjacenciasFlechaCelula(Linha, Coluna, _, _,Linha,Coluna).
verificarAdjacenciasFlechaCelula(Linha, Coluna, Matriz, Valor,_,_) :-
    NovaLinha is Linha-1, nth0(NovaLinha, Matriz, LinhaElemento),
    NovaColuna is Coluna-1, nth0(NovaColuna, LinhaElemento, Elemento),
    verificarAdjacenciasFlechaElemento(Elemento, ValorElemento),
    (var(ValorElemento) ; ValorElemento < Valor).

verificarAdjacenciasFlechaElemento(cell(_,_,_,ValorElemento), ValorElemento).
