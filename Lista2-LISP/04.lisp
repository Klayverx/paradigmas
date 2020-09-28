;criando a função que retorna a transposta
(defun transpoe (matriz)
	
	;capturando linhas e colunas da matriz original
	(setq linhas (array-dimension matriz 0))
	(setq colunas (array-dimension matriz 1))

	;criação da matriz transposta
	(setq matrizTransposta (make-array (list colunas linhas)))
	
	;manipulando os elementros para a transposta
	(dotimes (l (array-dimension matriz 0))
		(dotimes (c (array-dimension matriz 1))
			(setf (aref matrizTransposta c l) (aref matriz l c))
		)
	)

	;amostra da transposta e da original
	(print matrizTransposta)
	(print matriz)
)
