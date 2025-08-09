<?php
include '../conexion.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $nombre = mysqli_real_escape_string($conexion, $_POST['nombre']);
    $sql = "INSERT INTO tipo_equipo (nombre) VALUES ('$nombre')";
    mysqli_query($conexion, $sql);
    header("Location: admin_tipo_equipo.php");
}
?>
