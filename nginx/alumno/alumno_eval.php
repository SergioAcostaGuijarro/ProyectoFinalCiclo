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
    </ul>
  </nav>
  <main class="admin__main">
      <div class="dashboard__item">
        <div class="card">
            <form class="alumno_eval2.php" action="alumno_eval2.php" method="post">
                <?php echo "<h4>Hola, $_SESSION[nombre]</h4>"; ?>
                <h4>¿Porqué no nos dices tu curso?:</h4>      
                <select name="curso" id="curso" style="width: 6%;" required>
                  <option value="---">---</option>
                  <?php foreach ($cursos as $curso) { ?>
                    <option value="<?php echo $curso; ?>"><?php echo $curso; ?></option>
                  <?php } ?>
                </select>
                <input type="submit" value="Añadir" name="añadir"  class="btn  btn--primary">
            </form>
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