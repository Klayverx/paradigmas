; comandos para limpar a tela
(ext:run-shell-command "cls")
(defun cls () (ext:run-shell-command "cls") )

; "variáveis" e lista para controles da aplicação
(setq precoTotal 0)
(setq precoParcial nil)
(setq quantidadeCompras nil)
(setq listaCompras nil)

; duas listas, para produto e para preço
(setq nomeProdutos (list 'Caderno 'Carregador 'Monitor 'Mouse 'Teclado))
(setq precoProdutos (list 25 32 325 78 319))

; menu com as opções
(defun menu () 
	; captura da opção do user
	(format t "~%Escolha uma opcao:~%[1] Buscar Produto~%[2] Listar produtos disponiveis~%[3] Fazer compras~%[4] Mostrar lista de compras~%[5] Finalizar compra~%")
	(setq op (read))

	(cond 
		; primeira opção
		((= op 1)
			(format t "~%Digite o nome do produto:~%")
	    	(setq nomeBuscar (read))
	    	(setq contem 0)

	    	(cls)

	    	; buscando o produto na lista de produtos disponíveis
	    	(dotimes (i (list-length nomeProdutos))
	    		(if (equal nomeBuscar (nth i nomeProdutos))
	    			(progn 
	    				(format t "~%Produto disponivel!~%~%Nome: ~S~%Preco: ~S~%~%" (nth i nomeProdutos) (nth i precoProdutos))
	    				(setq contem 1)
	    			)
	    		)
	    	)
	    	; caso o produto não esteja disponível
	    	(if (equal contem 0)
	    			(format t "~%O produto nao foi encontrado!~%")
	    	)

	    	(menu)
		)

		; segunda opção
		((= op 2)
			(cls)
			; amostra dos produtos disponíveis
			(format t "~%--- Produtos disponiveis ---~%~%")
			(dotimes (i (list-length nomeProdutos))
				(format t "Nome: ~S~%Preco: ~S~%~%" (nth i nomeProdutos) (nth i precoProdutos))
			)
			(menu)
		)

		; terceira opção
		((= op 3)
			; captura do produto e quantidade para a lista de compras
			(format t "~%Digite o nome do produto disponivel desejado: ")
			(setq produto (read))
			(format t "~%Digite a quantidade do produto escolhido: ")
			(setq quantidade (read))

			(push produto listaCompras)
			(push quantidade quantidadeCompras)

			(setq precoUnidade 0)

			; capturando o preço de um produto individual
			(dotimes (i (list-length nomeProdutos))
	    		(if (equal produto (nth i nomeProdutos))
	    			(setq precoUnidade (nth i precoProdutos))
	    		)
	    	)

			; atribuindo os valores para o preço parcial (quantidade * valor)
			(push (* quantidade precoUnidade) precoParcial)

			(cls)
			(menu)
		)

		; quarta opção
		((= op 4)
			(cls)
			; amostra da lista de compras em tempo real
			(format t "~%--- Lista de compras ---~%~%")

			(dotimes (i (list-length listaCompras))
				(format t "Nome: ~S~%Quantidade: ~S~%Valor Parcial: ~S~%~%" (nth i listaCompras) (nth i quantidadeCompras) (nth i precoParcial))
			)

			(menu)
		)

		; quinta opção
		((= op 5)
			(cls)

			; amostra final de todos os produtos escolhidos, mostrando nome, preço, valor parcial e total
			(format t "--- Lista das compras ---~%~%")
			(dotimes (i (list-length listaCompras))
				(format t "Nome: ~S~%Quantidade: ~S~%Valor Parcial: ~S~%~%" (nth i listaCompras) (nth i quantidadeCompras) (nth i precoParcial))
				(setq precoTotal (+ precoTotal (nth i precoParcial)))
			)

			(format t "Valor total: RS ~S~%" precoTotal)

			(quit)
		)

		; caso seja escolhida uma opção inválida do menu de opções
		((progn (cls) (format t "Opcao invalida!~%") (menu)))
	)
)

(menu)