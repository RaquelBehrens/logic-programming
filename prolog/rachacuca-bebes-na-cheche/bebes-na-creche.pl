macacao(amarelo).
macacao(azul).
macacao(branco).
macacao(verde).
macacao(vermelho).

nome(caue).
nome(edgar).
nome(italo).
nome(leonardo).
nome(rodrigo).

peso(6.3).
peso(6.5).
peso(6.7).
peso(6.9).
peso(7.1).

altura(58).
altura(60).
altura(62).
altura(64).
altura(66).

signo(cancer).
signo(capricornio).
signo(escorpiao).
signo(touro).
signo(virgem).

mae(angelica).
mae(elisa).
mae(leticia).
mae(paloma).
mae(renata).


/*X está ao lado de Y*/
aoLado(X,Y,Lista) :- nextto(X,Y,Lista);nextto(Y,X,Lista).
                       
/*X está à esquerda de Y (em qualquer posição à esquerda)*/
aEsquerda(X,Y,Lista) :- nth0(IndexX,Lista,X), 
                        nth0(IndexY,Lista,Y), 
                        IndexX < IndexY.
                        
/*X está à direita de Y (em qualquer posição à direita)*/
aDireita(X,Y,Lista) :- aEsquerda(Y,X,Lista). 

/*X está no canto se ele é o primeiro ou o último da lista*/
noCanto(X,Lista) :- last(Lista,X).
noCanto(X,[X|_]).

/*X está entre Y(esquerda) e Z(direita) (em qualquer posição)*/
entre(X,Y,Z,Lista) :- aDireita(X,Y,Lista), aEsquerda(X,Z,Lista).

/*X está exatamente à esquerda de Y*/
exatamenteAEsquerda(X,Y,Lista) :- aEsquerda(X,Y,Lista), aoLado(X,Y,Lista).

/*X está exatamente à direita de Y*/
exatamenteADireita(X,Y,Lista) :- aDireita(X,Y,Lista), aoLado(X,Y,Lista).

todosDiferentes([]).
todosDiferentes([H|T]) :- not(member(H,T)), todosDiferentes(T).

