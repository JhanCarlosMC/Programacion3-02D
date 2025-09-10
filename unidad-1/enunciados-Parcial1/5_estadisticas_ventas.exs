defmodule EstadisticasDeVentas do
  # 1. Una tienda guarda sus ventas en una lista de mapas, cada uno con claves :producto y :monto.
  def ventas_iniciales do
    ventas = [
      %{producto: "Camisa", monto: 40000},
      %{producto: "Pantalón", monto: 50000},
      %{producto: "Zapatos", monto: 80000}
    ]
    IO.puts("Ventas: #{inspect(ventas)}")
  end

  # 2. Calcular con Enum.reduce/3 la suma total de las ventas.
  def calcular_total_ventas(ventas) do

    total_ventas = Enum.reduce(ventas, 0, fn venta, acc -> acc + venta[:monto] end)
    IO.puts("Suma total de ventas: #{total_ventas}")
  end

  # 3. Usar Enum.group_by/2 para agrupar las ventas por producto.
  def agrupar_ventas_por_producto(ventas) do

    ventas_agrupadas = Enum.group_by(ventas, fn venta -> venta[:producto] end)
    IO.puts("Ventas agrupadas por producto: #{inspect(ventas_agrupadas)}")
  end

  # 4. Convertir el mapa agrupado en una lista de tuplas {producto, lista_de_ventas}.
  def agrupar_ventas_lista(ventas) do

    ventas_agrupadas = Enum.group_by(ventas, fn venta -> venta[:producto] end)
    lista_de_tuplas = Enum.map(ventas_agrupadas, fn {producto, ventas} -> {producto, ventas} end)
    IO.puts("Ventas agrupadas como lista de tuplas: #{inspect(lista_de_tuplas)}")
  end

  # 5. Mostrar el producto con mayor número de ventas usando Enum.max_by/2.
  def producto_con_mayor_ventas(ventas) do

    producto_max_ventas = Enum.max_by(ventas, fn venta -> venta[:monto] end)
    IO.puts("Producto con mayor número de ventas: #{inspect(producto_max_ventas)}")
  end
end
