defmodule Venta do
  defstruct cliente: %Cliente{}, detalles: []

  def calcular_total(%Venta{detalles: detalles}) do

    Enum.reduce(detalles, 0, fn detalle, acc ->
      acc + Detalle.calcular_subtotal(detalle)
    end)
  end

  def crear(cliente, detalles) do
    %Venta{cliente: cliente, detalles: detalles}
  end
end
