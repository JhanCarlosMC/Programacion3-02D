defmodule PositivoNegativo do
  def analizar(num) when is_integer(num) do
    if num >= 0 do
      "#{num} es positivo."
    else
      "#{num} es negativo."
    end
  end

  def run_secuencial(list) do
    Enum.each(list, fn num ->
      # :timer.sleep(2000)

      analizar(num)
      |> IO.puts()
    end)
  end

  def run_concurrente(list) do

    tareas =
      Enum.map(list, fn num ->
        Task.async(fn -> analizar(num) end)
      end)

    # respuestas =
    #   Enum.map(tareas, fn tarea ->
    #     Task.await(tarea)
    #   end)

    respuestas2 = Task.await_many(tareas)

    Enum.each(respuestas2, fn respuesta ->
      IO.puts(respuesta)
    end)

  end

  def run_benchmark(list) do
    timeResponse = Benchmark.determinar_tiempo_ejecucion(
        {__MODULE__, :run_secuencial, [list]}
      )
    IO.puts("Tiempo de ejecución secuencial: #{timeResponse} microsegundos")

    timeResponse2 = Benchmark.determinar_tiempo_ejecucion(
        {__MODULE__, :run_concurrente, [list]}
      )

    IO.puts("Tiempo de ejecución concurrente: #{timeResponse2} microsegundos")

  end

end

list_numeros = [10, -5, 0, 23, -42, 7, -1]

# PositivoNegativo.run_secuencial(list_numeros)
PositivoNegativo.run_benchmark(list_numeros)
