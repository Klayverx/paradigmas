; definindo a função palindromop
(defun palindromop (lista)

	; criando a lista invertida
	(setq listaInvertida (reverse lista))

	(setq inverso 
		; verificando se é palíndromo (lista invertida com a respassada)
		(if (equal listaInvertida lista)
			t
			nil
		)
	)
	(print inverso)
)