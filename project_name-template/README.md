#  Arquitectura del Proyecto

Este proyecto utiliza una **arquitectura modular por capas inspirada en _Ports & Adapters_ (también conocida como _Arquitectura Hexagonal_ o _Clean Architecture simplificada_)**, adaptada para aplicaciones **de consola** en Elixir.

El objetivo de esta estructura es mantener una **separación clara entre la lógica de negocio, la orquestación de procesos y la interacción con el entorno externo**, permitiendo escalabilidad, pruebas sencillas y bajo acoplamiento.

---

##  Principios generales

- **Domain (Dominio):** Contiene las entidades y reglas de negocio puras.  
- **Services (Servicios):** Define los casos de uso y coordina las operaciones del dominio.  
- **Adapters (Adaptadores):** Gestiona la entrada/salida (CLI, archivos, HTTP, etc.).  

 **Importante:**  
El dominio **no depende de ninguna otra capa**, mientras que las demás pueden depender de él.

---

## Estructura de carpetas

```
project_name/
    ├── domain/       # Reglas y entidades puras del negocio
    ├── services/     # Casos de uso, orquestación de procesos
    └── adapters/     # Entrada/salida, CLI, persistencia, red, etc.
```

---

## Dominio (`domain/`)

Esta capa representa el **núcleo del sistema**.  
Contiene **entidades**, **estructuras de datos (`structs`)** y **reglas de negocio puras** sin depender de entradas o salidas externas.

```elixir
# lib/project_name/domain/usuario.ex
defmodule ProjectName.Domain.Usuario do
  defstruct [:id, :nombre, :correo, :rol]

  def nuevo(id, nombre, correo, rol) do
    %__MODULE__{id: id, nombre: nombre, correo: correo, rol: rol}
  end
end

# lib/project_name/domain/validador_usuario.ex
defmodule ProjectName.Domain.ValidadorUsuario do
  def correo_valido?(correo), do: String.contains?(correo, "@")
end
```

 **Propósito:** Representar el negocio y sus reglas, sin depender de consola, archivos o bases de datos.

---

## Servicios (`services/`)

Esta capa define los **casos de uso** del sistema.  
Cada módulo orquesta las operaciones del dominio y utiliza adaptadores para interactuar con el entorno.

```elixir
# lib/project_name/services/gestion_usuarios.ex
defmodule ProjectName.Services.GestionUsuarios do
  alias ProjectName.Domain.{Usuario, ValidadorUsuario}
  alias ProjectName.Adapters.RepositorioArchivo

  def registrar_usuario(attrs) do
    if ValidadorUsuario.correo_valido?(attrs.correo) do
      usuario = Usuario.nuevo(attrs.id, attrs.nombre, attrs.correo, attrs.rol)
      RepositorioArchivo.guardar_usuario(usuario)
      {:ok, usuario}
    else
      {:error, "Correo inválido"}
    end
  end
end
```

 **Propósito:** Coordinar entidades del dominio y utilizar adaptadores concretos para ejecutar las operaciones.

---

## Adaptadores (`adapters/`)

Contiene los módulos encargados de **interactuar con el entorno externo**, como la consola, el sistema de archivos o servicios externos.

```elixir
# lib/project_name/adapters/cli.ex
defmodule ProjectName.Adapters.CLI do
  alias ProjectName.Services.GestionUsuarios

  def run(argv) do
    case argv do
      ["registrar", nombre, correo] ->
        {:ok, usuario} =
          GestionUsuarios.registrar_usuario(%{id: UUID.uuid4(), nombre: nombre, correo: correo, rol: "normal"})
        IO.puts("Usuario registrado: #{usuario.nombre}")

      _ ->
        IO.puts("Uso: ./project registrar <nombre> <correo>")
    end
  end
end
```

Otro ejemplo de adaptador para persistencia en archivo:

```elixir
# lib/project_name/adapters/repositorio_archivo.ex
defmodule ProjectName.Adapters.RepositorioArchivo do
  @archivo "usuarios.csv"

  def guardar_usuario(%{id: id, nombre: n, correo: c, rol: r}) do
    File.write!(@archivo, "#{id},#{n},#{c},#{r}\n", [:append])
  end
end
```

 **Propósito:** Conectar la lógica interna del sistema con el mundo real (I/O, persistencia, consola, etc.).

---

## Flujo entre capas

```
Adapters  →  Services  →  Domain
(afuera)       (medio)     (núcleo)
```

- `Adapters` **llaman a** los `Services`.
- `Services` **usan** las entidades y funciones del `Domain`.
- `Domain` **no depende** de nadie más.

---

##  Escalabilidad

Si el proyecto crece, la estructura puede ampliarse manteniendo la misma lógica:

```
project_name/
|── main.exs
├── domain/
│   ├── usuario/
│   ├── pedido/
│   └── producto/
├── services/
│   ├── gestion_usuarios.ex
│   ├── gestion_pedidos.ex
│   └── informes.ex
└── adapters/
    ├── cli/
    ├── repositorio_fs/
    └── notificador_email/
```

---

## Ventajas de esta arquitectura

- Lógica de negocio **independiente del entorno**.  
- Código más **fácil de probar y mantener**.  
- Permite **cambiar adaptadores** (por ejemplo, pasar de archivos a base de datos) sin afectar la lógica principal.  
- Facilita **extender** el sistema hacia nuevos canales (API, Web, CLI).  

---

## Opcional investigar - Ejecución como CLI (`escript`)

Para convertir el proyecto en un ejecutable de consola, agrega esta sección a tu `mix.exs`:

```elixir
def project do
  [
    app: :project_name,
    version: "0.1.0",
    escript: [main_module: ProjectName],
    deps: []
  ]
end
```

Y en el módulo raíz (`lib/project_name.ex`):

```elixir
defmodule ProjectName do
  def main(argv) do
    ProjectName.Adapters.CLI.run(argv)
  end
end
```

Luego ejecuta:

```bash
mix escript.build
./project_name registrar "Jhan" "jhan@correo.com"
```

---

**Conclusión:**  
Esta arquitectura modular proporciona una base sólida y flexible para proyectos de consola en Elixir, favoreciendo la claridad, la escalabilidad y la reutilización del código.
