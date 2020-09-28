;definindo a função que retorna a intercecção
(defun interseccao (lista1 lista2)
	
	;criando a lista para os elementos repetidos
	(setq repetidos nil)

	;verificando se o elemento possui nas duas listas
	(dotimes (i (list-length lista1))
		(if (member (nth i lista1) lista2)
			;adicionando o elemento repetido na lista de intersecção
			(push (nth i lista1) repetidos)
			nil
		)
	)

	(print repetidos)
)