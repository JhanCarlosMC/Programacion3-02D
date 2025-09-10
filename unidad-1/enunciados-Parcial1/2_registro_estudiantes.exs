defmodule RegistroEstudiantes do
  # 1. Representar a los estudiantes de un curso en una lista de tuplas de la forma {"Nombre", edad, nota}.
  def estudiantes do
    estudiantes = [
      {"Ana", 20, 4.5},
      {"Juan", 25, 3.0},
      {"Luis", 30, 2.8}
    ]
    IO.puts("Estudiantes: #{inspect(estudiantes)}")
  end

  # 2. Usar Enum.filter/2 para obtener los estudiantes con nota mayor o igual a 3.0.
  def estudiantes_aprobados(estudiantes) do

    aprobados = Enum.filter(estudiantes, fn {_nombre, _edad, nota} -> nota >= 3.0 end)
    IO.puts("Estudiantes aprobados: #{inspect(aprobados)}")
  end

  # 3. Convertir la lista de tuplas en una lista de mapas con claves :nombre, :edad, :nota.
  def convertir_a_mapas(estudiantes) do

    mapas = Enum.map(estudiantes, fn {nombre, edad, nota} -> %{nombre: nombre, edad: edad, nota: nota} end)
    IO.puts("Estudiantes como mapas: #{inspect(mapas)}")
  end

  # 4. Agrupar a los estudiantes por rango de edad.
  def agrupar_por_edad(estudiantes) do

    agrupados = Enum.group_by(estudiantes, fn {_nombre, edad, _nota} ->
      cond do
        edad < 20 -> :menores_de_20
        edad >= 20 and edad <= 25 -> :entre_20_y_25
        true -> :mayores_de_25
      end
    end)
    IO.puts("Estudiantes agrupados por edad: #{inspect(agrupados)}")
  end
end
