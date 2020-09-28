%animais
animal(urso).
animal(peixe).
animal(raposa).
animal(veado).
animal(guaxinim).
animal(coelho).
animal(lince).
animal(minhoca).
animal(mosca).
animal(peixinho).

%plantas
planta(grama).
planta(alga).
planta(plantacarnivora).

%o que comem
come(urso, peixe).
come(urso, raposa).
come(urso, veado).
come(urso, guaxinim).
come(raposa, coelho).
come(veado, grama).
come(lince, veado).
come(peixe, peixinho).
come(peixe, alga).
come(peixe, minhoca).
come(peixinho, alga).
come(plantacarnivora, mosca).

%animais carnívoros
carnivoro(X) :- come(X, Y),
				animal(Y).

%animais herbívoros
herbivoro(X) :- come(X, Y),
				planta(Y).
				
%predadores e presas
predador(X) :- come(X, _Y).

presa(X) :- come(_Y, X).

%pertencem à cadeia alimentar do urso
pertence_a_cadeia(X, Y) :- come(Y, X);
						   come(Z, X),
						   pertence_a_cadeia(Z, Y).

%é predador e presa
predador_e_presa(X) :- come(_A, X),
					   come(X, _B).

%é presa e herbívoro
presa_e_herbivoro(X) :- presa(X),
						herbivoro(X).

%pertencem à cadeia alimentar do urso e comem plantas
pertence_a_cadeia_e_come_planta(X, Y) :- come(Y, X),
										 %comem planta
										 come(X, A),
										 planta(A);

						   				 come(Z, X),
						   				 %comem planta
						   				 come(X, A),
										 planta(A),

						   				 pertence_a_cadeia(Z, Y).

% EXEMPLOS DE PERGUNTAS:
% 1 - come(peixe, peixinho).
%	  come(peixe, minhoca).
% 2 - planta(X).
% 3 - come(urso, X).
% 4 - come(X, peixe).
% 5 - predador(X).
% 6 - predador_e_presa(X).
% 7 - presa_e_herbivoro(X).
% 8 - pertence_a_cadeia(X, urso).
% 9 - pertence_a_cadeia_e_come_planta(X, urso).
% 10 - pertence_a_cadeia(minhoca, X).