# 🏗️ Arquitectura del Sistema - MIAPastas

## 📊 Diagrama de Arquitectura

```
┌─────────────────────────────────────────────────────────────────┐
│                      CAPA DE PRESENTACIÓN                      │
├─────────────────────────────────────────────────────────────────┤
│  Bootstrap 3 │  jQuery  │  HTML Templates  │  Static Files     │
└─────────────────────────────────────────────────────────────────┘
                                │
┌─────────────────────────────────────────────────────────────────┐
│                      CAPA DE APLICACIÓN                        │
├─────────────────────────────────────────────────────────────────┤
│  Django Views │  Forms  │  URL Routing  │  Authentication      │
└─────────────────────────────────────────────────────────────────┘
                                │
┌─────────────────────────────────────────────────────────────────┐
│                      CAPA DE NEGOCIO                           │
├─────────────────────────────────────────────────────────────────┤
│  Django Models │  Business Logic  │  Permissions  │  Validators │
└─────────────────────────────────────────────────────────────────┘
                                │
┌─────────────────────────────────────────────────────────────────┐
│                      CAPA DE DATOS                             │
├─────────────────────────────────────────────────────────────────┤
│                     PostgreSQL Database                        │
└─────────────────────────────────────────────────────────────────┘
```

## 🗂️ Estructura Detallada del Proyecto

### Directorio Raíz
```
MIAPastas/
├── 📁 miapastas/           # Configuración principal Django
├── 📁 recetas/             # Aplicación principal del negocio
├── 📁 templates/           # Plantillas HTML globales
├── 📁 estaticos/           # Archivos estáticos (CSS, JS, imágenes)
├── 📁 backup/              # Respaldos del sistema
├── 📁 source/              # Código fuente adicional
├── 📄 manage.py            # Script de gestión Django
├── 📄 requirements.txt     # Dependencias del proyecto
├── 📄 VER.json            # Datos de configuración/prueba
├── 📄 Makefile            # Comandos de automatización
└── 📄 limpiar.py          # Script de limpieza
```

### Configuración Principal (`miapastas/`)
```
miapastas/
├── __init__.py             # Paquete Python
├── settings.py             # Configuración Django
├── urls.py                 # URLs principales
├── views.py                # Vistas principales
├── forms.py                # Formularios principales
└── wsgi.py                 # Configuración WSGI
```

**Funcionalidades:**
- Configuración de Django (base de datos, apps, middleware)
- Routing principal de URLs
- Vistas de autenticación y administración
- Formularios de usuarios y configuración

### Aplicación Principal (`recetas/`)
```
recetas/
├── __init__.py             # Paquete Python
├── models.py               # Modelos de datos del negocio
├── views.py                # Vistas de la aplicación
├── forms.py                # Formularios específicos
├── admin.py                # Configuración del admin
├── tests.py                # Tests unitarios
├── migrations/             # Migraciones de base de datos
│   ├── __init__.py
│   ├── 0001_initial.py
│   └── ...
├── templates/              # Plantillas específicas
└── templatetags/           # Tags personalizados
    ├── __init__.py
    └── custom_tags.py
```

**Funcionalidades:**
- Modelos de datos del negocio (Clientes, Productos, Pedidos, etc.)
- Lógica de negocio y procesamiento
- Formularios específicos del dominio
- Configuración del panel de administración

### Plantillas HTML (`templates/`)
```
templates/
├── base.html               # Plantilla base
├── navbar.html             # Barra de navegación
├── login.html              # Página de login
├── index.html              # Página principal/dashboard
├── signup.html             # Registro de usuarios
├── usuario.html            # Perfil de usuario
├── usuarioEditar.html      # Edición de usuario
├── 📁 PDFs/                # Plantillas para PDFs
├── 📁 recetas/             # Plantillas específicas
│   ├── choferesAlta.html
│   ├── choferesConsulta.html
│   ├── clientesAlta.html
│   ├── clientesConsulta.html
│   ├── productosTerminadosAlta.html
│   ├── recetasAlta.html
│   ├── lotesAlta.html
│   └── ...
└── 📁 reportes/            # Plantillas de reportes
    ├── listadoClientesMorosos.html
    ├── listadoProductosMasVendidos.html
    └── ...
```

### Archivos Estáticos (`estaticos/`)
```
estaticos/
├── 📁 css/                 # Hojas de estilo
│   ├── bootstrap.min.css
│   ├── custom.css
│   └── ...
├── 📁 js/                  # JavaScript
│   ├── bootstrap.min.js
│   ├── jquery.min.js
│   ├── custom.js
│   └── ...
├── 📁 images/              # Imágenes
│   ├── logo.png
│   ├── icons/
│   └── ...
├── 📁 fonts/               # Fuentes
│   ├── glyphicons/
│   └── ...
└── 📁 font-awesome-4.4.0/  # Iconos Font Awesome
```

