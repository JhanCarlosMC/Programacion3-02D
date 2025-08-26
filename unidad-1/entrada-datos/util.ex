defmodule Util do
  def show_message(message) do
    message
    |> IO.puts()
  end

  def input(message, :string) do #Clausula
    message
    |> IO.gets()
    |> String.trim()
  end

  def input(message, :integer) do #Clausula
    message
    |> input(:string)
    |> String.to_integer()
  end

  def input(message, :float) do #Clausula
    message
    |> input(:string)
    |> String.to_float()
  end
end
