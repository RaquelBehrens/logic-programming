:- use_module(library(clpfd)).
:- use_module(library(lists)).

:- consult('pruning.pl').
:- consult('adjacency.pl').
:- consult('arrow_verification.pl').
:- consult('possibilities.pl').

main:- makaro(2,Rows),solucao(Rows).


makaro(2, M) :- 
     M = [[cell(1,1,0,1),  cell(1,2,2,_),   cell(1,3,2,4),  cell(1,4,0,3),  cell(1,5,3,_),  cell(1,6,4,_),  cell(1,7,4,4),  cell(1,8,4,1)],
          [cell(2,1,1,_),  cell(2,2,2,_),   cell(2,3,2,_),  cell(2,4,3,_),  cell(2,5,3,1),  cell(2,6,4,2),  cell(2,7,6,1),  cell(2,8,0,2)],
          [cell(3,1,1,_),  cell(3,2,0,1),   cell(3,3,5,4),  cell(3,4,5,2),  cell(3,5,0,0),  cell(3,6,6,_),  cell(3,7,6,2),  cell(3,8,6,4)],
          [cell(4,1,16,2), cell(4,2,16,_),  cell(4,3,0,4),  cell(4,4,5,_),  cell(4,5,5,3),  cell(4,6,9,_),  cell(4,7,0,1),  cell(4,8,6,5)],
          [cell(5,1,0,1),  cell(5,2,7,_),   cell(5,3,7,_),  cell(5,4,8,_),  cell(5,5,8,_),  cell(5,6,9,_),  cell(5,7,9,_),  cell(5,8,10,_)],
          [cell(6,1,17,_), cell(6,2,14,_),  cell(6,3,7,_),  cell(6,4,0,4),  cell(6,5,8,2),  cell(6,6,8,1),  cell(6,7,0,2),  cell(6,8,10,2)],
          [cell(7,1,0,1),  cell(7,2,14,5),  cell(7,3,13,_), cell(7,4,13,2), cell(7,5,12,_), cell(7,6,0,1),  cell(7,7,10,3), cell(7,8,10,_)],
          [cell(8,1,14,3), cell(8,2,14,_),  cell(8,3,14,4), cell(8,4,13,_), cell(8,5,12,_), cell(8,6,11,1), cell(8,7,11,_), cell(8,8,0,4)]].




solucao(TabuleiroSolucao) :-

    TabuleiroSolucao = [[X11, X12, X13, X14, X15, X16, X17, X18],
                        [X21, X22, X23, X24, X25, X26, X27, X28],
                        [X31, X32, X33, X34, X35, X36, X37, X38],
                        [X41, X42, X43, X44, X45, X46, X47, X48],
                        [X51, X52, X53, X54, X55, X56, X57, X58],
                        [X61, X62, X63, X64, X65, X66, X67, X68],
                        [X71, X72, X73, X74, X75, X76, X77, X78],
                        [X81, X82, X83, X84, X85, X86, X87, X88]
                       ],

    %linha1
    completa(X11, TabuleiroSolucao),
    completa(X12, TabuleiroSolucao),
    completa(X13, TabuleiroSolucao),
    completa(X14, TabuleiroSolucao),
    completa(X15, TabuleiroSolucao),
    completa(X16, TabuleiroSolucao),
    completa(X17, TabuleiroSolucao),
    completa(X18, TabuleiroSolucao),

    %linha2
    completa(X21, TabuleiroSolucao),
    completa(X22, TabuleiroSolucao),
    completa(X23, TabuleiroSolucao),
    completa(X24, TabuleiroSolucao),
    completa(X25, TabuleiroSolucao),
    completa(X26, TabuleiroSolucao),
    completa(X27, TabuleiroSolucao),
    completa(X28, TabuleiroSolucao),

    %linha3
    completa(X31, TabuleiroSolucao),
    completa(X32, TabuleiroSolucao),
    completa(X33, TabuleiroSolucao),
    completa(X34, TabuleiroSolucao),
    completa(X35, TabuleiroSolucao),
    completa(X36, TabuleiroSolucao),
    completa(X37, TabuleiroSolucao),
    completa(X38, TabuleiroSolucao),

    %linha4
    completa(X41, TabuleiroSolucao),
    completa(X42, TabuleiroSolucao),
    completa(X43, TabuleiroSolucao),
    completa(X44, TabuleiroSolucao),
    completa(X45, TabuleiroSolucao),
    completa(X46, TabuleiroSolucao),
    completa(X47, TabuleiroSolucao),
    completa(X48, TabuleiroSolucao),

    %linha5
    completa(X51, TabuleiroSolucao),
    completa(X52, TabuleiroSolucao),
    completa(X53, TabuleiroSolucao),
    completa(X54, TabuleiroSolucao),
    completa(X55, TabuleiroSolucao),
    completa(X56, TabuleiroSolucao),
    completa(X57, TabuleiroSolucao),
    completa(X58, TabuleiroSolucao),

    %linha6
    completa(X61, TabuleiroSolucao),
    completa(X62, TabuleiroSolucao),
    completa(X63, TabuleiroSolucao),
    completa(X64, TabuleiroSolucao),
    completa(X65, TabuleiroSolucao),
    completa(X66, TabuleiroSolucao),
    completa(X67, TabuleiroSolucao),
    completa(X68, TabuleiroSolucao),

    %linha7
    completa(X71, TabuleiroSolucao),
    completa(X72, TabuleiroSolucao),
    completa(X73, TabuleiroSolucao),
    completa(X74, TabuleiroSolucao),
    completa(X75, TabuleiroSolucao),
    completa(X76, TabuleiroSolucao),
    completa(X77, TabuleiroSolucao),
    completa(X78, TabuleiroSolucao),

    %linha8
    completa(X81, TabuleiroSolucao),
    completa(X82, TabuleiroSolucao),
    completa(X83, TabuleiroSolucao),
    completa(X84, TabuleiroSolucao),
    completa(X85, TabuleiroSolucao),
    completa(X86, TabuleiroSolucao),
    completa(X87, TabuleiroSolucao),
    completa(X88, TabuleiroSolucao).



/*função que completa o número na célula*/

completa(cell(_,_,0,_), _).
completa(cell(Linha,Coluna,Region,Value), Matriz) :-
    acharQuantidadeElementosRegiao(Region, Matriz, QuantidadeElementosRegiao),
    my_in(Value, 1, QuantidadeElementosRegiao),
    verifica(Linha,Coluna,Value, Region, Matriz).

verifica(Linha,Coluna,Value,Region,Matriz) :-
    naoHaIgualNaRegiao(Linha,Coluna,Value, Region, Matriz),
    verificarAdjacencias(Matriz),
    verificarFlechasMatriz(Matriz, Matriz).

my_in(Value, Maior, Maior) :- Value is Maior.
my_in(Value, Menor, Maior) :- Value is Menor ; my_in(Value, (Menor+1), Maior).
 