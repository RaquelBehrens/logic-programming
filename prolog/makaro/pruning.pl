:- use_module(library(clpfd)).
:- use_module(library(lists)).


/*terminar função para ver se o número escolhido já não pertence à região daquela célula*/

naoHaIgualNaRegiao(Linha, Coluna, Value, Regiao, Matriz) :- 
    acharElementosRegiao(Linha, Coluna, Regiao, Matriz, ElementosRegiao),    
    not(member(Value,ElementosRegiao)).

acharElementosRegiao(_, _, _, [], []).
acharElementosRegiao(Linha, Coluna, Regiao, [L|Ls], E) :-
    acharElementosRegiaoColuna(Linha, Coluna, Regiao, L, RSs),
    acharElementosRegiao(Linha, Coluna, Regiao, Ls, E1),
    append(RSs, E1, E).

acharElementosRegiaoColuna(_,_,_, [], []).
acharElementosRegiaoColuna(Linha, Coluna, Regiao, [cell(Linha,Coluna,Regiao,_)|Es], E2) :-
    acharElementosRegiaoColuna(Linha, Coluna, Regiao, Es, E2).
acharElementosRegiaoColuna(Linha, Coluna, Regiao, [cell(_,_,Regiao,Elemento)|Es], [Elemento|E2]) :-
    not(var(Elemento)), acharElementosRegiaoColuna(Linha, Coluna, Regiao, Es, E2).
acharElementosRegiaoColuna(Linha, Coluna, Regiao, [cell(_,_,Regiao,Elemento)|Es], E2) :-
    var(Elemento), acharElementosRegiaoColuna(Linha, Coluna, Regiao, Es, E2).
acharElementosRegiaoColuna(Linha, Coluna, Regiao, [cell(_,_,RegiaoCelula,_)|Es], E2) :-
    not(member(RegiaoCelula, [Regiao])), acharElementosRegiaoColuna(Linha, Coluna, Regiao, Es, E2).
