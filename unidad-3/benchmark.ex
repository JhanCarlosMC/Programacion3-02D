defmodule Benchmark do
  @moduledoc """
  Módulo para ayudar a comparar algoritmos
  - Autor: Julián E. Gutiérrez P.
  - Fecha: Septiembre del 2024
  - Licencia: GNU GPL v3
  """


  @doc """
  Función para calcular el speedup de dos algoritmos por medio de sus tiempos de ejecución.

  ## Parámetros

    - tiempo1: Tiempo de ejecución del primer algoritmo.
    - tiempo2: Tiempo de ejecución del segundo algoritmo.

  ## Retorna

    La cantidad de veces que el algoritmo1 es más rápido que el algoritmo2 (speepup).

  ## Ejemplo

    iex> Benchmark.calcular_speedup(10, 20)
    2
  """
  def calcular_speedup(tiempo1, tiempo2), do: tiempo2 / tiempo1

  @doc """
  Función para determinar el tiempo de ejecución de un algoritmo.

  ## Parámetros

    - modulo: Nombre del módulo al que pertenece la función.
    - funcion: Nombre de la función (como un átomo) necesario para la función de Erlang (apply)
    - argumentos: La lista de los argumentos que la función necesita, un elemento por cada parámetro de la función.

  ## Retorna
    Una tupla con el tiempo de ejecución del algoritmo con la respectiva salida de esa ejecución en microsegundos.

  ## Ejemplo

    iex> Benchmark.determinar_tiempo_ejecucion({Recursividad, :determinar_par?, [9000]})
    177

  """
  def determinar_tiempo_ejecucion({modulo, funcion, argumentos}) do
    tiempo_inicial = System.monotonic_time()
    apply(modulo, funcion, argumentos)
    tiempo_final = System.monotonic_time()

    duracion =
      System.convert_time_unit(
        tiempo_final - tiempo_inicial,
        :native, :microsecond
      )

    duracion
  end

  @doc """
  Función para generar una mensaje con la información de la comparación.

  ## Parámetros

    - tiempo1: Tiempo en microsegundos del primer algoritmo.
    - tiempo2: Tiempo en microsegundos del segundo algoritmo.

  ## Ejemplo

    iex> Benchmark.generar_mensaje(177, 99)
    1.78

  """
  def generar_mensaje(tiempo1, tiempo2) do
    speepup = calcular_speedup(tiempo1, tiempo2) |> Float.round(2)

    "Tiempos: #{tiempo1} y #{tiempo2} microsegundos, " <>
      "el primer algoritmo es #{speepup} veces más rápido que el segundo.\n"
  end


  def generar_grafica_html(datos) do


    html_base =
    """
      <html></html>
      <head>
        <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
        <script type="text/javascript">
          google.charts.load('current', {'packages':['bar']});
          google.charts.setOnLoadCallback(drawChart);

          function drawChart() {
            var data = google.visualization.arrayToDataTable([

            <TITULOS y DATOS>
      ]);

            var options = {
              chart: {
                title: 'Comparación de algoritmos',
                subtitle: 'Pruebas vs Tiempo de ejecución',
              }
            };

            var chart = new google.charts.Bar(document.getElementById('columnchart_material'));

            chart.draw(data, google.charts.Bar.convertOptions(options));
          }
        </script>
      </head>
      <body>
        <!--  Fuente de Google Charts
              https://developers.google.com/chart/interactive/docs/gallery/columnchart#creating-material-column-charts
          -->
        <div id="columnchart_material" style="width: 800px; height: 500px;"></div>
      </body>
    </html>
    """

    ## FALTA LA PARTE DE LOS TÍTULO Y LOS DATOS (<TITULOS y DATOS>)
     # Ejemplo de la página original de Google Charts
     # https://developers.google.com/chart/interactive/docs/gallery/columnchart#creating-material-column-charts

     # ['Year', 'Sales', 'Expenses', 'Profit'],
     # ['2014', 1000, 400, 200],
     # ['2015', 1170, 460, 250],
     # ['2016', 660, 1120, 300],
     # ['2017', 1030, 540, 350]

    html_final = String.replace(html_base, "<TITULOS y DATOS>", datos)

    html_final
  end
end
