% % == FATOS GERAIS ==

platelmintos(tenia).
platelmintos(planaria).

artropode(formiga).
artropode(aranha).
artropode(siri).
artropode(lagarta).
artropode(lacraia).
artropode(piolho_de_cobra).
artropode(escorpiao).
artropode(camarao).
artropode(centopeia). 


% % == FATOS CARACTERITICAS ==

patas(formiga, 6).
patas(lagarta, 6).
patas(aranha, 8).
patas(escorpiao, 8).
patas(siri, 10).
patas(camarao, 10).
patas(piolho_de_cobra, 4).
patas(lacraia, 2).
patas(centopeia, 2).

corpo(formiga, cabeca_torax_abdomen).
corpo(lagarta, cabeca_torax_abdomen).
corpo(aranha, cefalotorax_abdomen).
corpo(escorpiao, cefalotorax_abdomen).
corpo(siri, cefalotorax_abdomen).
corpo(camarao, cefalotorax_abdomen).
corpo(lacraia, cabeca_tronco).
corpo(centopeia, cabeca_tronco).
corpo(piolho_de_cobra, cabeca_tronco).

dieta(formiga, [herbivaro, carnivoro, necrofago]).
dieta(lagarta, herbivaro).
dieta(aranha, [carnivoro, necrofago]).
dieta(escorpiao, carnivoro).
dieta(siri, [herbivaro, carnivoro, necrofago]).
dieta(camarao, [herbivaro, carnivoro, necrofago]).
dieta(lacraia, carnivoro).
dieta(centopeia, carnivoro).
dieta(piolho_de_cobra, herbivaro).




% % == REGRAS DE CLASSIFICAÇÃO == 


inseto(X) :- 
    artropode(X),
    patas(X, 6),
    corpo(X, cabeca_torax_abdomen),
    explicacao_inseto(X),
    dieta(X, Dieta_Do_Animal),

    write("Dieta da "), write(X), write(": "), write(Dieta_Do_Animal).

aracnideo(X) :- 
    artropode(X),
    patas(X, 8),
    corpo(X, cefalotorax_abdomen),
    explicacao_aracnideo(X),
    dieta(X, Dieta_Do_Animal),

    write("Dieta do(a) "), write(X), write(": "), write(Dieta_Do_Animal).

crustaceo(X) :- 
    artropode(X),
    patas(X, 10),
    corpo(X, cefalotorax_abdomen),
    explicacao_crustaceos(X),
    dieta(X, Dieta_Do_Animal),

    write("Dieta do "), write(X), write(": "), write(Dieta_Do_Animal).

quilopode(X) :- 
    artropode(X),
    patas(X, 2),
    corpo(X, cabeca_tronco),
    dieta(X, Dieta_Do_Animal),

    write("Dieta da "), write(X), write(": "), write(Dieta_Do_Animal).

diplopode(X) :- 
    artropode(X),
    patas(X, 4),
    corpo(X, cabeca_tronco),
    dieta(X, Dieta_Do_Animal),

    write("Dieta do "), write(X), write(": "), write(Dieta_Do_Animal).





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

explicacao_crustaceos(X) :-
    write("O "), write(X), write(" é um crustáceo pelas seguintes características:"), nl,
    write("- Possuem dois pares de antenas."), nl,
    write("- Diferentemente dos outros artrópodes, os apendices são bifurcados."), nl,
    write("- carapaça revestindo o tórax e os segmentos anteriores."), nl.



