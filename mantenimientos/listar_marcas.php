<?php
error_reporting(E_ALL);
ini_set('display_errors', 1);

$conexion = new mysqli("10.110.6.148", "BaseDatos", "sysadm1n2207", "mantenimientos");



if ($conexion->connect_error) {
    die("❌ Error de conexión: " . $conexion->connect_error);
}

$sql = "SELECT nombre FROM marca";
$resultado = mysqli_query($conexion, $sql);

if (!$resultado) {
    die("❌ Error en la consulta: " . mysqli_error($conexion));
}

$datos = [];
while ($row = mysqli_fetch_assoc($resultado)) {
    $datos[] = $row['nombre'];
}

header('Content-Type: application/json');
echo json_encode($datos);
?>
