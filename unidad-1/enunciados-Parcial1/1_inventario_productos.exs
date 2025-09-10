defmodule InventarioProductos do
  # 1. Crear una lista de productos, donde cada producto sea un mapa con las claves :nombre, :precio y :stock.
  def crear_productos do
    productos = [
      %{nombre: "Camisa", precio: 40000, stock: 12},
      %{nombre: "Pantalón", precio: 50000, stock: 5},
      %{nombre: "Zapatos", precio: 80000, stock: 10}
    ]
    IO.puts("Productos: #{inspect(productos)}")
  end

  # 2. Agregar tres productos distintos
  def agregar_productos(productos) do
    productos = productos ++ [
      %{nombre: "Zapatos", precio: 80000, stock: 10},
      %{nombre: "Chaqueta", precio: 100000, stock: 7}
    ]
    IO.puts("Productos actualizados: #{inspect(productos)}")
  end

  # 3. Usar Enum.map/2 para aumentar en un 10% el precio de todos los productos
  def aumentar_precio(productos) do
    productos_actualizados = Enum.map(productos, fn producto ->
      %{producto | precio: producto.precio * 1.1}
    end)
    IO.puts("Productos con precios aumentados: #{inspect(productos_actualizados)}")
  end

  # 4. Mostrar solo los nombres de los productos cuyo :stock sea mayor a 5
  def productos_stock_mayor_a_5(productos) do
    productos_filtrados = Enum.filter(productos, fn producto -> producto[:stock] > 5 end)
    nombres = Enum.map(productos_filtrados, fn producto -> producto[:nombre] end)
    IO.puts("Productos con stock mayor a 5: #{inspect(nombres)}")
  end
end
