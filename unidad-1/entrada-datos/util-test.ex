defmodule UtilTest do
  def input_data(data) do
    System.cmd("java", ["-cp", ".", "Mensaje", "input", data])
    |> elem(0)
    |> String.trim()
  end

  # Clausula
  # def input(message, x) when x == t do
  def input(message, :string)do
    System.cmd("java", ["-cp", ".", "Mensaje", "input", message])
    |> elem(0)
    |> String.trim()
  end
  # Clausula
  def input(message, :integer) do
    message
    |> input(:string)
    |> String.to_integer()
  end

  # Clausula
  def input(message, :float) do
    message
    |> input(:string)
    |> String.to_float()
  end

  #Guardas
  def input(message, type) when type == :integer do
    message
    |> input(:string)
    |> String.to_integer()
  end

  #Input con manejo de errores usando try-rescue
  def input(message, :integer) do
    try do
      message
      |> input(:string)
      |> String.to_integer()
    rescue
      ArgumentError ->
        IO.puts(:error, "Error: El valor ingresado no es un entero válido.")

      message
      |> input(:integer, :try)
    end
  end

end
