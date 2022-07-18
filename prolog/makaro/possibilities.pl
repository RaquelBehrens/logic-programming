:- use_module(library(clpfd)).
:- use_module(library(lists)).

/*função para ver os números possíveis daquela célula, baseando-se no número de células da região da célula*/

acharQuantidadeElementosRegiao(_, [], 0).
acharQuantidadeElementosRegiao(Regiao, [L|Ls], E) :-
    acharQuantidadeElementosRegiaoColuna(Regiao, L, RSs),
    acharQuantidadeElementosRegiao(Regiao, Ls, E1),
    E is RSs + E1.

acharQuantidadeElementosRegiaoColuna(_, [], 0).
acharQuantidadeElementosRegiaoColuna(Regiao, [E|Es], E2) :-
    acharQuantidadeElementosRegiaoCelula(Regiao, E, E3),
    acharQuantidadeElementosRegiaoColuna(Regiao, Es, RSs),
    E2 is E3 + RSs.

acharQuantidadeElementosRegiaoCelula(ValorRegiao, cell(_,_,ValorRegiao, _), 1).
acharQuantidadeElementosRegiaoCelula(_, cell(_,_,_,_), 0).
