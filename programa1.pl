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
    explicacao_quilopodes(X),
    dieta(X, Dieta_Do_Animal),

    write("Dieta da "), write(X), write(": "), write(Dieta_Do_Animal).

diplopode(X) :- 
    artropode(X),
    patas(X, 4),
    corpo(X, cabeca_tronco),
    explicacao_diplopodes(X),
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

explicacao_quilopodes(X) :-
    write("O "), write(X), write(" é um quilopode pelas seguintes características:"), nl,
    write("- Um par de antenas na cabeça"), nl,
    write("- Diferentemente dos diplopodes, não tem a capacidade de se enrolar como defesa"), nl,
    write("- Um par de patas por segmento do corpo."), nl.

explicacao_diplopodes(X) :-
    write("O "), write(X), write(" é um diplopode pelas seguintes características:"), nl,
    write("- Possuem um par de antenas curtas que usam para sentir o ambiente. "), nl,
    write("- Tem dois pares de pernas em cada segmento do corpo"), nl,
    write("- Diferentemente dos quilopodes, tem a capacidade de se enrolar como defesa e não possuem veneno."), nl,
    write("- Preferem locais úmidos e escuros, como embaixo de pedras, folhas caídas e troncos em decomposição. "), nl.


    %% ---------------------- == SUMÁRIO: == ---------------------------

    iniciar :-

    write('-> insetos'), nl,
         write('    .formiga'),nl,
    write('-> aracnideos'), nl,
         write('    .aranha'),nl,
         write('    .escorpião'),nl,
    write('-> crustaceos'), nl,
         write('    .camarao'), nl,
         write('    .siri'), nl,
    write('-> quilopodes'), nl,
         write('    .centopeia'), nl,
         write('    .lagarta'), nl,
         write('    .lacraia'), nl,
    write('-> diplopodes'), nl,
         write('    .piolho_de_cobra'), nl,nl,
    
    write('Aqui você vai digitar a classe que deseja dentro do filo dos artropodes e em seguida o animal pertencente: '), nl.

    insetos :-

    write('Escreva o inseto que deseja saber: '), nl,
    read(X),
    inseto(X).

    aracnideos :-

    write('Escreva o aracnideo que deseja saber: '), nl,
    read(X),
    aracnideo(X).

    crustaceos :-

    write('Escreva o crustaceo que deseja saber: '), nl,
    read(X),
    crustaceo(X).

    quilopodes :-

    write('Escreva o quilopode que deseja saber: '), nl,
    read(X),
    quilopode(X).

    diplopodes :-

    write('Escreva o diplopode que deseja saber: '), nl,
    read(X),
    diplopode(X).