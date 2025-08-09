<?php
session_start();

header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=utf-8");

$usuarioAdmin  = "Administrator";
$claveAdmin    = "Adm1n#2025";

$usuarioNormal = "Administrador";  
$claveNormal   = "sysadm1n";        

// Leer JSON del fetch
$input = json_decode(file_get_contents("php://input"), true) ?? [];
$u = $input["usuario"] ?? "";
$c = $input["clave"]   ?? "";

// 1) Validar ADMIN
if ($u === $usuarioAdmin && $c === $claveAdmin) {
  $_SESSION["autenticado"] = true;
  $_SESSION["admin"] = true;             
  echo json_encode(["success" => true, "role" => "admin"]);
  exit;
}

// 2) Validar USUARIO NORMAL
if ($u === $usuarioNormal && $c === $claveNormal) {
  $_SESSION["autenticado"] = true;
  unset($_SESSION["admin"]);           
  echo json_encode(["success" => true, "role" => "user"]);
  exit;
}
// después de validar credenciales:
$_SESSION['user_id']   = $row['id'];        // o el nombre real de tu PK
$_SESSION['user_name'] = $row['nombre'];    // o 'usuario'
$_SESSION['id_sede']   = (int)$row['id_sede']; // CLAVE

// 3) Falló
echo json_encode(["success" => false, "error" => "Usuario o contraseña no válidos"]);
