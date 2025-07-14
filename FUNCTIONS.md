# 📋 Guía de Funciones - MIAPastas

## 🗂️ Organización de Funciones por Archivos

### 📁 `miapastas/views.py` - Vistas Principales del Sistema

#### Funciones de Autenticación y Usuarios
- **`index(request)`** - Página principal/dashboard del sistema
- **`signup(request)`** - Registro de nuevos usuarios
- **`usuario(request)`** - Perfil del usuario actual
- **`usuarioEditar(request, usuario_id)`** - Edición de perfil de usuario
- **`usuarioCambiarClave(request, usuario_id)`** - Cambio de contraseña
- **`usuariosAdmin(request)`** - Administración de usuarios (solo admin)
- **`usuariosAdminModificar(request, usuario_id)`** - Modificación de usuarios por admin
- **`usuariosAdminBaja(request, usuario_id)`** - Baja de usuarios

#### Funciones de Gestión de Grupos
- **`usuariosAdminModificarQuitarGrupo(request, usuario_id, grupo_usuario_id)`** - Quitar usuario de grupo
- **`usuariosAdminModificarAgregarGrupo(request, usuario_id, grupo_id)`** - Agregar usuario a grupo

#### Funciones de Consultas y Reportes
- **`recetasConsulta(request)`** - Consulta de recetas
- **`clientesConsulta(request)`** - Consulta de clientes
- **`clientesModificar(request)`** - Modificación de clientes
- **`proveedoresConsulta(request)`** - Consulta de proveedores
- **`proveedoresModificar(request)`** - Modificación de proveedores

#### Funciones de Producción
- **`producciones(request)`** - Lista de producciones
- **`produccionesAlta(request)`** - Alta de nueva producción
- **`produccionesConsulta(request)`** - Consulta de producciones
- **`produccionesModificar(request)`** - Modificación de producciones

#### Funciones de Reportes Especializados
- **`listadoClientesMorosos(request)`** - Reporte de clientes morosos
- **`listadoClientesMorososFiltros(request)`** - Filtros para clientes morosos
- **`listadoClientesMorososExcel(request)`** - Exportación a Excel de clientes morosos
- **`listadoProductosTerminadosDisponibles(request)`** - Reporte de productos disponibles
- **`listadoProductosMasVendidos(request)`** - Reporte de productos más vendidos
- **`listadoProductosMasVendidosGrafico(request)`** - Gráfico de productos más vendidos
- **`listadoHojasDeRutaFinalizadas(request)`** - Reporte de hojas de ruta finalizadas

#### Funciones de Utilidad
- **`ayuda(request)`** - Página de ayuda
- **`documentacion(request)`** - Documentación del sistema
- **`get_filtros(get, modelo)`** - Función auxiliar para filtros
- **`get_order(get)`** - Función auxiliar para ordenamiento

### 📁 `recetas/views.py` - Vistas de la Aplicación Principal

#### Gestión de Choferes
- **`choferes(request, chofer_id=None)`** - Lista/detalle de choferes
- **`choferesAlta(request)`** - Alta de nuevo chofer
- **`choferesModificar(request, chofer_id)`** - Modificación de chofer
- **`choferesBaja(request, chofer_id)`** - Baja de chofer
- **`choferesAltaAjax(request)`** - Alta de chofer vía AJAX

#### Gestión de Recetas
- **`recetas(request, receta_id=None)`** - Lista/detalle de recetas
- **`recetasAlta(request)`** - Alta de nueva receta
- **`recetasModificar(request, receta_id)`** - Modificación de receta
- **`recetasBaja(request, receta_id)`** - Baja de receta

#### Gestión de Lotes
- **`lotes(request, lote_id=None)`** - Lista/detalle de lotes
- **`lotesAlta(request)`** - Alta de nuevo lote
- **`lotesModificar(request, lote_id)`** - Modificación de lote
- **`perdidasStockLotes(request)`** - Gestión de pérdidas de stock en lotes
- **`loteStock(request, lote_id)`** - Actualización de stock de lote

#### Gestión de Insumos
- **`insumos(request, insumo_id=None)`** - Lista/detalle de insumos
- **`insumosAlta(request)`** - Alta de nuevo insumo
- **`insumosModificar(request, insumo_id)`** - Modificación de insumo
- **`insumosBaja(request, insumo_id)`** - Baja de insumo
- **`insumosModificarStock(request)`** - Modificación de stock de insumos
- **`datosInsumo(request, insumo_id)`** - Datos específicos de insumo

