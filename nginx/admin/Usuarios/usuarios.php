<?php
session_start();
 
?>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width,initial-scale=1.0">
    <title>ADMIN GUI</title>
    <link rel="stylesheet" href="../style.css">
  </head>
  <body>
  <div class="admin">
  <header class="admin__header">
    <a href="./adminindex.php" class="logo">
      <?php echo "<h1>$_SESSION[nombre]</h1>"; ?>
    </a>
    <div class="toolbar">
      <button class="btn  btn--primary">Foro clase</button>
      <a href="../../cerrar_sesion.php" class="logout"><img src="../img/cerrar-sesion.png"></a>
    </div>
  </header>
  <nav class="admin__nav">
    <ul class="menu">
      <li class="menu__item">
        <a class="menu__link" href="../adminindex.php">Menú principal</a>
      </li>
      <li class="menu__item">
        <a class="menu__link" href="./usuarios.php">Índice</a>
      </li>
      <li class="menu__item">
        <a class="menu__link" href="./añadiru.php">Añadir usuario</a>
      </li>
      <li class="menu__item">
        <a class="menu__link" href="./eliminaru.php">Eliminar usuario</a>
      </li>
      <li class="menu__item">
        <a class="menu__link" href="./actualizaru.php">Modificar usuario</a>
      </li>
    </ul>
  </nav>
  <main class="admin__main">
    <div class="dashboard">
    <div class="dashboard__item">
        <div class="card">
          <strong>Usuarios</strong>
        </div>
      </div>
      <div class="dashboard__item dashboard__item--full">
        <div class="card">
          <form action="buscaru2.php" method="post">
            <h5><pre>Buscar: <input type="email" placeholder="Correo..." name="email"> <input type="Submit" value="Buscar" name="buscar" class="btn  btn--primary"></pre></h5>
          </form>
        <?PHP
        $conexion = mysqli_connect("db", "root", "rootroot", "educados") or die("No se puede conectar con el servidor"); 
        $email = isset($_POST['email']) ? $_POST['email'] : '';
        $tipo_usuario = isset($_POST['tipo_usuario']) ? $_POST['tipo_usuario'] : 'nombre';
        $instruccion = "select * from usuario WHERE tipo_usuario IN ('alumno', 'padre')";
        $consulta = mysqli_query($conexion, $instruccion) or die("Fallo en la consulta");
        
        $nfilas = mysqli_num_rows($consulta);
        if ($nfilas > 0) {
           print("<TABLE class='table'>\n");
           print("<TR>\n");
           print("<TH>ID</TH>\n");
           print("<TH>NOMBRE</TH>\n");
           print("<TH>CORREO</TH>\n");
           print("<TH>TIPO USER</TH>\n");
           print("</TR>\n");
  
           for ($i = 0; $i < $nfilas; $i++) {
              $resultado = mysqli_fetch_array($consulta);
              print("<TR>\n");
              print("<TD>" . $resultado['id_usuario'] . "</TD>\n");
              print("<TD>" . $resultado['nombre'] . "</TD>\n");
              print("<TD>" . $resultado['correo'] . "</TD>\n");
              print("<TD>" . $resultado['tipo_usuario'] . "</TD>\n");
              print("</TR>\n");
           }
           print("</TABLE>\n");
        } else {
           print("No hay usuarios disponibles para mostrar");
        }
        mysqli_close($conexion);
        ?>
        </div>
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