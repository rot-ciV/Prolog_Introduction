% Árvore genealógica
% Fatos------------------------------
genitor_de(maria, braulio).
genitor_de(mauro, braulio).


genitor_de(marilia, bizantina).
genitor_de(mariano, bizantina).


genitor_de(braulio, claudia).
genitor_de(bizantina, claudia).
genitor_de(braulio, carlos).
genitor_de(bizantina, carlos).
genitor_de(braulio, cristiano).
genitor_de(bizantina, cristiano).
genitor_de(braulio, carla).
genitor_de(bizantina, carla).
genitor_de(braulio, cesar).
genitor_de(bizantina, cesar).


genitor_de(claudia, aldo).
genitor_de(carlos, aldo).
genitor_de(claudia, ana).
genitor_de(carlos, ana).
genitor_de(claudia, amelia).
genitor_de(carlos, amelia).


genitor_de(carla, amancio).
genitor_de(cesar, amancio).
genitor_de(carla, amanda).
genitor_de(cesar, amanda).


genitor_de(amelia, joana).
genitor_de(arnaldo, joana).
genitor_de(amelia, janice).
genitor_de(arnaldo, janice).
genitor_de(amelia, jorge).
genitor_de(arnaldo, jorge).


genitor_de(alessandra, juliana).
genitor_de(amancio, juliana).
genitor_de(alessandra, julio).
genitor_de(amancio, julio).




homem(mauro).
homem(mariano).
homem(braulio).
homem(carlos).
homem(cristiano).
homem(cesar).
homem(aldo).
homem(arnaldo).
homem(amancio).
homem(jorge).
homem(julio).




mulher(maria).
mulher(marilia).
mulher(bizantina).
mulher(claudia).
mulher(carla).
mulher(ana).
mulher(amelia).
mulher(alessandra).
mulher(amanda).
mulher(joana).
mulher(janice).
mulher(juliana).    


% Regras-----------------------------
mae(X, Y) :- 
    genitor_de(X, Y), 
    mulher(X).

pai(X, Y) :- 
    genitor_de(X, Y), 
    homem(X).

pais(X, Y, Z) :- 
    genitor_de(Y, Z), 
    genitor_de(X, Z), 

    mulher(X),
    homem(Y),

    X \= Y.


irmaos(X, Y, Z, W) :-
    pais(X, Y, Z),
    pais(X, Y, W),
    Z \= W.


descendente(Desc, Asc) :-
    genitor_de(Asc, Desc).

descendente(Desc, Asc) :-
    genitor_de(Mid, Desc),
    descendente(Mid, Asc).


% Consultas----------------------------
summary :-
    nl,
    write("Arvore genealogica"), nl, nl,
    write("Use os comandos:\nlist_men.\nlist_women.\nantepassados.\ndescendentes.\ngenitor.\nmae.\npai.\nirmaos.\n"), nl.


list_men :-
    homem(X),
    write('homem: '), 
    write(X), nl,
    fail.

list_men.


list_women :-
    mulher(X),
    write('mulher: '), 
    write(X), nl,
    fail.

list_women.


antepassados(Antepassado, X):-
    
    genitor_de(Antepassado, X).


antepassados(Antepassado, X):-
   
    genitor_de(Mid, X),
    antepassados(Antepassado, Mid).    




genitor :-
    write('Digite o nome da pessoa: '),
    read(Nome),
    genitor_de(X1, Nome),
    genitor_de(X2, Nome),
    homem(X1),
    mulher(X2),
    write(X1),write(' e '), write(X2), write(' e genitores de: '), write(Nome), nl,

    fail.

mae :-
    write('Digite o nome da pessoa: '),
    read(Nome),
    genitor_de(X, Nome),
    mulher(X),

    write(X), write(' é a mae de: '), write(Nome), nl,

    fail.

pai :-
    write('Digite o nome da pessoa: '),
    read(Nome),
    genitor_de(X, Nome),
    homem(X),

    write(X), write(' é o pai de: '), write(Nome), nl,

    fail.

irmaos :-
    write('Digite o nome da pessoa: '),
    read(Pessoa),

    pais(Mae, Pai, Pessoa),

    pais(Mae, Pai, Irmao),

    Irmao \= Pessoa,
   

    write(Pessoa), write(' é irmao(a) de: '), write(Irmao), nl,

    fail.
irmaos.