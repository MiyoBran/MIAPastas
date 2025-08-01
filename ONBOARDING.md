# 🚀 Guía de Onboarding - MIAPastas

## 👋 Bienvenido al Equipo

Esta guía te ayudará a configurar tu entorno de desarrollo y entender el sistema MIAPastas paso a paso.

## 📋 Checklist de Onboarding

### Día 1: Configuración Inicial
- [ ] Acceso a repositorio GitHub
- [ ] Configuración de entorno de desarrollo
- [ ] Instalación de dependencias
- [ ] Primera ejecución del sistema
- [ ] Revisión de documentación básica

### Día 2-3: Comprensión del Sistema
- [ ] Exploración de la interfaz de usuario
- [ ] Comprensión de los roles y permisos
- [ ] Revisión de los modelos de datos
- [ ] Entendimiento del flujo de trabajo

### Día 4-5: Desarrollo Práctico
- [ ] Configuración de herramientas de desarrollo
- [ ] Primeras modificaciones de código
- [ ] Ejecución de pruebas básicas
- [ ] Revisión de código con el equipo

## 🛠️ Configuración del Entorno de Desarrollo

### Prerrequisitos
- Python 2.7 (nota: migración a Python 3.8+ pendiente)
- PostgreSQL 9.4+
- Git
- IDE/Editor de texto (recomendado: VS Code, PyCharm)

### Instalación Paso a Paso

#### 1. Clonar el Repositorio
```bash
git clone https://github.com/MiyoBran/MIAPastas.git
cd MIAPastas
```

#### 2. Configurar Base de Datos
```bash
# Crear base de datos PostgreSQL
createdb miapastas_dev

# Crear usuario para la aplicación
createuser miapastas_user -P
```

#### 3. Configurar Variables de Entorno
Crear archivo `local_settings.py`:
```python
import os

BASE_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.postgresql_psycopg2',
        'NAME': 'miapastas_dev',
        'USER': 'miapastas_user',
        'PASSWORD': 'tu_password',
        'HOST': 'localhost',
        'PORT': '5432',
    }
}
```

#### 4. Instalar Dependencias
```bash
# Instalar dependencias básicas (crear requirements.txt si no existe)
pip install Django==1.8.3
pip install psycopg2
pip install django-bootstrap3
pip install django-selectable
pip install django-multiselectfield
pip install xlsxwriter
```

#### 5. Configurar Base de Datos
```bash
# Ejecutar migraciones
python manage.py migrate

# Crear superusuario
python manage.py createsuperuser

# Cargar datos iniciales (opcional)
python manage.py loaddata VER.json
```

#### 6. Ejecutar Servidor
```bash
python manage.py runserver
```

Acceder a: `http://localhost:8000`

## 🏗️ Estructura del Proyecto

### Directorios Principales
```
MIAPastas/
├── miapastas/          # Configuración principal
│   ├── settings.py     # Configuración de Django
│   ├── urls.py         # URLs principales
│   ├── views.py        # Vistas principales
│   └── wsgi.py         # Configuración WSGI
├── recetas/            # Aplicación principal
│   ├── models.py       # Modelos de datos
│   ├── views.py        # Vistas de la aplicación
│   ├── forms.py        # Formularios
│   ├── admin.py        # Configuración del admin
│   └── migrations/     # Migraciones de BD
├── templates/          # Plantillas HTML
├── estaticos/          # Archivos estáticos
└── manage.py          # Script de gestión
```

### Archivos Importantes
- **`settings.py`**: Configuración principal de Django
- **`urls.py`**: Mapeo de URLs a vistas
- **`models.py`**: Definición de modelos de datos
- **`views.py`**: Lógica de las vistas
- **`forms.py`**: Formularios de Django
- **`admin.py`**: Configuración del panel de administración

## 📊 Comprensión del Negocio

### Flujo de Trabajo Principal

#### 1. Gestión de Producción
```
Crear Receta → Crear Lote → Controlar Stock → Reportar Pérdidas
```

#### 2. Gestión de Ventas
```
Registrar Cliente → Crear Pedido → Planificar Entrega → Entregar → Cobrar
```

#### 3. Gestión de Compras
```
Registrar Proveedor → Crear Pedido → Recepcionar → Actualizar Stock
```

### Roles del Sistema
- **Administrador**: Gestión de usuarios y configuración
- **Producción**: Manejo de recetas, lotes y stock
- **Ventas**: Gestión de clientes y pedidos
- **Compras**: Manejo de proveedores y órdenes
- **Reparto**: Planificación de rutas y entregas
- **Stock**: Control de inventario
- **Cobros**: Gestión de pagos y facturación

## 🎯 Primeros Pasos en el Sistema

### 1. Exploración de la Interfaz
1. Ingresar con el superusuario creado
2. Explorar el menú principal
3. Revisar las diferentes secciones por rol
4. Probar la funcionalidad básica de cada módulo

### 2. Comprensión de los Datos
1. Revisar los modelos en `recetas/models.py`
2. Entender las relaciones entre entidades
3. Explorar los datos de ejemplo en `VER.json`
4. Usar el admin de Django para ver los datos

### 3. Análisis del Código
1. Revisar la estructura de vistas en `views.py`
2. Entender el sistema de permisos
3. Analizar los formularios en `forms.py`
4. Explorar las plantillas HTML

