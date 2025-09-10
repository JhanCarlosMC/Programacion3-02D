defmodule SistemaDeReservas do
  # 1. Se tiene una lista de reservas, donde cada reserva es un mapa con claves :cliente, :habitacion y :dias.
  def reservas_iniciales do
    reservas = [
      %{cliente: "Ana", habitacion: "101", dias: 3},
      %{cliente: "Juan", habitacion: "102", dias: 5},
      %{cliente: "Luis", habitacion: "103", dias: 2}
    ]
    IO.puts("Reservas: #{inspect(reservas)}")
  end

  # 2. Crear tres reservas.
  def crear_reservas(reservas) do

    IO.puts("Reservas creadas: #{inspect(reservas)}")
  end

  # 3. Usar Enum.reduce/3 para calcular el total de días reservados.
  def calcular_total_dias(reservas) do

    total_dias = Enum.reduce(reservas, 0, fn reserva, acc -> acc + reserva[:dias] end)
    IO.puts("Total de días reservados: #{total_dias}")
  end

  # 4. Usar Enum.find/2 para obtener la primera reserva que tenga más de 5 días.
  def reserva_mas_de_5_dias(reservas) do

    reserva = Enum.find(reservas, fn reserva -> reserva[:dias] > 5 end)
    IO.puts("Reserva con más de 5 días: #{inspect(reserva)}")
  end

  # 5. Convertir la primera reserva en una tupla y mostrar el nombre del cliente.
  def convertir_reserva_a_tupla(reservas) do

    reserva = Enum.at(reservas, 0)
    tupla = {reserva[:cliente], reserva[:habitacion], reserva[:dias]}
    IO.puts("Nombre del cliente: #{elem(tupla, 0)}")
  end
end