solucao(ListaSolucao) :- 

    ListaSolucao = [
        bebe(Macacao1, Nome1, Peso1, Altura1, Signo1, Mae1),
        bebe(Macacao2, Nome2, Peso2, Altura2, Signo2, Mae2),
        bebe(Macacao3, Nome3, Peso3, Altura3, Signo3, Mae3),
        bebe(Macacao4, Nome4, Peso4, Altura4, Signo4, Mae4),
        bebe(Macacao5, Nome5, Peso5, Altura5, Signo5, Mae5)
    ],

    /*O bebê de macacão verde está em algum lugar entre o Rodrigo e o filho da Letícia, nessa ordem*/
    entre(bebe(verde, _, _, _, _, _), bebe(_, rodrigo, _, _, _, _), bebe(_, _, _, _, _, leticia), ListaSolucao),

    /*Ítalo está ao lado do bebê de 60cm*/
    aoLado(bebe(_, italo, _, _, _, _), bebe(_, _, _, 60, _, _), ListaSolucao),

    /*O bebê que nasceu em setembro está exatamente à esquerda do bebê de 60cm   
    --->  Signos de setembro: Virgem e Libra. Só existe Virgem nas opções*/
    exatamenteAEsquerda(bebe(_, _, _, _, virgem, _), bebe(_, _, _, 60, _, _), ListaSolucao),

    /*O filho de Angélica está em uma das pontas*/
    noCanto(bebe(_, _, _, _, _, angelica), ListaSolucao),

    /*A criança de menor estatura está ao lado do filho da Elisa
    ---> Menor estatura dentre as opcoes: 58cm*/
    aoLado(bebe(_, _, _, 58, _, _), bebe(_, _, _, _, _, elisa), ListaSolucao),

    /*O bebê de 64cm pesa 6,9Kg*/
    member(bebe(_, _, 6.9, 64, _, _), ListaSolucao),

    /*O filho de Renata está exatamente à esquerda do bebê de 62cm*/
    exatamenteAEsquerda(bebe(_, _, _, _, _, renata), bebe(_, _, _, 62, _, _), ListaSolucao),

    /*Na quinta posição está o bebê de capricórnio*/
    Signo5 = capricornio,

    /*A criança de macacão vermelho está em algum lugar à esquerda do bebê mais pesado
    ---> Bebe mais pesado = 7.1Kg*/
    aEsquerda(bebe(vermelho, _, _, _, _, _), bebe(_, _, 7.1, _, _, _), ListaSolucao),

    /*Leonardo pesa 6.7Kg*/
    member(bebe(_, leonardo, 6.7, _, _, _), ListaSolucao),

    /*O bebê de signo Virgem está exatamente á direita do filho de Paloma*/
    exatamenteADireita(bebe(_, _, _, _, virgem, _), bebe(_, _, _, _, _, paloma), ListaSolucao),

    /*A criança de macacão Branco está em algum lugar à esquerda da criança de macacão Azul*/
    aEsquerda(bebe(branco, _, _, _, _, _), bebe(azul, _, _, _, _, _), ListaSolucao),

    /*O filho da Letícia está exatamente à direita da criança de Touro*/
    exatamenteADireita(bebe(_, _, _, _, _, leticia), bebe(_, _, _, _, touro, _), ListaSolucao),

    /*O bebê de macacão Verde está em algum lugar entre a criança de 66 cm e o filho de Elisa, nessa ordem.*/
    entre(bebe(verde, _, _, _, _, _), bebe(_, _, _, 66, _, _), bebe(_, _, _, _, _, elisa), ListaSolucao),    
    
    /*Leonardo é do signo de Câncer.*/
    member(bebe(_, leonardo, _, _, cancer, _), ListaSolucao),

    /*Na terceira posição está o bebê de 6,9 Kg.*/
    Peso3 = 6.9,

    /*Cauê está exatamente à direita do bebê de 58 cm.*/
    exatamenteADireita(bebe(_, caue, _, _, _, _), bebe(_, _, _, 58, _, _), ListaSolucao),

    /*O bebê de macacão Amarelo está na terceira posição.*/
    Macacao3 = amarelo,

    /*A criança de 6,9 Kg está exatamente à esquerda da criança de 6,3 Kg.*/
    exatamenteAEsquerda(bebe(_, _, 6.9, _, _, _), bebe(_, _, 6.3, _, _, _), ListaSolucao),

    /*O bebê de macacão Verde está em algum lugar à direita do bebê de macacão Branco.*/
    aDireita(bebe(verde, _, _, _, _, _), bebe(branco, _, _, _, _, _), ListaSolucao),

    macacao(Macacao1), macacao(Macacao2), macacao(Macacao3), macacao(Macacao4), macacao(Macacao5),
    todosDiferentes([Macacao1, Macacao2, Macacao3, Macacao4, Macacao5]),
    
    nome(Nome1), nome(Nome2), nome(Nome3), nome(Nome4), nome(Nome5),
    todosDiferentes([Nome1, Nome2, Nome3, Nome4, Nome5]),
    
    peso(Peso1), peso(Peso2), peso(Peso3), peso(Peso4), peso(Peso5),
    todosDiferentes([Peso1, Peso2, Peso3, Peso4, Peso5]),
    
    altura(Altura1), altura(Altura2), altura(Altura3), altura(Altura4), altura(Altura5),
    todosDiferentes([Altura1, Altura2, Altura3, Altura4, Altura5]),
    
    signo(Signo1), signo(Signo2), signo(Signo3), signo(Signo4), signo(Signo5),
    todosDiferentes([Signo1, Signo2, Signo3, Signo4, Signo5]),

    mae(Mae1), mae(Mae2), mae(Mae3), mae(Mae4), mae(Mae5),
    todosDiferentes([Mae1, Mae2, Mae3, Mae4, Mae5]).
