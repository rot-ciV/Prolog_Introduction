% % == CARACTERISTICAS DOS JOGOS ==

plataforma_jogo(minecraft, [pc, xbox, nintendo_switch, playstation, mobile]).
plataforma_jogo(stardew_valley, [pc, mobile, xbox, nintendo_switch, playstation]).
plataforma_jogo(brawhalla, [pc, xbox, playstation, mobile, nintendo_switch]).
plataforma_jogo(valorant, pc).
plataforma_jogo(elden_ring, [pc, xbox, playstation]).
plataforma_jogo(slime_rancher, [pc, xbox, playstation, nintendo_switch]).
plataforma_jogo(hollow_knight, [pc, xbox, playstation, nintendo_switch]).
plataforma_jogo(mario_party, nintendo_switch).
plataforma_jogo(katana_zero, [pc, mobile,  xbox, nintendo_switch]).
plataforma_jogo(clash_royale, mobile).
plataforma_jogo(inscryption, [pc, nintendo_switch, xbox, playstation]).
plataforma_jogo(rocket_league, [pc, xbox, playstation, nintendo_switch]).
plataforma_jogo(battlefield, [pc, xbox, playstation]).
plataforma_jogo(the_witcher, [pc, xbox, playstation, nintendo_switch]).
plataforma_jogo(ea_sports_fc, [pc, xbox, playstation, nintendo_switch, mobile]).
plataforma_jogo(soul_knight, mobile).
plataforma(hay_day, mobile).

tipo_jogo(minecraft, [mult, solo]).
tipo_jogo(stardew_valley, [solo, mult]).
tipo_jogo(soul_knight, [solo, mult]).
tipo_jogo(brawhalla, mult).
tipo_jogo(the_witcher, solo).
tipo_jogo(rocket_league, mult).
tipo_jogo(elden_ring, solo).
tipo_jogo(valorant, mult).
tipo_jogo(slime_rancher, solo).
tipo_jogo(hollow_knight, solo).
tipo_jogo(mario_party, mult).
tipo_jogo(katana_zero, solo).
tipo_jogo(clash_royale, solo).
tipo_jogo(inscryption, solo).
tipo_jogo(battlefield, [solo, mult]).
tipo_jogo(ea_sports_fc, [solo, mult]).
tipo_jogo(hay_day, solo).

exp_jogo(minecraft, relax).
exp_jogo(stardew_valley, relax).
exp_jogo(soul_knight, desafio).
exp_jogo(ea_sports_fc, desafio).
exp_jogo(brawhalla, desafio).
exp_jogo(the_witcher, [relax, desafio]).
exp_jogo(rocket_league, desafio).
exp_jogo(elden_ring, desafio).
exp_jogo(valorant, desafio).
exp_jogo(slime_rancher, relax).
exp_jogo(hollow_knight, desafio).
exp_jogo(mario_party, desafio).
exp_jogo(katana_zero, desafio).
exp_jogo(clash_royale, desafio).
exp_jogo(inscryption, desafio).
exp_jogo(battlefield, desafio).
exp_jogo(hay_day, relax).

genero_jogo(minecraft, aventura).
genero_jogo(stardew_valley, [aventura, simulador]).
genero_jogo(soul_knight, aventura).
genero_jogo(ea_sports_fc, esportes).
genero_jogo(brawhalla, plataforma).
genero_jogo(the_witcher, aventura).
genero_jogo(elden_ring, aventura). 
genero_jogo(valorant, fps).
genero_jogo(slime_rancher, [aventura, simulador]). 
genero_jogo(hollow_knight, [aventura, plataforma]).
genero_jogo(mario_party, esportes). 
genero_jogo(katana_zero, plataforma).
genero_jogo(clash_royale, estrategia).
genero_jogo(inscryption, estrategia).
genero_jogo(rocket_league, esportes).
genero_jogo(battlefield, [aventura, fps]).
genero_jogo(hay_day, simulador).


% % == PERGUNTAS PARA O USUARIO ==

pergunta_plataforma(Plataforma_Final) :-

    write("Qual plataforma de preferencia? (pc, console, mobile): "), nl,
    read(Plataforma_Geral),
    (   Plataforma_Geral == console
    ->  write("Qual console gostaria de utilizar? (nintendo_switch, xbox, playstation, qualquer): "), nl,
        read(Tipo_Console),
        Plataforma_Final = Tipo_Console
    ;
        Plataforma_Final = Plataforma_Geral
    ).


