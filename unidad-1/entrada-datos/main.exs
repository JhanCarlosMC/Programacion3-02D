defmodule Main do
  def main do
    pedir_texto()
    pedir_numero()
    pedir_decimal()
  end

  def pedir_texto() do
    "Ingrese su nombre: "
    |> Util.input(:string)
    |> Util.show_message()
  end

  def pedir_numero() do
    x = Util.input("Ingrese un nùmero: ", :integer)

    # Interpolacion
    "El nùmero ingresado es entero: #{is_integer(x)}"
    |> Util.show_message()
  end

  def pedir_decimal() do
    x = Util.input("Ingrese un nùmero: ", :float)

    # Interpolacion
    "El nùmero ingresado es decimal: #{is_float(x)}"
    |> Util.show_message()
  end
end

Main.main()
