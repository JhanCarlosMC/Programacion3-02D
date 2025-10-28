#spawn -> spawn/1 spawn/3
#No retorna respuesta, solo crea un proceso y devuelve su PID
# spawn(fun)
result = spawn(fn->
  IO.puts("Hola spawn/1")
  # "Hola spawn/1"
end)
IO.puts("PID del proceso spawn/1: #{inspect(result)}")

defmodule Concurrencia do

  def saludo(msg)do
    msg |> IO.puts()
  end
end

# spawn(Module, :function_name, [arg1, arg2])
result2 = spawn(Concurrencia, :saludo, ["Hola spawn/3"])
IO.puts("PID del proceso spawn/3: #{inspect(result2)}")

#-------------------- Task --------------------
#Task -> Permite crear procesos que retornan valores

#Task.async() -> Task.async/1 Task.async/3
#Crea un proceso y retorna un struct Task
#Task.async(fun)

task = Task.async(fn ->
  "Hola Task.async/1"
end)

# IO.puts("Struct Task.async/1: #{inspect(resltTask)}")

#Task.async(Module, :function_name, [arg1, arg2])

#Task.await() -> Task.await/2
#Espera a que el proceso termine y retorna el valor
#Task.await(task, timeout \\ 5000)
resp = Task.await(task)
IO.puts("Respuesta de Task.await/2: #{resp}")
