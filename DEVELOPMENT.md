# 🛠️ Guía de Desarrollo - MIAPastas

## 🎯 Configuración del Entorno de Desarrollo

### Prerrequisitos Técnicos
- Python 2.7 (legacy, migración a Python 3.8+ recomendada)
- PostgreSQL 9.4+
- Git
- pip (Python package manager)

### Instalación Detallada

#### 1. Preparación del Sistema
```bash
# Ubuntu/Debian
sudo apt-get update
sudo apt-get install python2.7 python-pip postgresql postgresql-contrib git

# macOS (con Homebrew)
brew install python@2.7 postgresql git

# Windows (usar WSL recomendado)
# Instalar Python 2.7 desde python.org
# Instalar PostgreSQL desde postgresql.org
```

#### 2. Configuración de PostgreSQL
```bash
# Iniciar servicio PostgreSQL
sudo systemctl start postgresql

# Crear usuario para desarrollo
sudo -u postgres createuser --interactive
# Nombre: miapastas_dev
# Superusuario: No
# Crear DB: Sí
# Crear roles: No

# Crear base de datos
sudo -u postgres createdb miapastas_dev -O miapastas_dev

# Configurar contraseña
sudo -u postgres psql
ALTER USER miapastas_dev WITH PASSWORD 'desarrollo123';
\q
```

#### 3. Configuración del Proyecto
```bash
# Clonar repositorio
git clone https://github.com/MiyoBran/MIAPastas.git
cd MIAPastas

# Crear entorno virtual (recomendado)
pip install virtualenv
virtualenv venv
source venv/bin/activate  # Linux/Mac
# venv\Scripts\activate    # Windows

# Instalar dependencias
pip install -r requirements.txt  # Si existe
# O instalar manualmente:
pip install Django==1.8.3
pip install psycopg2
pip install django-bootstrap3
pip install django-selectable
pip install django-multiselectfield
pip install xlsxwriter
```

#### 4. Configuración Local
Crear archivo `local_settings.py`:
```python
import os

BASE_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))

# Configuración de base de datos
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.postgresql_psycopg2',
        'NAME': 'miapastas_dev',
        'USER': 'miapastas_dev',
        'PASSWORD': 'desarrollo123',
        'HOST': 'localhost',
        'PORT': '5432',
    }
}

# Configuración de desarrollo
DEBUG = True
ALLOWED_HOSTS = ['localhost', '127.0.0.1']

# Configuración de email para desarrollo
EMAIL_BACKEND = 'django.core.mail.backends.console.EmailBackend'

# Configuración de archivos estáticos
STATIC_URL = '/static/'
STATICFILES_DIRS = [
    os.path.join(BASE_DIR, 'estaticos'),
]
```

#### 5. Inicialización de la Base de Datos
```bash
# Ejecutar migraciones
python manage.py migrate

# Crear superusuario
python manage.py createsuperuser
# Username: admin
# Email: admin@miapastas.com
# Password: admin123

# Cargar datos de ejemplo (opcional)
python manage.py loaddata VER.json
```

#### 6. Verificación de la Instalación
```bash
# Ejecutar servidor de desarrollo
python manage.py runserver

# Acceder a la aplicación
# http://localhost:8000 - Aplicación principal
# http://localhost:8000/admin - Panel de administración
```

## 🏗️ Arquitectura del Sistema

### Estructura de Directorios
```
MIAPastas/
├── miapastas/              # Configuración principal de Django
│   ├── __init__.py
│   ├── settings.py         # Configuración principal
│   ├── urls.py             # URLs principales
│   ├── views.py            # Vistas principales
│   ├── forms.py            # Formularios principales
│   └── wsgi.py             # Configuración WSGI
├── recetas/                # Aplicación principal del negocio
│   ├── __init__.py
│   ├── models.py           # Modelos de datos
│   ├── views.py            # Vistas de la aplicación
│   ├── forms.py            # Formularios específicos
│   ├── admin.py            # Configuración del admin
│   ├── migrations/         # Migraciones de BD
│   ├── templates/          # Plantillas específicas
│   └── templatetags/       # Tags personalizados
├── templates/              # Plantillas HTML globales
├── estaticos/              # Archivos estáticos
│   ├── css/                # Archivos CSS
│   ├── js/                 # Archivos JavaScript
│   ├── images/             # Imágenes
│   └── fonts/              # Fuentes
├── backup/                 # Respaldos
├── source/                 # Código fuente adicional
├── manage.py               # Script de gestión de Django
├── local_settings.py       # Configuración local
└── requirements.txt        # Dependencias (crear)
```

### Modelos de Datos Principales