## 🗄️ Modelos de Datos

### Diagrama de Entidades
```
┌─────────────┐    ┌─────────────┐    ┌─────────────┐
│   Insumo    │    │   Receta    │    │ProductoTerm │
│             │◄──►│             │◄──►│             │
│ - nombre    │    │ - nombre    │    │ - nombre    │
│ - stock     │    │ - fecha     │    │ - precio    │
└─────────────┘    └─────────────┘    └─────────────┘
                                              │
                                              ▼
┌─────────────┐    ┌─────────────┐    ┌─────────────┐
│   Zona      │    │   Ciudad    │    │    Lote     │
│             │◄──►│             │    │             │
│ - nombre    │    │ - nombre    │    │ - fecha_prod│
└─────────────┘    │ - cp        │    │ - stock     │
                   └─────────────┘    └─────────────┘
                           │
                           ▼
┌─────────────┐    ┌─────────────┐    ┌─────────────┐
│  Proveedor  │    │   Cliente   │    │   Chofer    │
│             │    │             │    │             │
│ - nombre    │    │ - razon_soc │    │ - nombre    │
│ - cuit      │    │ - cuit      │    │ - cuit      │
└─────────────┘    │ - saldo     │    │ - telefono  │
                   └─────────────┘    └─────────────┘
```

### Relaciones Principales

#### Módulo de Producción
- **Insumo** ↔ **RecetaDetalle** ↔ **Receta**
- **Receta** → **ProductoTerminado**
- **ProductoTerminado** → **Lote**
- **Lote** → **PerdidaStockLote**

#### Módulo de Ventas
- **Zona** → **Ciudad** → **Cliente**
- **Cliente** → **PedidoCliente** → **PedidoClienteDetalle**
- **ProductoTerminado** → **PedidoClienteDetalle**

#### Módulo de Distribución
- **Chofer** → **HojaDeRuta**
- **HojaDeRuta** → **ProductosLlevados**
- **PedidoCliente** → **Entrega** → **EntregaDetalle**

## 🔐 Sistema de Autenticación y Permisos

### Arquitectura de Seguridad
```
┌─────────────────────────────────────────────────────────────────┐
│                    DJANGO AUTH SYSTEM                          │
├─────────────────────────────────────────────────────────────────┤
│  User Model │  Groups │  Permissions │  Decorators             │
└─────────────────────────────────────────────────────────────────┘
                                │
┌─────────────────────────────────────────────────────────────────┐
│                    CUSTOM PERMISSIONS                          │
├─────────────────────────────────────────────────────────────────┤
│  Role-Based Access │  Model Permissions │  View Decorators    │
└─────────────────────────────────────────────────────────────────┘
```

### Roles y Permisos
```python
ROLES_PERMISOS = {
    'Encargado de Produccion': {
        'models': ['Lote', 'Receta', 'ProductoTerminado', 'Insumo'],
        'actions': ['add', 'change', 'delete', 'view'],
        'views': ['producciones', 'recetas', 'lotes', 'insumos']
    },
    'Encargado de Ventas': {
        'models': ['Cliente', 'PedidoCliente', 'Ciudad', 'Zona'],
        'actions': ['add', 'change', 'delete', 'view'],
        'views': ['clientes', 'pedidosCliente', 'ciudades', 'zonas']
    },
    'Encargado de Compras': {
        'models': ['Proveedor', 'PedidoProveedor', 'Insumo'],
        'actions': ['add', 'change', 'delete', 'view'],
        'views': ['proveedores', 'pedidosProveedor', 'insumos']
    }
}
```

## 🔄 Flujo de Datos

### Proceso de Producción
```
1. Crear Receta
   ├── Seleccionar Insumos
   ├── Definir Cantidades
   └── Asociar Producto Terminado

2. Crear Lote
   ├── Seleccionar Receta
   ├── Definir Cantidad
   ├── Reservar Insumos
   └── Actualizar Stock

3. Gestionar Stock
   ├── Actualizar Disponible
   ├── Manejar Reservas
   └── Procesar Pérdidas
```

### Proceso de Ventas
```
1. Gestionar Cliente
   ├── Datos Personales
   ├── Ubicación (Zona/Ciudad)
   └── Estado de Cuenta

2. Crear Pedido
   ├── Seleccionar Cliente
   ├── Productos y Cantidades
   └── Tipo de Pedido

3. Procesar Entrega
   ├── Generar Hoja de Ruta
   ├── Asignar Chofer
   ├── Realizar Entrega
   └── Actualizar Stock
```

