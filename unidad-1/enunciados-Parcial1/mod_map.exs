defmodule Mapas do
  # 1. Crear mapa y mostrar valor
  def mostrar_mapa do
    mapa = %{nombre: "Juan", edad: 30, ciudad: "Medellín"}
    IO.puts("Ciudad: #{mapa[:ciudad]}")
    IO.puts("Ciudad: #{Map.get(mapa, :ciudad)}")
  end

  # 2. Usar Map.put/3 para agregar clave
  def agregar_clave do
    mapa = %{nombre: "Juan", edad: 30}
    mapa_actualizado = Map.put(mapa, :profesion, "Ingeniero")
    IO.puts("Mapa actualizado: #{inspect(mapa_actualizado)}")
  end

  # 3. Actualizar valor de clave
  def actualizar_clave do
    mapa = %{nombre: "Ana", edad: 25}
    mapa_actualizado = Map.put(mapa, :edad, 26)
    IO.puts("Mapa actualizado: #{inspect(mapa_actualizado)}")
  end

  # 4. Eliminar clave
  def eliminar_clave do
    mapa = %{nombre: "Luis", edad: 30, ciudad: "Cali"}
    mapa_actualizado = Map.delete(mapa, :ciudad)
    IO.puts("Mapa sin ciudad: #{inspect(mapa_actualizado)}")
  end

  # 5. Recorrer mapa e imprimir
  def recorrer_mapa do
    mapa = %{a: 1, b: 2, c: 3}
    Enum.each(mapa, fn {clave, valor} -> IO.puts("#{clave}: #{valor}") end)
  end
end
