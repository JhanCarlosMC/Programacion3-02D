defmodule Main do
  def main() do
    Util.input_data("Enter your name:")
    |> Util.show_message()
  end
end

Main.main()
