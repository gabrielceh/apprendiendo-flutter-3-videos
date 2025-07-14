# DataSource

## ¿Qué es?

Es la fuente de datos desde la cual la aplicación obtiene o persiste información. Esta carpeta vive normalmente en la capa de infraestructura o de datos (Data Layer) y su propósito principal es implementar cómo se obtienen los datos, ya sea desde una API, base de datos local, almacenamiento seguro, archivos, etc.

## ¿Qué contiene normalmente la carpeta datasource?

- Implementaciones concretas de interfaces definidas en capas superiores (por ejemplo, los repositorios).

- Servicios externos como:

  - APIs REST

  - Firebase

  - SQLite, Hive, SharedPreferences (en Flutter)

  - File system, sensores, etc.

## 🧱 Ejemplo de estructura con datasource en Dart (Flutter):

```mathematica
lib/
├── core/
├── data/
│   ├── datasources/
│   │   ├── user_remote_datasource.dart
│   │   ├── user_local_datasource.dart
│   ├── models/
│   ├── repositories/
│   │   └── user_repository_impl.dart
├── domain/
│   ├── entities/
│   ├── repositories/
│   │   └── user_repository.dart
│   ├── usecases/
├── presentation/

```

## 🧠 ¿Cómo se relaciona con las demás capas?

El datasource implementa interfaces (repositorios) definidas en la capa domain.

La lógica de dominio accede a datos a través de abstracciones (UserRepository, por ejemplo), sin saber si vienen de un servidor o de una base de datos.

El datasource no contiene lógica de negocio, solo maneja acceso y conversión de datos.

## 💡 ¿Por qué es útil?

Permite cambiar la fuente de datos sin afectar la lógica de negocio.

Facilita los tests unitarios, ya que puedes mockear las interfaces sin necesidad de conectarte a servicios reales.

Promueve la separación de responsabilidades: el dominio no debería preocuparse por detalles de red o almacenamiento.
