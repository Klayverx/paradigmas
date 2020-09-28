%identidades
passaro(joao).
peixe(pedro).
minhoca(maria).

%o que gostam
gosta(passaro, minhoca).
gosta(gato, peixe).
gosta(gato, passaro).
gosta(amigo, amigo).

amigo(meuGato, eu).
nome(gato, chuck_norris).

%o que come
come(X, Y) :- gosta(X, Y),
			  Y\=eu,
			  Y\=pessoas.

%------------------------

% EXEMPLO DE PERGUNTAS

% Quem é um pássaro
% passaro(X).

% Quem gosta de minhoca
% gosta(X, minhoca).

% O que o gato come
% come(gato, X).

% Qual o nome do gato
% nome(gato, X).