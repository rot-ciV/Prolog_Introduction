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
    member(X, [aranha, escorpiao]),
    explicacao_aracnideo(X).

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

explicacao_aracnideo(aranha) :-
    write('A aranha, mesmo muitas vezes confudida como um inseto, é o exemplo clássico de aracnídeo por características como:'), nl,
    write('- 8 patas (diferentemente dos insetos).'), nl,
    write('- Corpo divido em 2 partes: cefalotórax e abdômen.'), nl,
    write('- Não apresentam mandibulas, mas sim quelíceras.'), nl.

explicacao_aracnideo(escorpiao) :-
    write('O escorpião também é considerado um aracnídeo, pelo fato de:'), nl,
    write('- Ter 4 pares de patas.'), nl,
    write('- Apresentar um corpo divido em apenas 2 partes: cefalotórax e abdômen.'), nl,
    write('- Não possuí antenas.'), nl.

