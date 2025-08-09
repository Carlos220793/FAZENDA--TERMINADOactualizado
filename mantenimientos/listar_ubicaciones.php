<?php
error_reporting(E_ALL);
ini_set('display_errors', 1);

$conexion = new mysqli("10.110.6.148", "BaseDatos", "sysadm1n2207", "mantenimientos");

if ($conexion->connect_error) {
    die("❌ Error de conexión: " . $conexion->connect_error);
}

$conexion->set_charset("utf8mb4"); // para acentos/ñ

$resultado = mysqli_query($conexion, "SELECT nombre FROM ubicacion ORDER BY nombre ASC");

$datos = [];
while ($row = mysqli_fetch_assoc($resultado)) {
    $datos[] = $row['nombre'];
}

header('Content-Type: application/json; charset=utf-8');
echo json_encode($datos);
