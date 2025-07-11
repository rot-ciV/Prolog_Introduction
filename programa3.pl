% % == JOGOS ==

plataforma_jogo(minecraft, [pc, xbox, nintendo, playstation, mobile]).
plataforma_jogo(valorant, pc).
plataforma_jogo(elden_ring, [pc, xbox, playstation]).
plataforma_jogo(slime_rancher, [pc, xbox, playstation, nintendo]).
plataforma_jogo(hollow_knight, [pc, xbox, playstation, nintendo]).
plataforma_jogo(mario_party, nintendo).
plataforma_jogo(katana_zero, [pc, mobile,  xbox, nintendo]).

tipo_jogo(minecraft, [mult, solo]).
tipo_jogo(elden_ring, solo).
tipo_jogo(valorant, mult).
tipo_jogo(slime_rancher, solo).
tipo_jogo(hollow_knight, solo).
tipo_jogo(mario_party, mult).
tipo_jogo(katana_zero, solo).

exp_jogo(minecraft, relax).
exp_jogo(elden_ring, desafio).
exp_jogo(valorant, desafio).
exp_jogo(slime_rancher, relax).
exp_jogo(hollow_knight, desafio).
exp_jogo(mario_party, desafio).
exp_jogo(katana_zero, desafio).


% % == PERGUNTAS PARA O USUARIO ==

pergunta_plataforma(Plataforma_Final) :-

    write("Você tem alguma preferência de plataforma? (pc, console, mobile, não): "),
    read(Plataforma_Geral),
    (   Plataforma_Geral == console
    ->  write("Qual console gostaria de utilizar? (nintendo, xbox, playstation, qualquer): "),
        read(Tipo_Console),
        Plataforma_Final = Tipo_Console
    ;
        Plataforma_Final = Plataforma_Geral
    ).


pergunta_solo_mult(Tipo) :-

    write("Gostaria que o jogo fosse singleplayer ou multiplayer? (solo, mult, qualquer): "),
    read(Tipo_geral),
    Tipo = Tipo_geral.


pergunta_experiencia(Experiencia_Jogo_Final) :-

    write("Você está buscando um desafio ou uma experiência relaxante? (desafio, relax): "),
    read(Experiencia),
    Experiencia_Jogo_Final = Experiencia.


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


% % == COMEÇA RECOMENDAÇÃO ==

iniciar_recomendacao :-

    pergunta_plataforma(Plataforma_Escolhida),

    findall(Jogo, 
    jogo_disponivel_plataforma(Jogo, Plataforma_Escolhida), 
    Jogos_Filtrados_Por_Plataforma),
    
    (   Jogos_Filtrados_Por_Plataforma = []
    ->  write('Não há jogos da plataforma '), write(Plataforma_Escolhida), write(' entre os disponiveis para a sua plataforma.'), nl
    ;

        pergunta_solo_mult(Tipo_Escolhido),

        findall(Jogo_Individual, 
        (member(Jogo_Individual, Jogos_Filtrados_Por_Plataforma), jogo_solo_mult(Jogo_Individual,Tipo_Escolhido)), 
        Jogos_Filtrados_Por_Tipo),
        
        (   Jogos_Filtrados_Por_Tipo = []
        -> write('Não há jogos '), write(Tipo_Escolhido), write(' entre os disponiveis para a sua plataforma.'), nl
        
        ;
            pergunta_experiencia(Experiencia_Escolhida),

            findall(Jogo_Individual, 
            (member(Jogo_Individual, Jogos_Filtrados_Por_Tipo), experiencia(Jogo_Individual, Experiencia_Escolhida)), 
            Jogos_Filtrados_Por_Experiencia),

            (Jogos_Filtrados_Por_Experiencia = []
            -> write("Não há jogos do(a) "), write(Plataforma_Escolhida), write(" e "), write(Tipo_Escolhido), write(", que tragam uma experiência "), write(Experiencia_Escolhida), nl
            
            ;

                write(Jogos_Filtrados_Por_Experiencia),
                true
            )
        
        )
    ).
