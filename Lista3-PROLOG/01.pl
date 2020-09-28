%pais
pai(ivo, eva).
pai(gil, rai).
pai(gil, clo).
pai(gil, ary).
pai(rai, noe).
pai(ary, gal).

%maes
mae(ana, eva).
mae(bia, rai).
mae(bia, clo).
mae(bia, ary).
mae(eva, noe).
mae(lia, gal).

%mulheres
mulher(ana).
mulher(bia).
mulher(eva).
mulher(clo).
mulher(lia).
mulher(gal).

%homens
homem(ivo).
homem(gil).
homem(rai).
homem(ary).
homem(noe).

%gerou
gerou(X, Y) :- pai(X, Y);
			   mae(X, Y).

%filho
filho(X, Y) :- gerou(Y, X),
			homem(X).

%filha
filha(X, Y) :- gerou(Y, X),
			mulher(X).

%tio
tio(X, Y) :- homem(X),
			 gerou(A, X),
			 gerou(A, B),
			 gerou(B, Y),
			 X\==B.

%tia
tia(X, Y) :- mulher(X),
			 gerou(A, X),
			 gerou(A, B),
			 gerou(B, Y),
			 X\==B.

%primo
primo(X, Y) :- gerou(A, X),
			   gerou(B, Y),
			   gerou(C, A),
			   gerou(C, B),
			   homem(X),
			   homem(Y),
			   X\==Y.

%prima
prima(X, Y) :- gerou(A, X),
			   gerou(B, Y),
			   gerou(C, A),
			   gerou(C, B),
			   mulher(X),
			   mulher(Y),
			   X\==Y.

%avô
avohomem(X, Y) :- homem(X),
				  gerou(A, Y),
				  gerou(X, A).

%avó
avomulher(X, Y) :- mulher(X),
				   gerou(A, Y),
				   gerou(X, A).