pergunta_solo_mult(Tipo) :-

    write("Gostaria que o jogo fosse singleplayer ou multiplayer? (solo, mult, qualquer): "), nl,
    read(Tipo_geral),
    Tipo = Tipo_geral.


pergunta_experiencia(Experiencia_Jogo_Final) :-

    write("Você está buscando um desafio ou uma experiência relaxante? (desafio, relax): "), nl,
    read(Experiencia),
    Experiencia_Jogo_Final = Experiencia.


pergunta_genero(Genero_Jogo_Final) :-

    write("Que gênero você está procurando? (aventura, estrategia, esportes, fps, simulador, plataforma)"), nl,
    read(Genero),
    Genero_Jogo_Final = Genero.


% % == REGRAS DA FILTRAGEM ==

jogo_disponivel_plataforma(Jogo, Plataforma_Usuario) :-
    
    plataforma_jogo(Jogo, Plataforma),
    (   Plataforma == Plataforma_Usuario
    ;   
        is_list(Plataforma),
        member(Plataforma_Usuario, Plataforma)
    ).


jogo_solo_mult(Jogo, Tipo_Definido_Usuario) :-

    tipo_jogo(Jogo, Tipo),
    (   Tipo_Definido_Usuario == qualquer
    ;   
        (   Tipo == Tipo_Definido_Usuario
        ;   
            is_list(Tipo),
            member(Tipo_Definido_Usuario, Tipo)
        )
    ).


experiencia(Jogo, Experiencia_Usuario) :-

    exp_jogo(Jogo, Exp),
    Exp == Experiencia_Usuario.


genero(Jogo, Genero_Usuario) :-

    genero_jogo(Jogo, Gen),
    
    (   Gen == Genero_Usuario
    ;
        is_list(Gen),
        member(Genero_Usuario, Gen)
    ).


% % == COMEÇA RECOMENDAÇÃO ==

:- initialization(exibir_mensagem_inicial).

exibir_mensagem_inicial :- % <- Esta é a regra que executa a mensagem.
    write("Para iniciar a recomendação, digite: iniciar_recomendacao."), nl.

iniciar_recomendacao :-

    pergunta_plataforma(Plataforma_Escolhida),

    findall(Jogo, 
    jogo_disponivel_plataforma(Jogo, Plataforma_Escolhida), 
    Jogos_Filtrados_Por_Plataforma),
    
    (   Jogos_Filtrados_Por_Plataforma = []
    -> write("Não há jogos que atendam a todas as suas preferências.")

    ;

        pergunta_solo_mult(Tipo_Escolhido),

        findall(Jogo_Individual, 
        (member(Jogo_Individual, Jogos_Filtrados_Por_Plataforma), jogo_solo_mult(Jogo_Individual,Tipo_Escolhido)), 
        Jogos_Filtrados_Por_Tipo),
        
        (   Jogos_Filtrados_Por_Tipo = []
        -> write("Não há jogos que atendam a todas as suas preferências.")
        
        ;
            pergunta_experiencia(Experiencia_Escolhida),

            findall(Jogo_Individual, 
            (member(Jogo_Individual, Jogos_Filtrados_Por_Tipo), experiencia(Jogo_Individual, Experiencia_Escolhida)), 
            Jogos_Filtrados_Por_Experiencia),

            (Jogos_Filtrados_Por_Experiencia = []
            -> write("Não há jogos que atendam a todas as suas preferências.")
            
            ;

                pergunta_genero(Genero_Escolhido),

                findall(Jogo_Individual, 
                (member(Jogo_Individual, Jogos_Filtrados_Por_Experiencia), genero(Jogo_Individual, Genero_Escolhido)),
                Jogos_Filtrados_Por_Genero),

                (Jogos_Filtrados_Por_Genero = []
                -> write("Não há jogos que atendam a todas as suas preferências."), 
                true

                ;

                write("Recomendação final: "), write(Jogos_Filtrados_Por_Genero), nl,
                true

                )
            )
        )
    ).
