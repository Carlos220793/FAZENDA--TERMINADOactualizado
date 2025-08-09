<?php
include '../conexion.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $id = intval($_POST['id']);
    $sql = "DELETE FROM tecnico WHERE id = $id";
    mysqli_query($conexion, $sql);
    header("Location: admin_tecnico.php");
}
?>
