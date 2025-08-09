<?php
include '../conexion.php'; // cambia la ruta si lo necesitas
session_start();
if ($_SESSION['rol'] !== 'admin') {
    header("Location: ../index.php");
    exit();
}
?>

<h2>Administrar Tipos de Equipo</h2>

<form action="agregar_tipo_equipo.php" method="POST">
    <input type="text" name="nombre" placeholder="Nuevo tipo de equipo" required>
    <button type="submit">Agregar</button>
</form>

<table border="1" style="margin-top: 20px;">
    <tr><th>ID</th><th>Nombre</th><th>Eliminar</th></tr>
    <?php
    $sql = "SELECT * FROM tipo_equipo";
    $result = mysqli_query($conexion, $sql);
    while ($row = mysqli_fetch_assoc($result)) {
        echo "<tr>
                <td>{$row['id']}</td>
                <td>{$row['nombre']}</td>
                <td>
                    <form action='eliminar_tipo_equipo.php' method='POST' style='display:inline'>
                        <input type='hidden' name='id' value='{$row['id']}'>
                        <button type='submit'>Eliminar</button>
                    </form>
                </td>
              </tr>";
    }
    ?>
</table>
