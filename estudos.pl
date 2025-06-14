% Fatos

jogador(vini).
jogador(maria).
jogador(douglas).
jogador(cleide).
jogador(xota_games).

movimento(simples).
movimento(complexo).


% regras

jogador_experiente(X) :- X = vini; X = maria.

jogador_iniciante(X) :- X = douglas; X = cleide; X = xota_games.


% Regra Principal

movimento_valido(Jogador, Movimento) :-
    jogador_experiente(Jogador)
    ; 
    jogador_iniciante(Jogador) , Movimento = simples. 
