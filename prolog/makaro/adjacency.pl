:- use_module(library(clpfd)).
:- use_module(library(lists)).

/*fazer função para ver se o número escolhido está ao lado de um número igual*/
verificarAdjacencias(TabuleiroSolucao) :-
    
    TabuleiroSolucao = [[X11, X12, X13, X14, X15, X16, X17, X18],
                        [X21, X22, X23, X24, X25, X26, X27, X28],
                        [X31, X32, X33, X34, X35, X36, X37, X38],
                        [X41, X42, X43, X44, X45, X46, X47, X48],
                        [X51, X52, X53, X54, X55, X56, X57, X58],
                        [X61, X62, X63, X64, X65, X66, X67, X68],
                        [X71, X72, X73, X74, X75, X76, X77, X78],
                        [X81, X82, X83, X84, X85, X86, X87, X88]
                       ],
    
    %cantos
    naoHaIgualAoLadoCanto(X11, X12, X21),
    naoHaIgualAoLadoCanto(X81, X82, X71),
    naoHaIgualAoLadoCanto(X18, X17, X28),
    naoHaIgualAoLadoCanto(X88, X78, X87),

    %linhaEsquerda
    naoHaIgualAoLadoLinha(X21, X11, X31, X22),
    naoHaIgualAoLadoLinha(X31, X21, X41, X32),
    naoHaIgualAoLadoLinha(X41, X31, X51, X42),
    naoHaIgualAoLadoLinha(X51, X41, X61, X52),
    naoHaIgualAoLadoLinha(X61, X51, X71, X62),
    naoHaIgualAoLadoLinha(X71, X61, X81, X72),

    %linhaDireita
    naoHaIgualAoLadoLinha(X28, X18, X38, X27),
    naoHaIgualAoLadoLinha(X38, X28, X48, X37),
    naoHaIgualAoLadoLinha(X48, X38, X58, X47),
    naoHaIgualAoLadoLinha(X58, X48, X68, X57),
    naoHaIgualAoLadoLinha(X68, X58, X78, X67),
    naoHaIgualAoLadoLinha(X78, X68, X88, X77),

    %linhaCima
    naoHaIgualAoLadoLinha(X12, X11, X13, X22),
    naoHaIgualAoLadoLinha(X13, X12, X14, X23),
    naoHaIgualAoLadoLinha(X14, X13, X15, X24),
    naoHaIgualAoLadoLinha(X15, X14, X16, X25),
    naoHaIgualAoLadoLinha(X16, X15, X17, X26),
    naoHaIgualAoLadoLinha(X17, X16, X18, X27),

    %linhaBaixo
    naoHaIgualAoLadoLinha(X82, X81, X83, X72),
    naoHaIgualAoLadoLinha(X83, X82, X84, X73),
    naoHaIgualAoLadoLinha(X84, X83, X85, X74),
    naoHaIgualAoLadoLinha(X85, X84, X86, X75),
    naoHaIgualAoLadoLinha(X86, X85, X87, X76),
    naoHaIgualAoLadoLinha(X87, X86, X88, X77),

    %centro
    naoHaIgualAoLadoMeio(X22, X12, X21, X23, X32),
    naoHaIgualAoLadoMeio(X23, X13, X22, X24, X33),
    naoHaIgualAoLadoMeio(X24, X14, X23, X25, X34),
    naoHaIgualAoLadoMeio(X25, X15, X24, X26, X35),
    naoHaIgualAoLadoMeio(X26, X16, X25, X27, X36),
    naoHaIgualAoLadoMeio(X27, X17, X26, X28, X37),

    naoHaIgualAoLadoMeio(X32, X22, X31, X33, X42),
    naoHaIgualAoLadoMeio(X33, X23, X32, X34, X43),
    naoHaIgualAoLadoMeio(X34, X24, X33, X35, X44),
    naoHaIgualAoLadoMeio(X35, X25, X34, X36, X45),
    naoHaIgualAoLadoMeio(X36, X26, X35, X37, X46),
    naoHaIgualAoLadoMeio(X37, X27, X36, X38, X47),

    naoHaIgualAoLadoMeio(X42, X32, X41, X43, X52),
    naoHaIgualAoLadoMeio(X43, X33, X42, X44, X53),
    naoHaIgualAoLadoMeio(X44, X34, X43, X45, X54),
    naoHaIgualAoLadoMeio(X45, X35, X44, X46, X55),
    naoHaIgualAoLadoMeio(X46, X36, X45, X47, X56),
    naoHaIgualAoLadoMeio(X47, X37, X46, X48, X57),

    naoHaIgualAoLadoMeio(X52, X42, X51, X53, X62),
    naoHaIgualAoLadoMeio(X53, X43, X52, X54, X63),
    naoHaIgualAoLadoMeio(X54, X44, X53, X55, X64),
    naoHaIgualAoLadoMeio(X55, X45, X54, X56, X65),
    naoHaIgualAoLadoMeio(X56, X46, X55, X57, X66),
    naoHaIgualAoLadoMeio(X57, X47, X56, X58, X67),

    naoHaIgualAoLadoMeio(X62, X52, X61, X63, X72),
    naoHaIgualAoLadoMeio(X63, X53, X62, X64, X73),
    naoHaIgualAoLadoMeio(X64, X54, X63, X65, X74),
    naoHaIgualAoLadoMeio(X65, X55, X64, X66, X75),
    naoHaIgualAoLadoMeio(X66, X56, X65, X67, X76),
    naoHaIgualAoLadoMeio(X67, X57, X66, X68, X77),

    naoHaIgualAoLadoMeio(X72, X62, X71, X73, X82),
    naoHaIgualAoLadoMeio(X73, X63, X72, X74, X83),
    naoHaIgualAoLadoMeio(X74, X64, X73, X75, X84),
    naoHaIgualAoLadoMeio(X75, X65, X74, X76, X85),
    naoHaIgualAoLadoMeio(X76, X66, X75, X77, X86),
    naoHaIgualAoLadoMeio(X77, X67, X76, X78, X87).


