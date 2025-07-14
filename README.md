# MIAPastas - Sistema de Gestión de Fábrica de Pastas

## 📋 Descripción del Proyecto

MIAPastas es un sistema integral de gestión desarrollado en Django para administrar una fábrica de pastas. El sistema abarca desde la gestión de recetas y producción hasta la administración de ventas, compras, stock y distribución.

## 🚀 Características Principales

### Gestión de Producción
- **Recetas**: Administración de recetas con ingredientes y cantidades
- **Lotes**: Control de producción por lotes con fechas de vencimiento
- **Productos Terminados**: Gestión de diferentes tipos de pasta (Fideo Amarillo, Verde, Negro)
- **Control de Stock**: Seguimiento de materias primas y productos terminados

### Gestión Comercial
- **Clientes**: Administración de clientes con datos de contacto y ubicación
- **Pedidos**: Gestión de pedidos de clientes (fijos, ocasionales, cambios)
- **Entregas**: Control de entregas con hojas de ruta
- **Facturación**: Sistema de facturación y cobros

### Gestión de Compras
- **Proveedores**: Administración de proveedores de materias primas
- **Pedidos a Proveedores**: Gestión de órdenes de compra
- **Insumos**: Control de materias primas y su stock

### Gestión de Distribución
- **Choferes**: Administración de conductores
- **Hojas de Ruta**: Planificación de rutas de entrega
- **Zonas y Ciudades**: Organización geográfica para distribución

### Sistema de Usuarios
- **Roles diferenciados** con permisos específicos:
  - Encargado de Producción
  - Encargado de Ventas
  - Encargado de Compras
  - Encargado de Reparto
  - Encargado de Stock
  - Encargado de Cobros
  - Administrador de Usuarios

## 🛠️ Tecnologías Utilizadas

- **Backend**: Django 1.8.3
- **Base de Datos**: PostgreSQL
- **Frontend**: HTML, CSS, JavaScript, Bootstrap 3
- **Reportes**: xlsxwriter para exportación a Excel
- **Autenticación**: Sistema de usuarios integrado de Django

## 📁 Estructura del Proyecto

```
MIAPastas/
├── miapastas/          # Configuración principal de Django
│   ├── settings.py     # Configuración de la aplicación
│   ├── urls.py         # URLs principales
│   ├── views.py        # Vistas principales
│   └── wsgi.py         # Configuración WSGI
├── recetas/            # Aplicación principal
│   ├── models.py       # Modelos de datos
│   ├── views.py        # Vistas de la aplicación
│   ├── forms.py        # Formularios
│   ├── admin.py        # Configuración del admin
│   └── migrations/     # Migraciones de base de datos
├── templates/          # Plantillas HTML
├── estaticos/          # Archivos estáticos (CSS, JS, imágenes)
├── VER.json           # Datos de prueba/configuración
├── manage.py          # Script de gestión de Django
└── Makefile           # Comandos de automatización
```

## 🎯 Funcionalidades por Módulo

### Módulo de Recetas (`recetas/models.py`)
- **Insumo**: Gestión de materias primas (harina, huevos, etc.)
- **ProductoTerminado**: Productos finales (diferentes tipos de pasta)
- **Receta**: Recetas con ingredientes y cantidades
- **RecetaDetalle**: Detalles de ingredientes por receta
- **Lote**: Control de producción por lotes

### Módulo de Clientes
- **Cliente**: Datos de clientes con información de contacto
- **Zona/Ciudad**: Organización geográfica
- **PedidoCliente**: Gestión de pedidos
- **PedidoClienteDetalle**: Detalles de productos en pedidos

### Módulo de Proveedores
- **Proveedor**: Datos de proveedores
- **PedidoProveedor**: Órdenes de compra
- **DetallePedidoProveedor**: Detalles de productos en órdenes

### Módulo de Distribución
- **Chofer**: Gestión de conductores
- **HojaDeRuta**: Planificación de rutas
- **Entrega**: Control de entregas
- **EntregaDetalle**: Detalles de productos entregados

### Módulo de Facturación
- **Factura**: Sistema de facturación
- **Recibo**: Gestión de recibos de pago

## 📊 Reportes Disponibles

1. **Productos Más Vendidos**: Análisis de ventas por producto
2. **Clientes Morosos**: Listado de clientes con deudas pendientes
3. **Productos Terminados Disponibles**: Stock actual de productos
4. **Hojas de Ruta Finalizadas**: Historial de entregas
5. **Exportación a Excel**: Todos los reportes pueden exportarse

## 🔧 Configuración y Instalación

### Requisitos Previos
- Python 2.7 (nota: versión legacy)
- PostgreSQL
- Django 1.8.3

### Instalación
```bash
# Clonar el repositorio
git clone https://github.com/MiyoBran/MIAPastas.git
cd MIAPastas

# Configurar base de datos en local_settings.py
# Ejecutar migraciones
python manage.py migrate

# Crear superusuario
python manage.py createsuperuser

# Ejecutar servidor de desarrollo
python manage.py runserver
```

## 🌟 Áreas de Mejora Identificadas

Ver [IMPROVEMENTS.md](IMPROVEMENTS.md) para una lista detallada de mejoras sugeridas.

## 👥 Guía de Onboarding

Ver [ONBOARDING.md](ONBOARDING.md) para una guía completa de incorporación de nuevos colaboradores.

## 📚 Documentación Adicional

- [Guía de Funciones](FUNCTIONS.md) - Descripción detallada de todas las funciones
- [Guía de Usuario](Guia-v2.docx) - Manual de usuario existente
- [Configuración de Desarrollo](DEVELOPMENT.md) - Guía para desarrolladores

## 🤝 Contribuciones

Para contribuir al proyecto, por favor revise la [guía de onboarding](ONBOARDING.md) y siga las mejores prácticas establecidas.

## 📄 Licencia

Este proyecto está bajo licencia privada para uso interno de la empresa.