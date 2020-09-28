--[[
  *Suggestion*
  Você pode rodar este código no site:
  https://repl.it/repls/DimpledZanyNotifications#main.lua
]]--

--variável de controle para repetição do processo
continue = 1
while ( continue == 1 ) do

  --leitura do tipo de operação
  print('Olá, digite [1] fazer operações ou [2] para saber se um número é primo, ímpar ou par!\n')
  op = io.read("*n")

  --caso para efetuar as operações
  if( op == 1 ) then

    --limpando o terminal
    os.execute("clear")

    --leitura do primeiro número da operação
    print("Digite o primeiro número: (dividendo/base/radicando)")
    num1 = io.read("*n")

    --leitura do segundo número da operação
    print("\nDigite o segundo número: (divisor/expoente/radical)")
    num2 = io.read("*n")

    --operações (soma/subtração/divisão/radiciação/potenciação)
    soma = num1 + num2
    subt = num1 - num2
    div = num1 / num2
    radi = num2 ^ (1/num1)
    expo = num1 ^ num2

    --mostragem dos resultados das operações
    os.execute("clear")
    print("Primeiro número: ", num1)
    print("Segundo número: ", num2, "\n")
    
    print(num1, "+", num2, "=", soma)

    print(num1, "-", num2, "=", subt)

    --verificação do divisor igual a 0
    if( num2 == 0 ) then
      print("A divisão entre ", num1, "e ", num2, "não existe!")
    else
      print(num1, "/", num2, "=", div)
    end

    print("Radicando ", num1, "e o radical ", num2, "=", radi)

    print(num1, "^", num2, "=", expo)


  --caso para efetuar a verificação (primo/ímpar/par)
  elseif ( op == 2 ) then

    os.execute("clear")

    --leitura do número a ser verificado
    print("Digite o número desejado: ")
    num = io.read("*n")

    --variáveis para o contador para saber se o número é primo
    i = 1
    cont = 0

    --laço para saber a quantidade de divisões exatas
    while( i <= num ) do
      if ( num % i == 0 ) then
        cont = cont + 1
      end
      i =  i + 1
    end

    --verificando se o número é divisível apenas por 1 e ele mesmo
    if( cont == 2 or num < 1 ) then
      print("\nEste número é primo!")
    else
      print("\nEste número não é primo!")
    end

    --verificando se o número é impar ou par
    if( num % 2 == 0 ) then
      print("Este número é par!")
    else
      print("Este número é ímpar!")
    end

  end

  --caso queira fazer tudo novamente
  print("\n\nDeseja repetir?\n[1] - Sim\n[2] - Não\n")
  continue = io.read("*n")

  os.execute("clear")

  if(continue ~= 1) then
    print("Obrigado!")
    break
  end

end