naoHaIgualAoLadoCanto(cell(_,_,Region1, Value1), cell(_,_,Region2, Value2), cell(_,_,Region3, Value3)) :- 
    																						  member(Region1, [0]) ; 
                                                                                              (not(member(Region1, [0])) ,
                                                                                                  (var(Value1) ;
                                                                                                   ((member(Region2, [0]) ;
                                                                                                    (not(member(Region2, [0])) ,
                                                                                                        (var(Value2) ;
                                                                                                         not(member(Value1, [Value2]))))) ,
                                                                                                      (member(Region3, [0]) ;
                                                                                                       (not(member(Region3, [0])) ,
                                                                                                           (var(Value3) ;
                                                                                                            not(member(Value1, [Value3])))))))).


naoHaIgualAoLadoLinha(cell(_,_,Region1, Value1), cell(_,_,Region2, Value2), cell(_,_,Region3, Value3), cell(_,_,Region4, Value4)) :- 
                                                                                              member(Region1, [0]) ; 
                                                                                              (not(member(Region1, [0])) ,
                                                                                                  (var(Value1) ;
                                                                                                   ((member(Region2, [0]) ;
                                                                                                    (not(member(Region2, [0])) ,
                                                                                                        (var(Value2) ;
                                                                                                         not(member(Value1, [Value2]))))) ,
                                                                                                      ((member(Region3, [0]) ;
                                                                                                       (not(member(Region3, [0])) ,
                                                                                                           (var(Value3) ;
                                                                                                            not(member(Value1, [Value3]))))),
                                                                                                        (member(Region4, [0]) ;
                                                                                                        (not(member(Region4, [0])) ,
                                                                                                            (var(Value4) ;
                                                                                                             not(member(Value1, [Value4])))))
                                                                                                        )))).


naoHaIgualAoLadoMeio(cell(_,_,Region1, Value1), cell(_,_,Region2, Value2), cell(_,_,Region3, Value3), cell(_,_,Region4, Value4), cell(_,_,Region5, Value5)) :- 
                                                                                              member(Region1, [0]) ; 
                                                                                              (not(member(Region1, [0])) ,
                                                                                                  (var(Value1) ;
                                                                                                   ((member(Region2, [0]) ;
                                                                                                    (not(member(Region2, [0])) ,
                                                                                                        (var(Value2) ;
                                                                                                         not(member(Value1, [Value2]))))) ,
                                                                                                      ((member(Region3, [0]) ;
                                                                                                       (not(member(Region3, [0])) ,
                                                                                                           (var(Value3) ;
                                                                                                            not(member(Value1, [Value3]))))),
                                                                                                        ((member(Region4, [0]) ;
                                                                                                         (not(member(Region4, [0])) ,
                                                                                                             (var(Value4) ;
                                                                                                              not(member(Value1, [Value4]))))),
                                                                                                         (member(Region5, [0]) ;
                                                                                                          (not(member(Region5, [0])) ,
                                                                                                              (var(Value5) ;
                                                                                                               not(member(Value1, [Value5]))))))
                                                                                                        )))).

