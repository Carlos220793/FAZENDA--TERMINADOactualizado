<?php
ini_set('display_errors', 1);
error_reporting(E_ALL);

header('Content-Type: application/json; charset=utf-8');
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: POST, OPTIONS');
header('Access-Control-Allow-Headers: Content-Type');

// Soporte para preflight
if ($_SERVER['REQUEST_METHOD'] === 'OPTIONS') {
  http_response_code(200);
  exit;
}

// Conexión a la base de datos
$conexion = new mysqli("10.110.6.148", "BaseDatos", "sysadm1n2207", "mantenimientos");
$conexion->set_charset("utf8mb4");

if ($conexion->connect_error) {
  echo json_encode(['success' => false, 'error' => '❌ Error de conexión: ' . $conexion->connect_error]);
  exit;
}

// Leer JSON
$datos = json_decode(file_get_contents("php://input"), true);
if (!is_array($datos)) {
  echo json_encode(['success' => false, 'error' => 'Payload vacío o JSON inválido']);
  exit;
}

// Validar ID
$id = $datos['id'] ?? null;
if (!$id) {
  echo json_encode(['success' => false, 'error' => 'ID no proporcionado para la edición']);
  exit;
}

// Normalizar claves: preferir snake_case, pero aceptar camelCase
$tipo              = $datos['tipo']              ?? '';
$placa             = $datos['placa']             ?? '';
$marca             = $datos['marca']             ?? '';
$modelo            = $datos['modelo']            ?? '';
$serial            = $datos['serial']            ?? '';
$fecha             = $datos['fecha']             ?? '';
$tecnico           = $datos['tecnico']           ?? '';

$tipo_mantenimiento = $datos['tipo_mantenimiento'] ?? ($datos['tipoMantenimiento'] ?? '');
$estado             = $datos['estado']             ?? '';
$ubicacion          = $datos['ubicacion']          ?? '';
$centro_costo       = $datos['centro_costo']       ?? ($datos['centroCosto'] ?? '');
$url_ticket         = $datos['url_ticket']         ?? ($datos['urlTicket'] ?? '');
$observaciones      = $datos['observaciones']      ?? '';

// Preparar y ejecutar la actualización
$sql = "UPDATE registros SET 
  tipo = ?, placa = ?, marca = ?, modelo = ?, serial = ?, fecha = ?, tecnico = ?, 
  tipo_mantenimiento = ?, estado = ?, ubicacion = ?, centro_costo = ?, url_ticket = ?, observaciones = ?
  WHERE id = ?";

$stmt = $conexion->prepare($sql);
if (!$stmt) {
  echo json_encode(['success' => false, 'error' => '❌ Error en prepare: ' . $conexion->error]);
  exit;
}

$stmt->bind_param(
  "sssssssssssssi",
  $tipo,
  $placa,
  $marca,
  $modelo,
  $serial,
  $fecha,
  $tecnico,
  $tipo_mantenimiento,
  $estado,
  $ubicacion,
  $centro_costo,
  $url_ticket,
  $observaciones,
  $id
);

if ($stmt->execute()) {
  echo json_encode(['success' => true, 'mensaje' => '✅ Registro actualizado correctamente']);
} else {
  echo json_encode(['success' => false, 'error' => '❌ Error al actualizar: ' . $stmt->error]);
}

$stmt->close();
$conexion->close();
