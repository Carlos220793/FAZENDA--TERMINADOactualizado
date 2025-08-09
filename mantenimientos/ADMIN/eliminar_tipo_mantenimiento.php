<?php
include '../conexion.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $id = intval($_POST['id']);
    $sql = "DELETE FROM tipo_mantenimiento WHERE id = $id";
    mysqli_query($conexion, $sql);
    header("Location: admin_tipo_mantenimiento.php");
}
?>
