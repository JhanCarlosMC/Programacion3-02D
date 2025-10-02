defmodule Cliente do
  defstruct nombre: "", cedula: ""

  def crear(nombre, cedula)  do
    %Cliente{nombre: nombre, cedula: cedula}
  end

  def escribir_csv(list_clientes, nombre_archivo) do
    headers = "Nombre, Cedula \n"

    contenido =
      Enum.map(list_clientes,
        fn %Cliente{nombre: nombre, cedula: cedula} ->
        "#{nombre}, #{cedula}\n"
      end)
      |> Enum.join()

    File.write(nombre_archivo, headers <> contenido)
  end
end
