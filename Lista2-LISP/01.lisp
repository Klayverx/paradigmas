;Criando estruturas
(defstruct modeloCarro
	marca
	designacao
	potencia
	cilindradas
	extras
)
;incluindo a estrutura modeloCarro na estrutura veiculo
(defstruct (veiculo (:include modeloCarro))
	matricula
	anoRegistro
)
;função que retorna a cilindrada do veículo
(defun veiculo-cilindrada 
	(veiculoInput) 
	(format t "O veiculo possui ~Dcm^3 de cilindrada!" 
		(veiculo-cilindradas veiculoInput))
)

;criando um veículo
(setq veiculo1 (make-veiculo 
	:matricula "12-34-AB"
	:anoRegistro 1900
	:marca "Rolls Royce"
	:designacao "Silver-Ghost"
	:potencia 300
	:cilindradas 20000
	:extras "Sem extras"
))

;chamada da função que retorna a cilindrada
(veiculo-cilindrada veiculo1)