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
    </ul>
  </nav>
  <main class="admin__main">
      <div class="dashboard__item">
        <div class="card">
          <form class="padre-hijo" action="registrar_hijo2.php" method="post">
          <?php echo "<h4>HOLA, $_SESSION[nombre]</h4>"; ?>
                <h4>Como es tu primera vez, que tal si nos das los datos de tu hijo</h4>      
                <div class="form-group">
                    <label for="name">Nombre</label>
                    <input type="text" id="name" name="name" placeholder="Nombre..." required>
                </div>
                <div class="form-group">
                    <label for="email">Correo electrónico</label>
                    <input type="email" id="email" name="email" placeholder="Email..." required>
                </div>
                <div class="der">
                    <input type="Submit" value="Cambiar" name="entrar"  class="btn  btn--primary">
                </div>
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