defmodule Tuplas do
  # 1. Crear tupla y mostrar segundo elemento
  def mostrar_tupla do
    tupla = {100, "Elixir", :atom}
    IO.puts("Segundo elemento: #{elem(tupla, 1)}")
  end

  # 2. Modificar valor de tupla
  def modificar_tupla do
    tupla = {:ok, "Exitoso", 200}
    nueva_tupla = put_elem(tupla, 2, 404)
    IO.puts("Tupla modificada: #{inspect(nueva_tupla)}")
  end

  # 3. Función para división con tupla de resultado
  def dividir(a, b) do
    if b != 0 do
      {:ok, a / b}
    else
      {:error, "División por cero"}
    end
  end
  def dividir_clausula(a, 0), do: {:error, "División por cero"}
  def dividir_clausula(a, b), do: {:ok, a / b}

  # 4. Extraer valores con pattern matching
  def extraer_tupla do
    tupla = {:usuario, "Ana", 25}
    {:usuario, nombre, edad} = tupla
    IO.puts("Nombre: #{nombre}, Edad: #{edad}")
  end

  # 5. Convertir tupla a lista y recorrer
  def recorrer_tupla do
    tupla = {:a, :b, :c}
    lista = Tuple.to_list(tupla)
    Enum.each(lista, fn elem -> IO.puts(elem) end)
  end
end