## 🛠️ Tecnologías y Componentes

### Backend Stack
```
┌─────────────────────────────────────────────────────────────────┐
│                        BACKEND                                  │
├─────────────────────────────────────────────────────────────────┤
│  Django 1.8.3 │  Python 2.7  │  PostgreSQL  │  WSGI          │
└─────────────────────────────────────────────────────────────────┘
```

### Frontend Stack
```
┌─────────────────────────────────────────────────────────────────┐
│                        FRONTEND                                 │
├─────────────────────────────────────────────────────────────────┤
│  Bootstrap 3 │  jQuery  │  HTML5/CSS3  │  Font Awesome        │
└─────────────────────────────────────────────────────────────────┘
```

### Librerías Principales
- **django-bootstrap3**: Integración con Bootstrap
- **django-selectable**: Campos autocompletables
- **django-multiselectfield**: Campos de selección múltiple
- **xlsxwriter**: Generación de archivos Excel
- **psycopg2**: Conector PostgreSQL

## 📊 Patrones de Diseño Utilizados

### Model-View-Template (MVT)
```python
# Model (recetas/models.py)
class Cliente(models.Model):
    razon_social = models.CharField(max_length=200)
    cuit = models.BigIntegerField()
    saldo = models.FloatField()

# View (recetas/views.py)
def clientes(request, cliente_id=None):
    if cliente_id:
        cliente = get_object_or_404(Cliente, id=cliente_id)
        return render(request, 'clienteConsulta.html', {'cliente': cliente})
    else:
        clientes = Cliente.objects.all()
        return render(request, 'clientesConsulta.html', {'clientes': clientes})

# Template (templates/clientesConsulta.html)
{% for cliente in clientes %}
    <tr>
        <td>{{ cliente.razon_social }}</td>
        <td>{{ cliente.cuit }}</td>
        <td>{{ cliente.saldo }}</td>
    </tr>
{% endfor %}
```

### Repository Pattern (Parcial)
```python
# Manager personalizado
class ManagerBajasLogicas(models.Manager):
    def __init__(self, activo):
        super(ManagerBajasLogicas, self).__init__()
        self.activo = activo

    def get_queryset(self):
        return super(ManagerBajasLogicas, self).get_queryset().filter(activo=self.activo)

# Uso en modelo
class Cliente(models.Model):
    # ... campos ...
    activo = models.BooleanField(default=True)
    
    objects = ManagerBajasLogicas(activo=True)
    eliminados = ManagerBajasLogicas(activo=False)
```

## 🔧 Configuración y Despliegue

### Configuración por Entornos
```python
# settings.py (base)
INSTALLED_APPS = [
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',
    'bootstrap3',
    'recetas',
    'selectable',
    'multiselectfield',
]

# local_settings.py (desarrollo)
from .settings import *
DEBUG = True
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.postgresql_psycopg2',
        'NAME': 'miapastas_dev',
        'USER': 'dev_user',
        'PASSWORD': 'dev_password',
        'HOST': 'localhost',
        'PORT': '5432',
    }
}

# production_settings.py (producción)
from .settings import *
DEBUG = False
ALLOWED_HOSTS = ['miapastas.com', 'www.miapastas.com']
# Configuración de producción...
```

### Estructura de Deployment
```
/var/www/miapastas/
├── 📁 app/                 # Código de la aplicación
├── 📁 static/              # Archivos estáticos colectados
├── 📁 media/               # Archivos subidos por usuarios
├── 📁 logs/                # Logs de aplicación
├── 📁 backups/             # Respaldos de BD
└── 📄 gunicorn.conf.py     # Configuración Gunicorn
```

## 📈 Escalabilidad y Rendimiento

### Optimizaciones Actuales
- Manager personalizado para consultas eficientes
- Filtros en consultas para reducir carga
- Paginación básica en algunos listados

### Mejoras Sugeridas
- Implementar caching con Redis
- Optimizar consultas con select_related/prefetch_related
- Añadir índices de base de datos
- Implementar lazy loading
- Usar Class-Based Views para mejor reutilización

## 🔍 Monitoreo y Debugging

### Estructura de Logs
```
logs/
├── django.log              # Logs generales de Django
├── error.log               # Logs de errores
├── access.log              # Logs de acceso
└── business.log            # Logs de lógica de negocio
```

### Métricas Sugeridas
- Tiempo de respuesta por endpoint
- Uso de memoria y CPU
- Queries de base de datos lentas
- Errores y excepciones
- Actividad de usuarios

Esta arquitectura proporciona una base sólida para el sistema MIAPastas, con posibilidades de mejora y escalabilidad futuras.