## 🔧 Herramientas de Desarrollo

### IDEs Recomendados
- **VS Code**: Con extensiones para Python y Django
- **PyCharm**: IDE completo para Python
- **Sublime Text**: Editor ligero con plugins

### Extensiones Útiles para VS Code
- Python
- Django
- PostgreSQL
- Git Lens
- Bracket Pair Colorizer
- Auto Rename Tag

### Herramientas de Debugging
- **Django Debug Toolbar**: Para debugging en desarrollo
- **pdb**: Debugger integrado de Python
- **Django Shell**: Para pruebas interactivas

## 📚 Recursos de Aprendizaje

### Documentación Oficial
- [Django 1.8 Documentation](https://docs.djangoproject.com/en/1.8/)
- [PostgreSQL Documentation](https://www.postgresql.org/docs/)
- [Bootstrap 3 Documentation](https://getbootstrap.com/docs/3.3/)

### Tutoriales Recomendados
- Django Girls Tutorial
- Django Official Tutorial
- PostgreSQL Tutorial

### Libros Recomendados
- "Two Scoops of Django" (versión para Django 1.8)
- "Django by Example"
- "High Performance Django"

## 🤝 Proceso de Desarrollo

### Flujo de Trabajo con Git
```bash
# Crear rama para nueva funcionalidad
git checkout -b feature/nueva-funcionalidad

# Hacer cambios y commits
git add .
git commit -m "Descripción del cambio"

# Pushear rama
git push origin feature/nueva-funcionalidad

# Crear Pull Request en GitHub
```

### Estándares de Código
- Seguir PEP 8 para Python
- Usar nombres descriptivos para variables y funciones
- Comentar código complejo
- Mantener funciones pequeñas y enfocadas

### Revisión de Código
- Todo código debe pasar por revisión
- Revisar funcionalidad y estilo
- Verificar que no rompa funcionalidad existente
- Asegurar que siga los estándares del proyecto

## 🧪 Testing y Debugging

### Debugging Básico
```python
# Usar pdb para debugging
import pdb; pdb.set_trace()

# Usar print para debug rápido
print("Debug: variable =", variable)

# Usar Django shell para probar código
python manage.py shell
```

### Pruebas Manuales
1. Probar cada funcionalidad después de cambios
2. Verificar permisos por rol
3. Probar con diferentes tipos de datos
4. Verificar interfaz en diferentes navegadores

## 🚨 Problemas Comunes y Soluciones

### Error de Base de Datos
```
django.db.utils.OperationalError: FATAL: database "miapastas_dev" does not exist
```
**Solución**: Crear la base de datos con `createdb miapastas_dev`

### Error de Migración
```
django.db.utils.ProgrammingError: relation "recetas_chofer" does not exist
```
**Solución**: Ejecutar `python manage.py migrate`

### Error de Permisos
```
PermissionError: [Errno 13] Permission denied
```
**Solución**: Verificar permisos del usuario y configuración de roles

### Error de Importación
```
ImportError: No module named 'module_name'
```
**Solución**: Instalar dependencia faltante con `pip install module_name`

## 📝 Tareas de Práctica

### Semana 1: Familiarización
1. Configurar entorno de desarrollo
2. Explorar todas las funcionalidades del sistema
3. Crear un cliente de prueba
4. Generar un pedido y procesarlo

### Semana 2: Desarrollo Básico
1. Hacer un pequeño cambio en la interfaz
2. Añadir un campo a un modelo existente
3. Crear una vista simple
4. Modificar un formulario

### Semana 3: Desarrollo Avanzado
1. Implementar una funcionalidad completa
2. Añadir validaciones personalizadas
3. Crear un reporte básico
4. Optimizar una consulta de base de datos

## 🎓 Certificación de Onboarding

### Criterios de Evaluación
- [ ] Entorno de desarrollo funcional
- [ ] Comprensión del flujo de negocio
- [ ] Conocimiento de la arquitectura del sistema
- [ ] Capacidad para hacer cambios básicos
- [ ] Seguimiento de estándares de código

### Evaluación Final
- Implementar una pequeña funcionalidad
- Presentar el trabajo al equipo
- Responder preguntas sobre el sistema
- Revisar código con un mentor

## 🚀 Próximos Pasos

### Después del Onboarding
1. Asignación a proyectos específicos
2. Participación en planning y reviews
3. Contribución a mejoras del sistema
4. Mentoreo de nuevos miembros

### Crecimiento Profesional
- Especializarse en áreas específicas (frontend, backend, DevOps)
- Participar en decisiones de arquitectura
- Liderar proyectos de mejora
- Contribuir a la documentación y procesos

## 📞 Contactos y Recursos

### Equipo de Desarrollo
- **Tech Lead**: [Nombre] - [email]
- **Senior Developer**: [Nombre] - [email]
- **DevOps**: [Nombre] - [email]

### Recursos Internos
- Canal de Slack: #miapastas-dev
- Documentación interna: [URL]
- Wiki del proyecto: [URL]

### Soporte
- Para problemas técnicos: crear issue en GitHub
- Para dudas de negocio: contactar al Product Owner
- Para infraestructura: contactar al equipo de DevOps

¡Bienvenido al equipo y que tengas un excelente onboarding! 🎉