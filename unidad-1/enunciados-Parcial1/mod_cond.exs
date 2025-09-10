defmodule Condicionales do
  # 1. if - Edad mayor de edad
  def mayor_de_edad(edad) do
    if edad >= 18 do
      IO.puts("Es mayor de edad")
    else
      IO.puts("No es mayor de edad")
    end
  end

  # 2. if - Número positivo
  def numero_positivo(num) do
    if num > 0 do
      IO.puts("Es positivo")
    else
      IO.puts("No es positivo")
    end
  end

  # 3. if - Verificación de saldo en cuenta bancaria
  def retiro(saldo, monto) do
    if saldo >= monto do
      IO.puts("Retiro aprobado. Nuevo saldo: #{saldo - monto}")
    else
      IO.puts("Fondos insuficientes")
    end
  end

  # 4. unless - Contraseña válida
  def verificar_contraseña(contraseña) do
    unless contraseña == "1234" do
      IO.puts("Contraseña incorrecta")
    end
  end

  # 5. unless - Número no cero
  def verificar_numero(num) do
    unless num == 0 do
      IO.puts("El número no es cero")
    end
  end

  # 6. unless - Repartidor con pedido en curso
  def asignar_pedido(pedido) do
    unless pedido do
      IO.puts("Pedido asignado")
    else
      IO.puts("No puede tomar un nuevo pedido hasta entregar el actual")
    end
  end

  # 7. cond - Nota de examen
  def clasificar_nota(nota) do
    cond do
      nota >= 4.5 -> IO.puts("Excelente")
      nota >= 3.0 -> IO.puts("Aprobado")
      true -> IO.puts("Reprobado")
    end
  end

  # 8. cond - Temperatura
  def clasificar_temperatura(temperatura) do
    cond do
      temperatura < 15 -> IO.puts("Frío")
      temperatura >= 15 and temperatura <= 25 -> IO.puts("Templado")
      true -> IO.puts("Caluroso")
    end
  end

  # 9. cond - Puntos de videojuego
  def puntos_jugador(nivel) do
    cond do
      nivel < 3 -> IO.puts("+10 puntos")
      nivel >= 3 and nivel <= 6 -> IO.puts("+20 puntos")
      true -> IO.puts("+50 puntos")
    end
  end

  # 10. case - Vocal o consonante
  def verificar_caracter(caracter) do
    case caracter do
      "a" -> IO.puts("Vocal")
      "e" -> IO.puts("Vocal")
      "i" -> IO.puts("Vocal")
      "o" -> IO.puts("Vocal")
      "u" -> IO.puts("Vocal")
      _ -> IO.puts("Consonante")
    end
  end

  # 11. case - División segura
  def dividir(a, b) do
    case b do
      0 -> IO.puts("Error: División por cero")
      _ ->
        cociente = div(a, b)
        residuo = rem(a, b)
        if residuo == 0 do
          IO.puts("Cociente: #{cociente}")
        else
          IO.puts("Cociente: #{cociente}, Residuo: #{residuo}")
        end
    end
  end

  # 12. case - Código de triage médico
  def clasificar_paciente(codigo) do
    case codigo do
      :rojo -> IO.puts("Atención inmediata")
      :amarillo -> IO.puts("Atención en menos de 30 minutos")
      :verde -> IO.puts("Atención en sala general")
      _ -> IO.puts("Código no válido")
    end
  end

  # 13. case - Punto en el plano cartesiano
  def verificar_punto({x, y}) do
    case {x, y} do
      {0, 0} -> IO.puts("Está en el origen")
      {0, _} -> IO.puts("Está sobre el eje Y")
      {_, 0} -> IO.puts("Está sobre el eje X")
      _ -> IO.puts("Está en el plano")
    end
  end
end
