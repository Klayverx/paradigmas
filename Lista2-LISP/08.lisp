; comandos para limpar a tela
(ext:run-shell-command "cls")
(defun cls () (ext:run-shell-command "cls") )

; listas para os campos do jogo
(setq linha1 (list 1 2 3))
(setq linha2 (list 4 5 6))
(setq linha3 (list 7 8 9))

; lista de uma posição para decidir a vez de quem joga
(setq round (list 1))

; formatação para mostrar na tela e capturar uma posição para jogar
(defun game (linha1 linha2 linha3)
	(format t "~% ~S | ~S | ~S ~%---|---|---~% ~S | ~S | ~S ~%---|---|---~% ~S | ~S | ~S ~%"
		(nth 0 linha1) (nth 1 linha1) (nth 2 linha1)
		(nth 0 linha2) (nth 1 linha2) (nth 2 linha2)
		(nth 0 linha3) (nth 1 linha3) (nth 2 linha3)
	)
	; capturando posição escolhida pelo user
	(format t "~%Escolha uma posicao: ")
	(setq pos (read))

	(marcar pos)
)

; função para verificar a posição escolhida e marcar a jogada
(defun marcar (pos)
	(cond
		; jogada na primeira linha
		; verificando se na posição já oussui alguma jogada (X / O)
		((and (> pos 0) (< pos 4))
			(if (equal (nth (- pos 1) linha1) 'X)
				(progn 
					(cls)
					(format t "Posicao invalida!~%")
					(game linha1 linha2 linha3)
				)
			)
			(if (equal (nth (- pos 1) linha1) 'O)
				(progn 
					(cls)
					(format t "Posicao invalida!~%")
					(game linha1 linha2 linha3)
				)
			)

			; fazendo a marcação da jogada na posição escolhida
			(setf (nth (- pos 1) linha1) 'X)
			(cls)
			(win linha1 linha2 linha3)
		)

		; jogada na segunda linha
		((and (> pos 3) (< pos 7))
			(if (equal (nth (- pos 4) linha2) 'X)
				(progn 
					(cls)
					(format t "Posicao invalida!~%")
					(game linha1 linha2 linha3)
				)
			)
			(if (equal (nth (- pos 4) linha2) 'O)
				(progn 
					(cls)
					(format t "Posicao invalida!~%")
					(game linha1 linha2 linha3)
				)
			)

			(setf (nth (- pos 4) linha2) 'X)
			(cls)
			(win linha1 linha2 linha3)
		)

		; jogada na terceira linha
		((and (> pos 6) (< pos 10))
			(if (equal (nth (- pos 7) linha3) 'X)
				(progn 
					(cls)
					(format t "Posicao invalida!~%")
					(game linha1 linha2 linha3)
				)
			)
			(if (equal (nth (- pos 7) linha3) 'O)
				(progn 
					(cls)
					(format t "Posicao invalida!~%")
					(game linha1 linha2 linha3)
				)
			)

			(setf (nth (- pos 7) linha3) 'X)
			(cls)
			(win linha1 linha2 linha3)
		)

		; caso o usuário digite uma posição inválida
		((progn (cls)
			(format t "Posicao invalida!~%")
			(game linha1 linha2 linha3))
		)
	)
)

; função para o bot jogar
(defun pcJoga (linha1 linha2 linha3)
	(setq jogou 0)

	; verificando se há possibilidades na primeira linha
	(dotimes (i (list-length linha1))
		(if (or (equal (nth i linha1) 'X) (equal (nth i linha1) 'O))
			nil
			(progn
				(setq jogou 1)
				(setq jogar i)
			)
		)
	)

	; verificando se já jogou e chamando a função para verificar possibilidade de vitória
	(if (> jogou 0)
		(progn 
			(setf (nth jogar linha1) 'O)
			(win linha1 linha2 linha3)
		)
	)

	; verificando se há possibilidades na segunda linha
	(dotimes (i (list-length linha2))
		(if (or (equal (nth i linha2) 'X) (equal (nth i linha2) 'O))
			nil
			(progn
				(setq jogou 1)
				(setq jogar i)
			)
		)
	)

	; verificando se já jogou e chamando a função para verificar possibilidade de vitória
	(if (> jogou 0)
		(progn 
			(setf (nth jogar linha2) 'O)
			(win linha1 linha2 linha3)
		)
	)

	; verificando se há possibilidades na terceira linha
	(dotimes (i (list-length linha3))
		(if (or (equal (nth i linha3) 'X) (equal (nth i linha3) 'O))
			nil
			(progn
				(setq jogou 1)
				(setq jogar i)
			)
		)
	)

	; verificando se já jogou e chamando a função para verificar possibilidade de vitória
	(if (> jogou 0)
		(progn 
			(setf (nth jogar linha3) 'O)
			(win linha1 linha2 linha3)
		)
	)

	; caso não haja mais possibilidades de jogadas (empate)
	(if (= jogou 0)
		(progn
			(format t "~% ~S | ~S | ~S ~%---|---|---~% ~S | ~S | ~S ~%---|---|---~% ~S | ~S | ~S ~%"
				(nth 0 linha1) (nth 1 linha1) (nth 2 linha1)
				(nth 0 linha2) (nth 1 linha2) (nth 2 linha2)
				(nth 0 linha3) (nth 1 linha3) (nth 2 linha3)
			)	

			(format t "~%O jogo empatou! :)")
			(quit)
		)
	)
)

; função para verificar os casos de vitória
(defun win (linha1 linha2 linha3)
	; primeira linha completa
	(if (or (and (equal (nth 0 linha1) 'X) (equal (nth 1 linha1) 'X) (equal (nth 2 linha1) 'X))
			(and (equal (nth 0 linha1) 'O) (equal (nth 1 linha1) 'O) (equal (nth 2 linha1) 'O)))
		(ganhador (nth 0 linha1))
	)

	; segunda linha completa
	(if (or (and (equal (nth 0 linha2) 'X) (equal (nth 1 linha2) 'X) (equal (nth 2 linha2) 'X))
			(and (equal (nth 0 linha2) 'O) (equal (nth 1 linha2) 'O) (equal (nth 2 linha2) 'O)))
		(ganhador (nth 0 linha2))
	)

	; terceira linha completa
	(if (or (and (equal (nth 0 linha3) 'X) (equal (nth 1 linha3) 'X) (equal (nth 2 linha3) 'X))
			(and (equal (nth 0 linha3) 'O) (equal (nth 1 linha3) 'O) (equal (nth 2 linha3) 'O)))
		(ganhador (nth 0 linha3))
	)

	; primeira coluna completa
	(if (or (and (equal (nth 0 linha1) 'X) (equal (nth 0 linha2) 'X) (equal (nth 0 linha3) 'X))
			(and (equal (nth 0 linha1) 'O) (equal (nth 0 linha2) 'O) (equal (nth 0 linha3) 'O)))
		(ganhador (nth 0 linha1))
	)

	; segunda coluna completa
	(if (or (and (equal (nth 1 linha1) 'X) (equal (nth 1 linha2) 'X) (equal (nth 1 linha3) 'X))
			(and (equal (nth 1 linha1) 'O) (equal (nth 1 linha2) 'O) (equal (nth 1 linha3) 'O)))
		(ganhador (nth 1 linha1))
	)

	; terceira coluna completa
	(if (or (and (equal (nth 2 linha1) 'X) (equal (nth 2 linha2) 'X) (equal (nth 2 linha3) 'X))
			(and (equal (nth 2 linha1) 'O) (equal (nth 2 linha2) 'O) (equal (nth 2 linha3) 'O)))
		(ganhador (nth 2 linha1))
	)

	; diagonal principal completa
	(if (or (and (equal (nth 0 linha1) 'X) (equal (nth 1 linha2) 'X) (equal (nth 2 linha3) 'X))
			(and (equal (nth 0 linha1) 'O) (equal (nth 1 linha2) 'O) (equal (nth 2 linha3) 'O)))
		(ganhador (nth 0 linha1))
	)

	; diagonal secundária completa
	(if (or (and (equal (nth 0 linha3) 'X) (equal (nth 1 linha2) 'X) (equal (nth 2 linha1) 'X))
			(and (equal (nth 0 linha3) 'O) (equal (nth 1 linha2) 'O) (equal (nth 2 linha1) 'O)))
		(ganhador (nth 0 linha3))
	)

	; contador para as jogadas do bot (jogará em "rounds" pares)
	(setf (nth 0 round) (+ (nth 0 round) 1))

	; verificando o máximo divisor comum para saber se é par (não achei de jeito nenhum o operador de módulo que retornasse um número decimal)
	(if (= (gcd (nth 0 round) 2) 2)
		(pcJoga linha1 linha2 linha3)
	)

	(game linha1 linha2 linha3)
)

; função para formatar a tela e mostrar quem ganhou
(defun ganhador (ganhou)
	(format t "~% ~S | ~S | ~S ~%---|---|---~% ~S | ~S | ~S ~%---|---|---~% ~S | ~S | ~S ~%"
		(nth 0 linha1) (nth 1 linha1) (nth 2 linha1)
		(nth 0 linha2) (nth 1 linha2) (nth 2 linha2)
		(nth 0 linha3) (nth 1 linha3) (nth 2 linha3)
	)
	(if (equal ganhou 'X) 
		(format t "~%Parabens, voce ganhou! XD")
	)
	(if (equal ganhou 'O) 
		(format t "~%Que pena, nao foi desta vez :(")
	)
	(quit)
)

; chamada para iniciar o jogo
(game linha1 linha2 linha3)