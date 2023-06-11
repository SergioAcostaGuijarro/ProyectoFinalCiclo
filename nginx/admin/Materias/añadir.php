<?php
session_start();
$conexion = mysqli_connect("db", "root", "rootroot", "educados") or die("No se puede conectar con el servidor");
$instruccion = "SELECT curso FROM curso";
$consulta = mysqli_query($conexion, $instruccion) or die("Fallo en la consulta");
$cursos = array();
while ($resultado = mysqli_fetch_array($consulta)) {
    $cursos[] = $resultado['curso'];
}
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
    <a href="adminindex.php" class="logo">
      <?php echo "<h1>$_SESSION[usuario]</h1>"; ?>
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
        <a class="menu__link" href="./materias.php">Índice</a>
      </li>
      <li class="menu__item">
        <a class="menu__link" href="./añadirc.php">Añadir curso</a>
      </li>
      <li class="menu__item">
        <a class="menu__link" href="./eliminarc.php">Eliminar curso</a>
      </li>
      <li class="menu__item">
        <a class="menu__link" href="./añadir.php">Añadir materia</a>
      </li>
      <li class="menu__item">
        <a class="menu__link" href="./eliminarm.php">Eliminar materia</a>
      </li>
      <li class="menu__item">
        <a class="menu__link" href="./actualizarm.php">Modificar materia</a>
      </li>
    </ul>
  </nav>
  <main class="admin__main">
    <div class="dashboard">
      <div class="dashboard__item dashboard__item--full">
        <div class="card">
        <h5>Añadir materia</h5>
        <form action="añadir2.php" method="POST">
          <input type="text" name="materia" id="materia" placeholder="Materia" required/>
          <input type="text" name="profesor" id="profesor" placeholder="Profesor" required/>
          <select name="curso" id="curso" required>
            <option value="---">---</option>
            <?php foreach ($cursos as $curso) { ?>
              <option value="<?php echo $curso; ?>"><?php echo $curso; ?></option>
            <?php } ?>
          </select>
          <input type="submit" value="Añadir" name="añadir"  class="btn  btn--primary">
        </form>
            <?php
                $conexion = mysqli_connect("db", "root", "rootroot") or die("No se puede conectar con el servidor");
                mysqli_select_db($conexion, "educados") or die("No se puede seleccionar la base de datos");

                $instruccion = "SELECT * from materia";
                $consulta = mysqli_query($conexion, $instruccion) or die("Fallo en la consulta");
                $nfilas = mysqli_num_rows($consulta);
                if ($nfilas > 0) {
                    print("<TABLE class='table'>\n");
                    print("<TR>\n");
                    print("<TH>MATERIA</TH>\n");
                    print("<TH>PROFESOR</TH>\n");
                    print("<TH>CURSO</TH>\n");    
                    print("</TR>\n");

                for ($i = 0; $i < $nfilas; $i++) {
                    $resultado = mysqli_fetch_array($consulta);
                    print("<TR>\n");
                    print("<TD>" . $resultado['materia'] . "</TD>\n");
                    print("<TD>" . $resultado['profesor'] . "</TD>\n");
                    print("<TD>" . $resultado['curso'] . "</TD>\n");
                    print("</TR>\n");
                }
                print("</TABLE>\n");
            } else {
                print("No hay materias disponibles para mostrar");
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

<?php
mysqli_close($conexion);
?>