defmodule Detalle do
  defstruct producto: %Producto{}, cantidad: 0

  def calcular_subtotal(%Detalle{producto: producto, cantidad: cantidad}) do
    producto.precio * cantidad
  end

  def crear(producto, cantidad) do
    %Detalle{producto: producto, cantidad: cantidad}
  end
end
