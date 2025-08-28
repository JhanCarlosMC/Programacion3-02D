defmodule UtilTest do
  # Clausula
  def input(message, :string)do
    message
    |> IO.gets()
    |> String.trim()
  end

  # Clausula
  def input(message, :float) do
    try do
          message
    |> input(:string)
    |> String.to_float()
    rescue
      ArgumentError ->
        IO.puts(:error, "Error: El valor ingresado no es un número válido.")

        message
        |> input(:float)
    end
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
      |> input(:integer)
    end
  end

end
