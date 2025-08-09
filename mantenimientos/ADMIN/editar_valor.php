<?php
session_start();
if (empty($_SESSION['admin'])) {
  header("Location: /mantenimientos/index.html");
  exit;
}

$cx = new mysqli("10.110.6.148", "BaseDatos", "sysadm1n2207", "mantenimientos");
if ($cx->connect_error) {
  header("Location: panel_admin.php?msg=error");
  exit;
}

$tabla  = $_POST['tabla']  ?? '';
$id     = intval($_POST['id'] ?? 0);
$nombre = trim($_POST['nombre'] ?? '');
$nombre = preg_replace('/\s+/', ' ', $nombre);

if ($tabla === '' || $id <= 0 || $nombre === '') {
  header("Location: panel_admin.php?msg=faltan_datos&tabla=$tabla");
  exit;
}

/* Evitar renombrar a uno existente */
$chk = $cx->prepare("SELECT id FROM $tabla WHERE nombre = ? AND id <> ?");
$chk->bind_param("si", $nombre, $id);
$chk->execute();
$chk->store_result();
if ($chk->num_rows > 0) {
  header("Location: panel_admin.php?msg=duplicado&tabla=$tabla");
  exit;
}

/* Actualizar */
$upd = $cx->prepare("UPDATE $tabla SET nombre = ? WHERE id = ?");
$upd->bind_param("si", $nombre, $id);
if ($upd->execute()) {
  header("Location: panel_admin.php?msg=ok_edit&tabla=$tabla");
  exit;
}

header("Location: panel_admin.php?msg=error&tabla=$tabla");
exit;
