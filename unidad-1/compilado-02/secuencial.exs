defmodule Test do

  def run_tests do
    Util.pedir_informacion()
    |> Util.mostrar_mensaje()
  end

end

Test.run_tests()
