defmodule Suma do

  def suma_numeros(0) do #Caso Base
    0
  end
  def suma_numeros(n) do #Caso Recursivo
    n + suma_numeros(n - 1)
  end

  def suma_numeros2(0, cont) do
    cont
  end
  def suma_numeros2(n, cont) do
      suma_numeros2(n-1, cont + n)
  end

  def main do

    resultado = suma_numeros2(5, 0)
    IO.puts("La suma de los números del 1 al 5 es: #{resultado}")
  end


end
