<?php
include '../conexion.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $nombre = mysqli_real_escape_string($conexion, $_POST['nombre']);
    $sql = "INSERT INTO tecnico (nombre) VALUES ('$nombre')";
    mysqli_query($conexion, $sql);
    header("Location: admin_tecnico.php");
}
?>
