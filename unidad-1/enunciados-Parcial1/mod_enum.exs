defmodule EnumExercises do
  # 1. Usar Enum.each/2 para imprimir cada número de la lista
  def imprimir_lista do
    Enum.each([1, 2, 3, 4, 5], fn x -> IO.puts(x) end)
  end

  # 2. Aplicar Enum.map/2 sobre [1, 2, 3, 4] para obtener una nueva lista con sus cuadrados
  def cuadrados_lista do
    lista = [1, 2, 3, 4]
    cuadrados = Enum.map(lista, fn x -> x * x end)
    IO.puts("Cuadrados: #{inspect(cuadrados)}")
  end

  # 3. Usar Enum.filter/2 para obtener solo los números pares
  def numeros_pares do
    lista = [5, 6, 7, 8, 9, 10]
    pares = Enum.filter(lista, fn x -> rem(x, 2) == 0 end)
    IO.puts("Pares: #{inspect(pares)}")
  end

  # 4. Calcular la suma de los elementos en [10, 20, 30] usando Enum.reduce/2
  def suma_lista do
    suma = Enum.reduce([10, 20, 30], 0, fn x, acc -> x + acc end)
    IO.puts("Suma total: #{suma}")
  end

  # 5. Usar Enum.group_by/2 para agrupar la lista de personas por edad
  def agrupar_personas do
    personas = [%{nombre: "Ana", edad: 20}, %{nombre: "Juan", edad: 25}, %{nombre: "Luis", edad: 20}]
    agrupadas = Enum.group_by(personas, fn persona -> persona[:edad] end)
    IO.puts("Personas agrupadas: #{inspect(agrupadas)}")
  end
end
