(defun possui (num lista) 
	; variável de controle para saber se possui
	(setq contem 0)

	; caso já tenha percorrido todos os elementos ou se a lista repassada for vazia
	(if (equal lista nil)
		(progn
			; retornando nil (lista estará vazia)
			(print lista)
			(quit)
		)
	)

	; verificando o primeiro elemento da lista
	(if (= num (car lista))
		(setq contem 1)
		; retornando recursivamente o mesmo número e a mesma lista sem o primeiro elemento
		(possui num (cdr lista))
	)

	; verificando se contem
	(setq contem 
		(if (> contem 0)
			t
			nil
		)
	)

	(print contem)
)