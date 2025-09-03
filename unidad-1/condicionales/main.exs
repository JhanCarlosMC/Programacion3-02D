defmodule Main do
  def main do
    # Util.input("Ingrese su edad: ", :integer)
    # |> condicion_if()

    # Util.input("Ingrese la contraseña: ", :string)
    # |> condicion_unless()

    Util.input("Ingrese la nota (0 a 5): ", :float)
    |> condicion_cond()

  end

  # Un programa que reciba la edad de una persona
  # y muestre si es mayor de edad (18 años o más) o no.
  def condicion_if(edad) do
    if edad > 17 do
      Util.show_message("La persona es mayor de edad")
    else
      Util.show_message("La persona NO es mayor de edad.")
    end
  end

  # Un programa que reciba una contraseña
  # y muestre un mensaje de error a menos que la contraseña sea "1234".

  def condicion_unless(pass) do
    unless pass === "1234" do
      Util.show_message("ERROR")
    else
      Util.show_message("Correcto")
    end
  end

  #Un programa que reciba una nota (0 a 5) y muestre:
# "Excelente" si es mayor o igual a 4.5.
# "Aprobado" si está entre 3.0 y 4.4.
# "Reprobado" si es menor a 3.0.
def condicion_cond(nota) do
  cond do
    nota >= 4.5 and nota <= 5.0 ->
      Util.show_message("Excelente")
      Util.show_message("La mejor nota")
    nota >= 3.0 and nota < 4.5 ->
      Util.show_message("Aprobado")
    nota >= 0.0 and nota < 3.0 ->
      Util.show_message("Reprobado")
    true ->
      Util.show_message("Nota inválida")
  end
end

# Un programa que lea un carácter y
# muestre si es una vocal ("a", "e", "i", "o", "u") o una consonante.
def condicion_case(char) do
  case char do
    "a" -> Util.show_message("Vocal")
    "e" -> Util.show_message("Vocal")
    "i" -> Util.show_message("Vocal")
    "o" -> Util.show_message("Vocal")
    "u" -> Util.show_message("Vocal")
    _ -> Util.show_message("Consonante")
  end
end

end
Main.main()
