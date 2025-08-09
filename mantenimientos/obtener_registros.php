<?php
ini_set('display_errors', 1);
error_reporting(E_ALL);

header('Content-Type: application/json; charset=utf-8');
header('Access-Control-Allow-Origin: *');

$conexion = new mysqli("10.110.6.148", "BaseDatos", "sysadm1n2207", "mantenimientos");
$conexion->set_charset("utf8mb4");

if ($conexion->connect_error) {
    echo json_encode([
        'success' => false,
        'error' => '❌ Error de conexión: ' . $conexion->connect_error
    ]);
    exit;
}

function canonEstado($v) {
    $e = mb_strtolower(trim($v ?? ''), 'UTF-8');   // normaliza
    if ($e === 'pendiente') return 'Pendiente';
    if ($e === 'en progreso' || $e === 'en  progreso') return 'En progreso';
    if ($e === 'finalizado' || $e === 'finalizada') return 'Finalizado';
    return 'Pendiente'; // por defecto
}

$sql = "SELECT * FROM registros ORDER BY fecha_registro DESC";
$resultado = $conexion->query($sql);

$registros = [];

if ($resultado && $resultado->num_rows > 0) {
    while ($fila = $resultado->fetch_assoc()) {

        // ✅ Estandarizar estado
        $fila['estado'] = canonEstado($fila['estado'] ?? '');

        // Renombrar claves para el frontend
        $fila['tipoMantenimiento'] = $fila['tipo_mantenimiento'];
        $fila['centroCosto']       = $fila['centro_costo'];
        $fila['usuarioRegistro']   = $fila['usuario_registro'];
        $fila['urlTicket']         = $fila['url_ticket'] ?? '';

        // Quitar las snake_case originales
        unset(
            $fila['tipo_mantenimiento'],
            $fila['centro_costo'],
            $fila['usuario_registro'],
            $fila['url_ticket']
        );

        $registros[] = $fila;
    }
}

echo json_encode($registros, JSON_UNESCAPED_UNICODE);
$conexion->close();
