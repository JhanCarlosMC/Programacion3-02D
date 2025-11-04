defmodule NodoCliente do

  @nodo_cliente :"cliente@192.168.137.239"
  @nodo_servidor :"servidor@192.168.137.1"
  @nombre_proceso :servicio_cadenas

  # Lista de mensajes a procesar
  @mensajes [
    {:mayusculas, "Juan"},
    {:mayusculas, "Ana"},
    {:minusculas, "Diana"},
    {&String.reverse/1, "Julián"},
    "Uniquindio", :fin
  ]

  def main() do
    IO.puts("SE INICIA EL CLIENTE")
    iniciar_nodo(@nodo_cliente)
    establecer_conexion(@nodo_servidor)
    |> iniciar_produccion()
  end

  defp iniciar_nodo(nombre) do
    Node.start(nombre)
    Node.set_cookie(:my_cookie)
  end

  defp establecer_conexion(nodo_remoto) do
    Node.connect(nodo_remoto)
  end

  defp iniciar_produccion(false), do: IO.puts("No se pudo conectar con el nodo servidor")

  defp iniciar_produccion(true) do
    enviar_mensajes()
    recibir_respuestas()
  end

  defp enviar_mensajes() do
    Enum.each(@mensajes, &enviar_mensaje/1)
  end

  defp enviar_mensaje(mensaje) do
    send({@nombre_proceso, @nodo_servidor}, {self(), mensaje})
  end

  defp recibir_respuestas() do
    receive do
      :fin -> :ok
      respuesta ->
        IO.puts("\t -> \"#{respuesta}\"")
        recibir_respuestas()
    end
  end
end

NodoCliente.main()
