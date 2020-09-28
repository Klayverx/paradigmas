% CARACTERÍSTICAS

bonita(cassia).

bonito(marcos).
bonito(fabiano).

rico_e_feliz(marcos).

rica(ana).

forte(ana).
forte(fabiano).
forte(silvio).

amavel(silvio).

%--------------------------

% Homens e Mulheres
homem(marcos).
homem(fabiano).
homem(silvio).

mulher(cassia).
mulher(ana).

%--------------------------

% Todo rico é feliz
homemFeliz(X) :- rico_e_feliz(X).

% Todos os homens gostam de mulheres bonitas
homemGosta(X,Y) :- homem(X),
				   mulher(Y), 
				   bonita(Y).

% Mulher gosta de homem que gosta dela (exclusivamente Ana e incluso Cássia)
mulherGosta(X, Y) :- homemGosta(Y, X).

% Cassia gosta de qualquer homem que gosta dela, desde que ele seja rico, amável ou bonito, e forte.
cassiaGosta(X, Y) :- mulherGosta(X, Y),
					 forte(Y),
					 rico_e_feliz(Y);    % Sendo rico

					 mulherGosta(X, Y),
					 forte(Y),
					 amavel(Y);    % Amável

					 mulherGosta(X, Y),
					 forte(Y),
					 bonito(Y).    % ou Bonito

% Qualquer mulher que gosta de um homem que gosta dela é feliz
mulherFeliz(X) :- mulherGosta(X, _Y).

% EXEMPLOS DE PERGUNTAS:
% Que homem gosta de Cássia
% homemGosta(X, cassia).
%
% Quem homem é feliz
% homemFeliz(X).
%
% De quem Cássia gosta
% cassiaGosta(cassia, Y).
%
% Quem é uma mulher feliz
% mulherFeliz(X).