#### Gestión de Zonas y Ciudades
- **`zonas(request, zona_id=None)`** - Lista/detalle de zonas
- **`zonasAlta(request)`** - Alta de nueva zona
- **`zonasModificar(request, zona_id)`** - Modificación de zona
- **`zonasBaja(request, zona_id)`** - Baja de zona
- **`ciudades(request, ciudad_id=None)`** - Lista/detalle de ciudades
- **`ciudadesAlta(request)`** - Alta de nueva ciudad
- **`ciudadesModificar(request, ciudad_id)`** - Modificación de ciudad
- **`ciudadesBaja(request, ciudad_id)`** - Baja de ciudad

#### Gestión de Clientes
- **`clientes(request, cliente_id=None)`** - Lista/detalle de clientes
- **`clientesAlta(request)`** - Alta de nuevo cliente
- **`clientesModificar(request, cliente_id)`** - Modificación de cliente
- **`clientesBaja(request, cliente_id)`** - Baja de cliente

#### Gestión de Productos Terminados
- **`productosTerminados(request, producto_id=None)`** - Lista/detalle de productos terminados
- **`productosTerminadosAlta(request)`** - Alta de nuevo producto terminado
- **`productosTerminadosModificar(request, producto_id)`** - Modificación de producto terminado
- **`productosTerminadosBaja(request, producto_id)`** - Baja de producto terminado
- **`productosTerminadosAltaAjax(request, producto_id)`** - Alta vía AJAX

#### Gestión de Proveedores
- **`proveedores(request, proveedor_id=None)`** - Lista/detalle de proveedores
- **`proveedoresAlta(request)`** - Alta de nuevo proveedor
- **`proveedoresModificar(request, proveedor_id)`** - Modificación de proveedor
- **`proveedoresBaja(request, proveedor_id)`** - Baja de proveedor

#### Gestión de Pedidos a Proveedores
- **`pedidosProveedor(request, pedido_id=None)`** - Lista/detalle de pedidos a proveedores
- **`pedidosProveedorAlta(request)`** - Alta de nuevo pedido a proveedor
- **`pedidosProveedorModificar(request, pedido_id)`** - Modificación de pedido a proveedor
- **`pedidosProveedorBaja(request, pedido_id)`** - Baja de pedido a proveedor
- **`pedidosProveedorRecepcionar(request, pedido_id)`** - Recepción de pedido
- **`pedidosProveedorCancelar(request, pedido_id)`** - Cancelación de pedido

#### Gestión de Pedidos de Clientes
- **`pedidosClientes(request, pedido_id=None)`** - Lista/detalle de pedidos de clientes
- **`pedidosClientesAlta(request, tipo_pedido_id)`** - Alta de nuevo pedido de cliente
- **`pedidosClienteModificar(request, pedido_id)`** - Modificación de pedido de cliente
- **`pedidosClienteBaja(request, pedido_id)`** - Baja de pedido de cliente

#### Gestión de Hojas de Ruta
- **`hojaDeRuta(request)`** - Lista de hojas de ruta
- **`hojaDeRutaAlta(request)`** - Alta de nueva hoja de ruta
- **`HojaDeRutaMostrar(request, hoja_id)`** - Mostrar hoja de ruta específica
- **`generarTotales(request)`** - Generar totales para hoja de ruta

#### Gestión de Entregas
- **`rendicionReparto(request, hoja_id)`** - Rendición de reparto
- **`rendicionHojasDeRutas(request)`** - Rendición de hojas de ruta
- **`RendicionDeRepartoMostrar(request, hoja_id)`** - Mostrar rendición de reparto
- **`rendicionHojasDeRutasSinCobrar(request)`** - Hojas de ruta sin cobrar

#### Gestión de Cobros
- **`cobrarCliente(request)`** - Cobrar a cliente
- **`cobrarClienteClasificar(request)`** - Clasificar cobros
- **`cobrarClienteFacturar(request)`** - Facturar cobros
- **`cobrarClienteFiltrado(request, cliente_id)`** - Cobros filtrados por cliente
- **`cobrarClienteMostrarRecibos(request)`** - Mostrar recibos
- **`getFacturas(request)`** - Obtener facturas (AJAX)
- **`getRecibos(request)`** - Obtener recibos (AJAX)

#### Funciones de Reportes PDF
- **`HojaDeRutaPdf(request, hoja_id)`** - Generar PDF de hoja de ruta
- **`LotesHojaRutaPdf(request, hoja_id)`** - Generar PDF de lotes de hoja de ruta

#### Funciones de Gráficos
- **`productosMasVendidos(request)`** - Gráfico de productos más vendidos

### 📁 `recetas/models.py` - Modelos de Datos

