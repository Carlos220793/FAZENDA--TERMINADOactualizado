<?php
session_start();
if (empty($_SESSION['admin'])) {
  header("Location: /mantenimientos/index.html");
  exit;
}


$cx = new mysqli("10.110.6.148", "BaseDatos", "sysadm1n2207", "mantenimientos");
if ($cx->connect_error) die("Error: " . $cx->connect_error);

$tabla  = $_POST['tabla']  ?? '';
$nombre = $_POST['nombre'] ?? '';

$nombre = trim($nombre);
$nombre = preg_replace('/\s+/', ' ', $nombre); // limpia espacios dobles

if ($tabla === '' || $nombre === '') {
  header("Location: panel_admin.php?msg=faltan_datos&tabla=$tabla"); exit;
}

/* Evita insertar si ya existe (case sensitive igual a la BD; si quieres case-insensitive
   cambia la collation de la columna a *_ci o usa LOWER(nombre)=LOWER(?) ) */
$chk = $cx->prepare("SELECT 1 FROM $tabla WHERE nombre = ?");
$chk->bind_param("s", $nombre);
$chk->execute();
$chk->store_result();

if ($chk->num_rows > 0) {
  header("Location: panel_admin.php?msg=duplicado&tabla=$tabla"); exit;
}

$ins = $cx->prepare("INSERT INTO $tabla (nombre) VALUES (?)");
$ins->bind_param("s", $nombre);
if (!$ins->execute()) {
  header("Location: panel_admin.php?msg=error&tabla=$tabla"); exit;
}

header("Location: panel_admin.php?msg=ok&tabla=$tabla");
