defmodule Recursividad do
  def matryoshka_recursiva(n) do
    if n == 0 do #Caso Base
      #Codigo
      IO.puts("No hay mas muñecas para abrir.")
    else
      IO.puts("Se abrio la muñeca número #{n}.")
      matryoshka_recursiva(n-1) #Llama Recursivo
      IO.puts("Se cerro la muñeca número #{n}.")
    end
  end

  #Directa - Lineal - No de Cola
  #Caso Base
  def matryoshka_recursiva_clausula(0), do: IO.puts("No hay mas muñecas para abrir.")

  #Caso Recursivo
  def matryoshka_recursiva_clausula(n) do
      IO.puts("Se abrio la muñeca número #{n}.")
      matryoshka_recursiva_clausula(n-1) #Llama Recursivo
      IO.puts("Se cerro la muñeca número #{n}.")
  end


  def main do
    # matryoshka_recursiva(5)
    matryoshka_recursiva_clausula(5)
  end
end

Recursividad.main()
