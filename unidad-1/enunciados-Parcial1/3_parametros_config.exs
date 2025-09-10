defmodule ParametrosDeConfiguracion do
  # 1. Un programa recibe configuraciones como una keyword list [modo: :rapido, intentos: 3, usuario: "admin"].
  def configuracion_inicial do
    configuracion = [modo: :rapido, intentos: 3, usuario: "admin"]
    IO.puts("Configuración: #{inspect(configuracion)}")
  end

  # 2. Agregar una clave :activo con valor true.
  def agregar_activo(configuracion) do
    configuracion_actualizada = Keyword.put(configuracion, :activo, true)
    IO.puts("Configuración actualizada: #{inspect(configuracion_actualizada)}")
  end

  # 3. Convertir la keyword list en un mapa.
  def convertir_a_mapa(configuracion) do
    mapa = Enum.into(configuracion, %{})
    IO.puts("Configuración como mapa: #{inspect(mapa)}")
  end

  # 4. Verificar con Map.has_key?/2 si existe la clave :usuario.
  def verificar_usuario(configuracion) do
    mapa = Enum.into(configuracion, %{})
    if Map.has_key?(mapa, :usuario) do
      IO.puts("La clave :usuario existe")
    else
      IO.puts("La clave :usuario no existe")
    end
  end

  # 5. Usar Enum.each/2 para imprimir las claves y valores del mapa final.
  def imprimir_mapa(configuracion) do
    mapa = Enum.into(configuracion, %{})
    Enum.each(mapa, fn {clave, valor} -> IO.puts("#{clave}: #{valor}") end)
  end
end
