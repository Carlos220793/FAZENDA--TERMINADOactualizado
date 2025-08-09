<?php
session_start();
if (empty($_SESSION['admin'])) {
  header("Location: /mantenimientos/index.html");
  exit;
}

// Conexión
$conexion = new mysqli("10.110.6.148", "BaseDatos", "sysadm1n2207", "mantenimientos");
if ($conexion->connect_error) {
  die("❌ Error de conexión: " . $conexion->connect_error);
}

// Tablas que se van a administrar
$tablas = [
  "tipo_equipo"        => "Tipo de Equipo",
  "marca"              => "Marca",
  "modelo"             => "Modelo",
  "tecnico"            => "Técnico Responsable",
  "tipo_mantenimiento" => "Tipo de Mantenimiento",
  "estado"             => "Estado",
  "ubicacion"          => "Ubicación"
];
?>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width,initial-scale=1"/>
  <title>Panel Administrador</title>
  <style>
    :root{
      --bg:#f5f7fa; --card:#fff; --ink:#1f2937; --muted:#6b7280;
      --primary:#1976d2; --primary-600:#1565c0;
      --danger:#d32f2f; --danger-600:#b71c1c; --border:#e5e7eb;
    }
    *{box-sizing:border-box}
    html,body{height:100%}
    body{margin:0; background:var(--bg); color:var(--ink); font-family:Arial, Helvetica, sans-serif; font-size:14px;}

    /* Contenedor centrado */
    .container{
      max-width: 1500px;
      margin: 32px auto 60px;
      padding: 18px;
      background: var(--card);
      border: 1px solid var(--border);
      border-radius: 12px;
      box-shadow: 0 8px 20px rgba(15,23,42,.06);
    }

    h1{
      text-align:center; margin: 0 0 16px; font-size:20px;
    }
    .sub{ text-align:center; color:var(--muted); margin:0 0 18px; font-size:12px;}

    /* Alerta */
    #alerta{ border-radius:10px; padding:10px 12px; margin:10px 0 18px; font-size:13px }

    /* Tarjeta por tabla */
    .tabla-container{
      border:1px solid var(--border); border-radius:12px; padding:14px; margin: 18px 0 24px;
      background:#fff;
    }
    .tabla-container h2{ margin:0 0 10px; font-size:16px }

    /* Form agregar */
    .inline-form{ display:flex; gap:8px; align-items:center; flex-wrap:wrap; margin-bottom:10px }
    .input{
      height:32px; padding:0 10px; border:1px solid #d1d5db; border-radius:8px; font-size:13px; min-width:220px;
    }
    .btn{
      height:32px; padding:0 10px; border:none; border-radius:8px; font-size:12px; font-weight:600; cursor:pointer; transition:.2s;
    }
    .btn.primary{ background:var(--primary); color:#fff }
    .btn.primary:hover{ background:var(--primary-600) }
    .btn.danger{ background:var(--danger); color:#fff }
    .btn.danger:hover{ background:var(--danger-600) }

    /* Tabla compacta */
    .table-wrap{ overflow:auto; border:1px solid var(--border); border-radius:10px }
    table{ border-collapse:collapse; width:100%; background:#fff; font-size:13px }
    th, td{ padding:8px 10px; border-bottom:1px solid var(--border) }
    th{ background:#f9fafb; text-align:left; position:sticky; top:0; z-index:1 }
    tr:nth-child(even) td{ background:#fafafa }

    /* Acciones en fila */
    .acciones{ white-space:nowrap }
    .acciones form{ display:inline-flex; gap:8px; align-items:center; margin:0 8px 0 0 }
    .acciones input[type="text"]{ height:30px; padding:0 8px; border:1px solid #d1d5db; border-radius:8px; width:200px; font-size:13px }
    .acciones .btn{ height:30px; padding:0 10px }

    /* Botón fijo logout */
    .btn-logout{
      position:fixed; top:14px; right:18px; z-index:9999;
      background:var(--danger); color:#fff; padding:6px 12px; border-radius:8px;
      text-decoration:none; font-size:12px; font-weight:700; box-shadow:0 4px 14px rgba(0,0,0,.15)
    }
    .btn-logout:hover{ background:var(--danger-600) }

    @media (max-width:720px){
      .input{ min-width:180px }
      .acciones input[type="text"]{ width:160px }
    }
    /* Más espacio real para la última columna */
td.acciones { width: 460px !important; }

/* Acomodo de acciones: en fila, con espacio y sin que se aplasten */
.acciones{
  display: flex;
  gap: 10px;
  align-items: center;
  justify-content: flex-start;
  white-space: nowrap;           /* que no salten de línea */
}
.acciones form{ margin: 0; }     /* quitamos márgenes extra */
.acciones .btn{
  min-width: 74px;               /* evita que se achiquen */
  text-align: center;
}

/* Un pequeño colchón a la derecha para que no “toque” el borde */
.table-wrap{ padding-right: 8px; }
.titulo-admin {
  font-size: 38px;
  font-weight: 700;
  text-align: center;
  color: #1976d2;
  margin-bottom: 5px;
  animation: aparecer 1s ease-out forwards, brillo 3s linear infinite;
}

.subtitulo-admin {
  font-size: 14px;
  text-align: center;
  color: #555;
  margin-bottom: 25px;
  opacity: 0;
  animation: aparecer 1s ease-out forwards;
  animation-delay: 0.4s;
}

/* Animación de aparición suave */
@keyframes aparecer {
  0% {
    opacity: 0;
    transform: translateY(15px);
  }
  100% {
    opacity: 1;
    transform: translateY(0);
  }
}

/* Animación de brillo */
@keyframes brillo {
  0%, 100% {
    text-shadow: 0 0 5px #90caf9, 0 0 10px #64b5f6;
  }
  50% {
    text-shadow: 0 0 15px #64b5f6, 0 0 25px #42a5f5;
  }
}

  </style>
</head>
<body>
  <a href="../logout.php" class="btn-logout">🚪 Cerrar sesión</a>

  <div class="container">
    <h1 class="titulo-admin">Panel Administrator</h1>
<p class="subtitulo-admin">Gestiona o modifica los valores que usa en el formulario principal</p>

    <?php
      $mensaje = $_GET['msg'] ?? '';
      $tablaSel = $_GET['tabla'] ?? '';
      $textos = [
        'ok'           => 'Valor agregado correctamente.',
        'ok_edit'      => 'Valor actualizado correctamente.',
        'duplicado'    => 'Ese nombre ya existe.',
        'faltan_datos' => 'Faltan datos para completar la operación.',
        'error'        => 'Ocurrió un error, intenta de nuevo.'
      ];
      $clases = [
        'ok'           => 'background:#e8f5e9;border:1px solid #a5d6a7;color:#2e7d32;',
        'ok_edit'      => 'background:#e3f2fd;border:1px solid #90caf9;color:#1565c0;',
        'duplicado'    => 'background:#ffebee;border:1px solid #ef9a9a;color:#c62828;',
        'faltan_datos' => 'background:#fff3e0;border:1px solid #ffcc80;color:#ef6c00;',
        'error'        => 'background:#ffebee;border:1px solid #ef9a9a;color:#c62828;'
      ];
      if ($mensaje && isset($textos[$mensaje])): ?>
        <div id="alerta" style="<?= $clases[$mensaje] ?>">
          <?= htmlspecialchars($textos[$mensaje]) ?>
          <?php if ($tablaSel): ?>
            <span style="opacity:.7;margin-left:8px;">(Tabla: <?= htmlspecialchars($tablaSel) ?>)</span>
          <?php endif; ?>
        </div>
        <script>
          setTimeout(()=>{ var a=document.getElementById('alerta'); if(a) a.style.display='none'; }, 3500);
        </script>
    <?php endif; ?>

    <?php foreach ($tablas as $tabla => $titulo): ?>
      <div class="tabla-container" id="<?= $tabla ?>">
        <h2><?= $titulo ?></h2>

        <!-- Agregar -->
        <form method="POST" action="guardar_valor.php" class="inline-form">
          <input type="hidden" name="tabla" value="<?= $tabla ?>">
          <input class="input" type="text" name="nombre" placeholder="Nuevo valor" required>
          <button class="btn primary" type="submit">Agregar</button>
        </form>

        <!-- Tabla -->
        <div class="table-wrap">
          <table>
            <tr>
              <th style="width:80px">ID</th>
              <th>Nombre</th>
              <th style="width:460px">Acciones</th>

            </tr>
            <?php
              $res = $conexion->query("SELECT * FROM $tabla ORDER BY nombre");
              while ($fila = $res->fetch_assoc()):
            ?>
              <tr>
                <td><?= (int)$fila['id'] ?></td>
                <td><?= htmlspecialchars($fila['nombre']) ?></td>
                <td class="acciones">
                  <!-- Editar -->
                  <form method="POST" action="editar_valor.php" class="inline-form" style="margin:0;">
                    <input type="hidden" name="tabla" value="<?= $tabla ?>">
                    <input type="hidden" name="id" value="<?= (int)$fila['id'] ?>">
                    <input class="input" type="text" name="nombre" value="<?= htmlspecialchars($fila['nombre']) ?>" required>
                    <button class="btn primary" type="submit">Editar</button>
                  </form>

                  <!-- Eliminar -->
                  <form method="POST" action="eliminar_valor.php" style="display:inline;" onsubmit="return confirm('¿Seguro que deseas eliminar este valor?');">
                    <input type="hidden" name="tabla" value="<?= $tabla ?>">
                    <input type="hidden" name="id" value="<?= (int)$fila['id'] ?>">
                    <button class="btn danger" type="submit">Eliminar</button>
                  </form>
                </td>
              </tr>
            <?php endwhile; ?>
          </table>
        </div>
      </div>
    <?php endforeach; ?>

    <?php if (!empty($tablaSel)): ?>
      <script>
        const t = "<?= htmlspecialchars($tablaSel) ?>";
        const el = document.getElementById(t);
        if (el) el.scrollIntoView({ behavior: 'smooth', block: 'start' });
      </script>
    <?php endif; ?>
  </div>
</body>
</html>
