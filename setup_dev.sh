#!/bin/bash

# Script de configuración para desarrollo de MIAPastas

echo "🚀 Configurando entorno de desarrollo MIAPastas..."

# Colores para output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Función para mostrar mensajes de éxito
success() {
    echo -e "${GREEN}✅ $1${NC}"
}

# Función para mostrar mensajes de error
error() {
    echo -e "${RED}❌ $1${NC}"
}

# Función para mostrar mensajes de información
info() {
    echo -e "${YELLOW}ℹ️  $1${NC}"
}

# Verificar si Python está instalado
if ! command -v python2.7 &> /dev/null; then
    error "Python 2.7 no está instalado. Por favor instálalo primero."
    exit 1
fi

# Verificar si PostgreSQL está instalado
if ! command -v psql &> /dev/null; then
    error "PostgreSQL no está instalado. Por favor instálalo primero."
    exit 1
fi

# Crear entorno virtual
info "Creando entorno virtual..."
if [ ! -d "venv" ]; then
    python2.7 -m pip install virtualenv
    python2.7 -m virtualenv venv
    success "Entorno virtual creado"
else
    info "Entorno virtual ya existe"
fi

# Activar entorno virtual
info "Activando entorno virtual..."
source venv/bin/activate

# Instalar dependencias
info "Instalando dependencias..."
pip install -r requirements.txt
success "Dependencias instaladas"

# Crear configuración local si no existe
if [ ! -f "local_settings.py" ]; then
    info "Creando configuración local..."
    cp local_settings.py.example local_settings.py
    success "Configuración local creada"
    echo "⚠️  Recuerda configurar los datos de tu base de datos en local_settings.py"
else
    info "Configuración local ya existe"
fi

# Crear directorio de logs
if [ ! -d "logs" ]; then
    mkdir logs
    success "Directorio de logs creado"
fi

# Crear base de datos (esto debe hacerse manualmente)
info "Para completar la configuración, necesitas:"
echo "1. Crear la base de datos PostgreSQL:"
echo "   sudo -u postgres createdb miapastas_dev"
echo "   sudo -u postgres createuser miapastas_user -P"
echo ""
echo "2. Configurar la conexión en local_settings.py"
echo ""
echo "3. Ejecutar las migraciones:"
echo "   python manage.py migrate"
echo ""
echo "4. Crear un superusuario:"
echo "   python manage.py createsuperuser"
echo ""
echo "5. Cargar datos de ejemplo (opcional):"
echo "   python manage.py loaddata VER.json"
echo ""
echo "6. Ejecutar el servidor:"
echo "   python manage.py runserver"

success "Configuración inicial completa!"
echo ""
echo "📚 Para más información, consulta:"
echo "   - README.md - Información general del proyecto"
echo "   - ONBOARDING.md - Guía de incorporación"
echo "   - DEVELOPMENT.md - Guía detallada de desarrollo"