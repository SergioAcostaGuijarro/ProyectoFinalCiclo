<?php
session_start();
  
?>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width,initial-scale=1.0">
    <title>ADMIN GUI</title>
    <link rel="stylesheet" href="./style.css">
  </head>
  <body>
  <div class="admin">
  <header class="admin__header">
    <a href="adminindex.php" class="logo">
      <?php echo "<h1>$_SESSION[nombre]</h1>"; ?>
    </a>
    <div class="toolbar">
      <button class="btn btn--primary">Foro clase</button>
      <a href="../cerrar_sesion.php" class="logout"><img src="./img/cerrar-sesion.png"></a>
    </div>
  </header>
  <nav class="admin__nav">
    <ul class="menu">
      <li class="menu__item">
        <a class="menu__link" href="./Plantilla/plantilla.php">Plantilla</a>
      </li>
      <li class="menu__item">
        <a class="menu__link" href="./Usuarios/usuarios.php">Usuarios</a>
      </li>
      <li class="menu__item">
        <a class="menu__link" href="./Materias/materias.php">Materias</a>
      </li>
      <li class="menu__item">
        <a class="menu__link" href="#">Ajustes</a>
      </li>
    </ul>
  </nav>
  <main class="admin__main">
    <div class="dashboard">
      <div class="dashboard__item">
        <div class="card">
          <strong>Usuarios conectados</strong>
          <?php
            $servername = "db";
            $username = "root";
            $password = "rootroot";
            $dbname = "educados";
            
            // Crear una conexión
            $conn = new mysqli($servername, $username, $password, $dbname);
            
            // Verificar la conexión
            if ($conn->connect_error) {
                die("Error de conexión: " . $conn->connect_error);
            }
            
            
            $sql = "SELECT id_usuario, nombre, correo, tipo_usuario FROM usuario WHERE tipo_usuario = 'activo'";
            $result = $conn->query($sql);

            if ($result->num_rows > 0) {
                // Imprimir los resultados en una tabla HTML
                echo "<table>";
                echo "<tr><th>ID</th><th>Nombre</th><th>Correo</th><th>Tipo de usuario</th></tr>";

                while ($row = $result->fetch_assoc()) {
                    echo "<tr>";
                    echo "<td>" . $row["id_usuario"] . "</td>";
                    echo "<td>" . $row["nombre"] . "</td>";
                    echo "<td>" . $row["correo"] . "</td>";
                    echo "<td>" . $row["tipo_usuario"] . "</td>";
                    echo "</tr>";
                }

                echo "</table>";
            } else {
                echo "<br>No se encontraron usuarios con sesión activa.";
            }

            $conn->close();

          ?>
        </div>
      </div>
      <div class="dashboard__item">
        <div class="card">
          <iframe src="https://calendar.google.com/calendar/embed?height=500&wkst=2&bgcolor=%23ffffff&ctz=Europe%2FMadrid&mode=MONTH&showTz=0&showCalendars=0&showTabs=0&showPrint=1&showNav=1&showTitle=0&src=NDFhZDg2ODcwNzQxYzUxNTQ3NzA0MDI3YzU1M2M3MTU0ZDg0OWQ4YWY3ZjRmZTUyNDg3NjBjMTI3OWU0YjljZUBncm91cC5jYWxlbmRhci5nb29nbGUuY29t&src=ZXMuc3BhaW4jaG9saWRheUBncm91cC52LmNhbGVuZGFyLmdvb2dsZS5jb20&color=%23F6BF26&color=%230B8043" style="border-width:0" width="100%" height="500" frameborder="0" scrolling="no"></iframe>
        </div>
      </div>
  </main>
  <footer class="admin__footer">
    <ul class="ticker">
      <li class="ticker__item">La educación es el arma más poderosa que puedes usar para cambiar el mundo</li>
    </ul>
    <span>
      &copy; 2023 EducadosSA
    </span>
  </footer>
</div>
  </body>
</html>