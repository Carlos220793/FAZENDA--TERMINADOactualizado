<?php
session_start();
$_SESSION = [];
session_destroy();

// Redirigir al login
header("Location: /mantenimientos/index.html"); // cambia a /mantenimiento/ si es singular
exit;