#### Módulo de Producción
```python
# recetas/models.py
class Insumo(models.Model):
    nombre = models.CharField(max_length=100)
    descripcion = models.TextField()
    unidad_medida = models.IntegerField()
    stock = models.FloatField()
    activo = models.BooleanField(default=True)

class ProductoTerminado(models.Model):
    nombre = models.CharField(max_length=100)
    precio = models.DecimalField(max_digits=10, decimal_places=2)
    dias_vigencia = models.IntegerField()
    stock = models.IntegerField()
    activo = models.BooleanField(default=True)

class Receta(models.Model):
    nombre = models.CharField(max_length=100)
    descripcion = models.TextField()
    fecha_creacion = models.DateField()
    cant_prod_terminado = models.IntegerField()
    producto_terminado = models.ForeignKey(ProductoTerminado)

class Lote(models.Model):
    producto_terminado = models.ForeignKey(ProductoTerminado)
    cantidad_producida = models.IntegerField()
    fecha_produccion = models.DateField()
    fecha_vencimiento = models.DateField()
    stock_disponible = models.IntegerField()
    stock_reservado = models.IntegerField()
```

#### Módulo de Clientes
```python
class Zona(models.Model):
    nombre = models.CharField(max_length=100)

class Ciudad(models.Model):
    nombre = models.CharField(max_length=100)
    codigo_postal = models.IntegerField()
    zona = models.ForeignKey(Zona)

class Cliente(models.Model):
    cuit = models.BigIntegerField()
    razon_social = models.CharField(max_length=200)
    nombre_dueno = models.CharField(max_length=200)
    direccion = models.CharField(max_length=200)
    ciudad = models.ForeignKey(Ciudad)
    telefono = models.IntegerField()
    email = models.EmailField()
    saldo = models.FloatField()
    es_moroso = models.BooleanField(default=False)
```

### Sistema de Permisos

#### Grupos de Usuarios
```python
# Configuración en VER.json
GRUPOS_USUARIOS = {
    'Encargado de Produccion': [
        'add_lote', 'change_lote', 'delete_lote',
        'add_receta', 'change_receta', 'delete_receta',
        'ver_productos_terminados_disponibles'
    ],
    'Encargado de Ventas': [
        'add_cliente', 'change_cliente', 'delete_cliente',
        'add_pedidocliente', 'change_pedidocliente'
    ],
    'Encargado de Compras': [
        'add_proveedor', 'change_proveedor',
        'add_pedidoproveedor', 'change_pedidoproveedor'
    ],
    'Encargado de Reparto': [
        'add_chofer', 'change_chofer', 'delete_chofer'
    ],
    'Encargado de Stock': [
        'add_entrega', 'change_insumo', 'change_lote'
    ],
    'Encargado de Cobros': [
        'cobrar_a_cliente', 'ver_clientes_morosos'
    ]
}
```

## 🔧 Herramientas de Desarrollo

### IDEs y Editores Recomendados

#### Visual Studio Code
```json
// settings.json
{
    "python.pythonPath": "./venv/bin/python",
    "python.linting.enabled": true,
    "python.linting.pylintEnabled": true,
    "python.formatting.provider": "black",
    "editor.formatOnSave": true
}
```

Extensiones recomendadas:
- Python
- Django
- PostgreSQL
- Git Lens
- Bracket Pair Colorizer

#### PyCharm
- Configurar intérprete Python del virtualenv
- Configurar Django settings
- Activar Django support
- Configurar base de datos

### Herramientas de Debugging

#### Django Debug Toolbar
```bash
pip install django-debug-toolbar
```

```python
# settings.py
if DEBUG:
    INSTALLED_APPS += ['debug_toolbar']
    MIDDLEWARE_CLASSES += ['debug_toolbar.middleware.DebugToolbarMiddleware']
    INTERNAL_IPS = ['127.0.0.1']
```

#### Logging Configuration
```python
# settings.py
LOGGING = {
    'version': 1,
    'disable_existing_loggers': False,
    'handlers': {
        'file': {
            'level': 'DEBUG',
            'class': 'logging.FileHandler',
            'filename': 'debug.log',
        },
    },
    'loggers': {
        'django': {
            'handlers': ['file'],
            'level': 'DEBUG',
            'propagate': True,
        },
    },
}
```

## 📝 Estándares de Código

### Convenciones de Naming
```python
# Clases: PascalCase
class ProductoTerminado(models.Model):
    pass

# Funciones y variables: snake_case
def obtener_productos_disponibles():
    stock_disponible = 100
    return stock_disponible

# Constantes: UPPER_CASE
ESTADOS_PEDIDO = {
    'PENDIENTE': 1,
    'PROCESANDO': 2,
    'COMPLETADO': 3
}
```

### Documentación de Código
```python
def crear_lote(producto_terminado, cantidad, fecha_vencimiento):
    """
    Crea un nuevo lote de producción.
    
    Args:
        producto_terminado (ProductoTerminado): Producto a producir
        cantidad (int): Cantidad a producir
        fecha_vencimiento (date): Fecha de vencimiento del lote
        
    Returns:
        Lote: Instancia del lote creado
        
    Raises:
        ValueError: Si la cantidad es menor o igual a 0
    """
    if cantidad <= 0:
        raise ValueError("La cantidad debe ser mayor a 0")
    
    return Lote.objects.create(
        producto_terminado=producto_terminado,
        cantidad_producida=cantidad,
        fecha_produccion=date.today(),
        fecha_vencimiento=fecha_vencimiento,
        stock_disponible=cantidad,
        stock_reservado=0
    )
```

