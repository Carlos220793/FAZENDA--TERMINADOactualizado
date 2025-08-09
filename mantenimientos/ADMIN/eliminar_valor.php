
<?php
session_start();
if (empty($_SESSION['admin'])) {
  header("Location: /mantenimientos/index.html");
  exit;
}

$conexion = new mysqli("10.110.6.148", "BaseDatos", "sysadm1n2207", "mantenimientos");

if ($conexion->connect_error) die("Error: " . $conexion->connect_error);

$tabla = $_POST['tabla'];
$id = $_POST['id'];

$stmt = $conexion->prepare("DELETE FROM $tabla WHERE id=?");
$stmt->bind_param("i", $id);
$stmt->execute();

header("Location: panel_admin.php");
