defmodule Util do #Modulo Util

  def mostrar_mensaje(mensaje) do
    mensaje
    |> IO.puts()
  end

  def pedir_informacion() do
    IO.gets("Ingrese su nombre: ")
    |> String.trim()
  end

end