## 🧪 Testing y Calidad

### Estructura de Tests
```python
# recetas/tests.py
from django.test import TestCase
from django.contrib.auth.models import User
from .models import ProductoTerminado, Lote

class LoteTestCase(TestCase):
    def setUp(self):
        self.producto = ProductoTerminado.objects.create(
            nombre="Fideo Amarillo",
            precio=40.00,
            dias_vigencia=1000,
            stock=100
        )
    
    def test_crear_lote(self):
        """Test de creación de lote"""
        lote = Lote.objects.create(
            producto_terminado=self.producto,
            cantidad_producida=50,
            fecha_produccion=date.today(),
            fecha_vencimiento=date.today() + timedelta(days=30),
            stock_disponible=50,
            stock_reservado=0
        )
        self.assertEqual(lote.stock_disponible, 50)
        self.assertEqual(lote.stock_reservado, 0)
```

### Ejecutar Tests
```bash
# Ejecutar todos los tests
python manage.py test

# Ejecutar tests específicos
python manage.py test recetas.tests.LoteTestCase

# Ejecutar con coverage
pip install coverage
coverage run --source='.' manage.py test
coverage report
```

## 🚀 Deployment

### Configuración de Producción
```python
# production_settings.py
import os
from .settings import *

DEBUG = False
ALLOWED_HOSTS = ['tu-dominio.com', 'www.tu-dominio.com']

# Base de datos de producción
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.postgresql_psycopg2',
        'NAME': os.environ.get('DB_NAME'),
        'USER': os.environ.get('DB_USER'),
        'PASSWORD': os.environ.get('DB_PASSWORD'),
        'HOST': os.environ.get('DB_HOST'),
        'PORT': os.environ.get('DB_PORT', '5432'),
    }
}

# Configuración de archivos estáticos
STATIC_ROOT = os.path.join(BASE_DIR, 'staticfiles')
STATICFILES_STORAGE = 'django.contrib.staticfiles.storage.StaticFilesStorage'

# Configuración de seguridad
SECRET_KEY = os.environ.get('SECRET_KEY')
SESSION_COOKIE_SECURE = True
CSRF_COOKIE_SECURE = True
```

### Comandos de Deployment
```bash
# Colectar archivos estáticos
python manage.py collectstatic --noinput

# Ejecutar migraciones
python manage.py migrate

# Crear superusuario en producción
python manage.py createsuperuser

# Ejecutar con Gunicorn
pip install gunicorn
gunicorn miapastas.wsgi:application --bind 0.0.0.0:8000
```

## 📊 Monitoreo y Debugging

### Logging en Producción
```python
# settings.py
LOGGING = {
    'version': 1,
    'disable_existing_loggers': False,
    'formatters': {
        'verbose': {
            'format': '{levelname} {asctime} {module} {process:d} {thread:d} {message}',
            'style': '{',
        },
    },
    'handlers': {
        'file': {
            'level': 'INFO',
            'class': 'logging.FileHandler',
            'filename': '/var/log/miapastas/django.log',
            'formatter': 'verbose',
        },
    },
    'root': {
        'handlers': ['file'],
        'level': 'INFO',
    },
}
```

### Métricas Básicas
```python
# views.py
import logging

logger = logging.getLogger(__name__)

def crear_pedido(request):
    logger.info(f"Usuario {request.user.username} creando pedido")
    # Lógica del pedido
    logger.info("Pedido creado exitosamente")
```

## 🔄 Flujo de Trabajo con Git

### Branching Strategy
```bash
# Crear rama para feature
git checkout -b feature/nueva-funcionalidad

# Hacer cambios
git add .
git commit -m "feat: agregar nueva funcionalidad"

# Pushear rama
git push origin feature/nueva-funcionalidad

# Crear Pull Request
# Después de aprobación, mergear a main
```

### Commit Messages
```
feat: nueva funcionalidad
fix: corrección de bug
docs: actualización de documentación
style: cambios de formato
refactor: refactorización de código
test: agregado de tests
chore: tareas de mantenimiento
```

## 🛠️ Herramientas Adicionales

### Gestión de Dependencias
```bash
# Crear requirements.txt
pip freeze > requirements.txt

# Instalar desde requirements.txt
pip install -r requirements.txt

# Actualizar dependencias
pip install --upgrade -r requirements.txt
```

### Backup de Base de Datos
```bash
# Crear backup
pg_dump miapastas_dev > backup_$(date +%Y%m%d_%H%M%S).sql

# Restaurar backup
psql miapastas_dev < backup_20231201_120000.sql
```

Esta guía proporciona todo lo necesario para configurar y desarrollar en el proyecto MIAPastas de manera eficiente y siguiendo las mejores prácticas.