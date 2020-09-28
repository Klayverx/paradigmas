%categorias dos filmes
categoria(amnesia, suspense).
categoria(rebecca, suspense).
categoria(tubarao, suspense).
categoria(babel, drama).
categoria(capote, drama).
categoria(volver, drama).
categoria(casablanca, romance).
categoria(titanic, romance).
categoria(matrix, ficcao).
categoria(sinais, ficcao).
categoria(spartacus, acao).
categoria(shrek, aventura).
categoria(superman, aventura).

%direção dos filmes
direcao(nolan, amnesia).
direcao(inarritu, babel).
direcao(miller, capote).
direcao(curtiz, casablanca).
direcao(wachowsk, matrix).
direcao(hitchcock, rebecca).
direcao(adamson, shrek).
direcao(shymalan, sinais).
direcao(kubrik, spartacus).
direcao(donner, superman).
direcao(cameron, titanic).
direcao(spielberg, tubarao).
direcao(almodovar, volver).

%lançamento dos filmes
lancamento(2000, amnesia).
lancamento(2006, babel).
lancamento(2005, capote).
lancamento(1942, casablanca).
lancamento(1999, matrix).
lancamento(1940, rebecca).
lancamento(2001, shrek).
lancamento(2002, sinais).
lancamento(1960, spartacus).
lancamento(1978, superman).
lancamento(1997, titanic).
lancamento(1975, tubarao).
lancamento(2006, volver).

%duração dos filmes
duracao(amnesia, 113).
duracao(babel, 142).
duracao(capote, 98).
duracao(casablanca, 102).
duracao(matrix, 136).
duracao(rebecca, 130).
duracao(shrek, 90).
duracao(sinais, 106).
duracao(spartacus, 184).
duracao(superman, 143).
duracao(titanic, 194).
duracao(tubarao, 124).
duracao(volver, 121).

%o segundo parametro é a duração inferior que se deseja encontrar
duracao_inferior(X, Y) :- duracao(X, A),
						   A<Y.

% X- ano inferior(incluso)  |  Y- ano superior(incluso)
lancado_entre(X, Y, Z) :- lancamento(A, Z),
						  A>=X,
						  A=<Y.

% EXEMPLOS DE PERGUNTAS:
% a) direcao(X, titanic).
% b) categoria(X, suspense).
% c) direcao(donner, X).
% d) lancamento(X, sinais).
% e) duracao_inferior(X, 100).
% f) lancado_entre(2000, 2005, Z).