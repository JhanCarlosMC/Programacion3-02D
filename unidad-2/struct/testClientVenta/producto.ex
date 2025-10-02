defmodule Producto do
  defstruct nombre: "", precio: 0.0

  def crear(nombre, precio) do
    %Producto{nombre: nombre, precio: precio}
  end
end
