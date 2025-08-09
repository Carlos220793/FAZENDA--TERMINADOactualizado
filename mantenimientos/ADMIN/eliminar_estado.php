<?php
include '../conexion.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $id = intval($_POST['id']);
    $sql = "DELETE FROM estado WHERE id = $id";
    mysqli_query($conexion, $sql);
    header("Location: admin_estado.php");
}
?>
