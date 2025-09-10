defmodule KeywordList do
  # 1. Crear una keyword list que represente un producto con claves :nombre, :precio, :stock.
  def crear_producto do
    producto = [nombre: "Camisa", precio: 40000, stock: 12]
    IO.puts("Producto: #{inspect(producto)}")
  end

  # 2. Obtener el valor de :precio en la keyword list
  def obtener_precio do
    producto = [nombre: "Camisa", precio: 40000, stock: 12]
    IO.puts("Precio: #{producto[:precio]}")
    IO.puts("Precio: #{Keyword.get(producto, :precio)}")
  end

  # 3. Agregar una nueva clave :color con valor "Azul"
  def agregar_color do
    producto = [nombre: "Camisa", precio: 40000, stock: 12]
    producto_actualizado = Keyword.put(producto, :color, "Azul")
    IO.puts("Producto actualizado: #{inspect(producto_actualizado)}")
  end

  # 4. Obtener todos los valores de :modo
  def obtener_modos do
    modos = [modo: :rapido, modo: :seguro, tiempo: 15]
    IO.puts("Modos: #{inspect(Keyword.get_values(modos, :modo))}")
  end

  # 5. Iterar sobre la keyword list e imprimir cada clave y valor
  def iterar_lista do
    lista = [usuario: "Carlos", activo: true, rol: "admin"]
    Enum.each(lista, fn {clave, valor} -> IO.puts("#{clave}: #{valor}") end)
  end
end
