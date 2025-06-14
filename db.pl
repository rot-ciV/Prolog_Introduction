% Fatos


artropode(formiga).
artropode(aranha).
artropode(siri).
artropode(lagarta).
artropode(lacraia).
artropode(piolho_de_cobra).
artropode(escorpiao).
artropode(camarao).
artropode(centopeia). 


% % == REGRAS DE CLASSIFICAÇÃO == 


inseto(X) :- 
    artropode(X),
    member(X, [formiga, lagarta]),
    explicacao_inseto(X).

aracnideo(X) :- 
    artropode(X),
    member(X, [aranha, escorpiao]).

crustaceo(X) :- 
    artropode(X),
    member(X, [siri, camarao]).

quilopodes(X) :- 
    artropode(X),
    member(X, [lacraia, centopeia]).

diplopode(X) :- 
    artropode(X),
    member(X, [piolho_de_cobra]).

predador(X) :- member(X, [aranha, escorpiao, siri, lacraia, camarao]).


% % === REGRAS DE EXPLICAÇÕES ESPECÍFICAS ===


explicacao_inseto(formiga) :-
    write('A formiga é um inseto. Isso é por conta das seguintes características:'), nl,
    write('- 6 patas.'), nl,
    write('- Corpo dividido em: cabeça, tórax e abdômen.'), nl,
    write('- Exoesqueleto de quitina.'), nl.

explicacao_inseto(lagarta) :-
    write('Mesmo não parecendo, a lagarta é um inseto! Isso é por conta das seguintes características:'), nl,
    write('- 6 patas verdadeiras. Isso mesmo, ela apenas aparenta ter várias patas, todas que estão em seu abdomen são consideradas pseudopatas!'), nl,
    write('- Corpo dividido em: cabeça, tórax e abdômen'), nl,
    write('- Exoesqueleto de quitina'), nl,
    write('Curiosidade: A lagarta é a fase larval de insetos como borboletas e mariposas.'), nl.
