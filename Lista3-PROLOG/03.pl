% identidades
passaro(tweety).
peixe(goldie).
minhoca(molie).

% o que gostam
gosta(passaro, minhoca).
gosta(gato, peixe).
gosta(gato, passaro).

% amigos
amigo(gato, eu).

come(X, Y) :- gosta(X, Y).

% Nome
nome(meuGato, silvester).

% EXEMPLO DE PERGUNTAS

% Quem é um peixe
% peixe(X).

% Quem gosta de passaro
% gosta(X, passaro).

% De quem eu sou amigo
% amigo(X, eu).

% O gato gosta de que
% come(gato, X).

% Qual o nome do meu gato
% nome(meuGato, X).