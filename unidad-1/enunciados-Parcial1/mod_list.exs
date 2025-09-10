defmodule Listas do
  # 1. Crear lista y mostrar cabeza y cola
  def mostrar_lista do
    lista = ["Bogotá", "Medellín", "Cali", "Barranquilla", "Cartagena"]
    IO.puts("Cabeza: #{hd(lista)}")
    IO.puts("Cola: #{tl(lista)}")
  end

  # 2. Concatenar listas
  def concatenar_listas do
    lista1 = [1, 2, 3]
    lista2 = [4, 5, 6]
    IO.puts("Resultado: #{inspect(lista1 ++ lista2)}")
  end

  # 3. Restar elementos
  def restar_listas do
    lista1 = [10, 20, 30, 40, 50]
    lista2 = [20, 50]
    IO.puts("Resultado: #{inspect(lista1 -- lista2)}")
  end

  # 4. Multiplicar valores por 3
  def multiplicar_lista(lista) do
    nueva_lista = Enum.map(lista, fn x -> x * 3 end)
    IO.puts("Resultado: #{inspect(nueva_lista)}")
  end

  # 5. Desestructurar lista
  def mostrar_lista_desestructurada do
    lista = [100, 200, 300]
    [a, b, c] = lista
    IO.puts("Elemento 1: #{a}, Elemento 2: #{b}, Elemento 3: #{c}")
  end
end