#### Modelos Principales
- **`Chofer`** - Modelo de choferes con validaciones
- **`Insumo`** - Modelo de insumos/materias primas
- **`ProductoTerminado`** - Modelo de productos terminados
- **`Receta`** - Modelo de recetas
- **`RecetaDetalle`** - Detalles de recetas
- **`Lote`** - Modelo de lotes de producción
- **`Zona`** - Modelo de zonas geográficas
- **`Ciudad`** - Modelo de ciudades
- **`Cliente`** - Modelo de clientes
- **`Proveedor`** - Modelo de proveedores
- **`PedidoCliente`** - Modelo de pedidos de clientes
- **`PedidoClienteDetalle`** - Detalles de pedidos de clientes
- **`PedidoProveedor`** - Modelo de pedidos a proveedores
- **`DetallePedidoProveedor`** - Detalles de pedidos a proveedores
- **`HojaDeRuta`** - Modelo de hojas de ruta
- **`Entrega`** - Modelo de entregas
- **`EntregaDetalle`** - Detalles de entregas
- **`Factura`** - Modelo de facturas
- **`Recibo`** - Modelo de recibos

#### Métodos Importantes de Modelos
- **`Lote.reservar_stock(cantidad)`** - Reservar stock de un lote
- **`Lote.decrementar_stock_disponible(cantidad)`** - Decrementar stock disponible
- **`ProductosLlevados.reservar_stock()`** - Reservar stock para productos llevados
- **`Entrega.generar_detalles()`** - Generar detalles de entrega
- **`Entrega.cobrar_con_factura(monto, numero_factura)`** - Cobrar con factura
- **`Entrega.cobrar_con_recibo(monto, numero_recibo)`** - Cobrar con recibo

### 📁 `recetas/forms.py` - Formularios

#### Formularios de Gestión
- Formularios para CRUD de todas las entidades
- Validaciones específicas para cada modelo
- Campos dinámicos según permisos de usuario

### 📁 `recetas/admin.py` - Configuración de Admin

#### Configuración del Admin de Django
- Registros de modelos para administración
- Configuración de campos mostrados
- Filtros y búsquedas personalizadas

## 🔧 Funciones Auxiliares y Utilidades

### Gestión de Permisos
- Decoradores de permisos por rol
- Validaciones de acceso por funcionalidad
- Control de acceso granular

### Funciones de Filtrado
- **`get_filtros(get, modelo)`** - Filtros dinámicos
- **`get_order(get)`** - Ordenamiento dinámico
- Filtros por fechas, rangos, y campos específicos

### Funciones de Exportación
- Exportación a Excel de todos los reportes
- Generación de PDFs para hojas de ruta
- Gráficos estadísticos

## 📊 Flujo de Funciones por Proceso

### Proceso de Producción
1. **Crear Receta** → `recetasAlta()`
2. **Crear Lote** → `lotesAlta()`
3. **Gestionar Stock** → `loteStock()`
4. **Controlar Pérdidas** → `perdidasStockLotes()`

### Proceso de Ventas
1. **Gestionar Cliente** → `clientesAlta()`
2. **Crear Pedido** → `pedidosClientesAlta()`
3. **Planificar Entrega** → `hojaDeRutaAlta()`
4. **Realizar Entrega** → `rendicionReparto()`
5. **Cobrar** → `cobrarCliente()`

### Proceso de Compras
1. **Gestionar Proveedor** → `proveedoresAlta()`
2. **Crear Pedido** → `pedidosProveedorAlta()`
3. **Recepcionar** → `pedidosProveedorRecepcionar()`
4. **Actualizar Stock** → `insumosModificarStock()`

## 🎯 Puntos de Entrada Principales

### Por Rol de Usuario
- **Producción**: `/lotes/`, `/recetas/`, `/insumos/`
- **Ventas**: `/clientes/`, `/pedidosCliente/`, `/ciudades/`
- **Compras**: `/proveedores/`, `/pedidosProveedor/`, `/insumos/`
- **Reparto**: `/choferes/`, `/hojaDeRuta/`
- **Stock**: `/productosTerminados/`, `/lotes/`, `/insumos/`
- **Cobros**: `/cobrarCliente/`, `/listadoClientesMorosos/`
- **Admin**: `/usuariosAdmin/`, `/admin/`

### URLs de Reportes
- `/listadoProductosMasVendidos/`
- `/listadoClientesMorosos/`
- `/listadoProductosTerminadosDisponibles/`
- `/listadoHojasDeRutaFinalizadas/`

Esta guía proporciona una visión completa de dónde se encuentran las diferentes funcionalidades del sistema MIAPastas y cómo están organizadas.