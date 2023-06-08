<?php
session_start();
?>

<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width,initial-scale=1.0">
		<title>PROFESOR GUI</title>
		<link rel="stylesheet" href="./style.css">
	</head>
	<body>
	<div class="admin">
	<header class="admin__header">
		<a href="profesorindex.php" class="logo">
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
			<a class="menu__link" href='./calificaciones.php'>Calificaciones</a>
		</li>
		<li class="menu__item">
			<a class="menu__link" href='./incidencias.php'>Incidencias</a>
		</li>
		<li class="menu__item">
			<a class="menu__link" href='./boletines.php'>Boletines</a>
		</li>
		<li class="menu__item">
			<a class="menu__link" href='./tutoria.php'>Tutoría</a>
		</li>
		</ul>
	</nav>
	<main class="admin__main">
		<div class="dashboard">
		<div class="dashboard__item">
			<div class="card">
            <form action="boletines2.php" method="post" enctype="multipart/form-data">
                <label for="correo">Correo del alumno:</label>
                <input type="email" id="correo" name="correo" style="width: 40%;" required><br>

                <label for="archivo">Subir archivo:</label>
                <input type="file" id="archivo" name="archivo" accept=".pdf,.doc,.docx,.xlsx" required>

                <br><button type="submit">Aceptar</button>
            </form>
			</div>
		</div>
        <div class="dashboard__item">
			<div class="card">
            <form action="boletines3.php" method="post" enctype="multipart/form-data">
                <label for="correo">Correo del padre:</label>
                <input type="email" id="correo" name="correo" style="width: 40%;" required><br>

                <label for="archivo">Subir archivo:</label>
                <input type="file" id="archivo" name="archivo" accept=".pdf,.doc,.docx,.xlsx" required>

                <br><button type="submit">Aceptar</button>
            </form>
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