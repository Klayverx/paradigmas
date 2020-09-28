(defun tri-retan (a b c)
	
	; colocando os lados em uma lista
	(setq lados (list a b c))

	; ordenando os lados do maior para o menor
	(setq ladosOrdenados (sort lados #'>))

	; extraindo o lado maior
	(setq ladoMaior (car ladosOrdenados))

	; extraindo os lados menores
	(setq ladosMenores (cdr ladosOrdenados))
	(setq lado1 (nth 0 ladosMenores))
	(setq lado2 (nth 1 ladosMenores))

	; fazendo o quadrados dos lados (menores e maior)
	(setq somaQuadrados 
		(+ (* lado1 lado1) (* lado2 lado2))
	)
	(setq quadradoMaior (* ladoMaior ladoMaior))

	; calculando os dois %
	(setq doisPorcento (* quadradoMaior 0.02))

	; verificando a condição dos dois %
	(setq tNil 
		(if (< (abs (- somaQuadrados quadradoMaior)) doisPorcento)
			t 
			nil
		)
	)

	(print tNil)
)