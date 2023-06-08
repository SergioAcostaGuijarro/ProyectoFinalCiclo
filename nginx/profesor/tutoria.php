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
			<form action="calificaciones2.php" method="post">
			</form>
			<?php
			// Obtener el id del profesor a partir del correo de inicio de sesión
			$correo = $_SESSION['correo'];
			$conexion = mysqli_connect("localhost", "root", "rootroot", "educados") or die("No se puede conectar con el servidor");
			$instruccion = "SELECT id_usuario FROM profesor WHERE correo = '$correo'";
			$consulta = mysqli_query($conexion, $instruccion) or die("Fallo en la consulta");
			$id_profesor = mysqli_fetch_array($consulta)['tutor'];

			// Obtener todos los cursos a los que pertenece el profesor
			$instruccion2 = "SELECT * FROM curso WHERE tutor = '$_SESSION[nombre]'";
			$consulta = mysqli_query($conexion, $instruccion2) or die("Fallo en la consulta");

			$nfilas = mysqli_num_rows($consulta);
			if ($nfilas > 0) {
				print("<TABLE class='table'>\n");
				print("<TR>\n");
				print("<TH>ID</TH>\n");
				print("<TH>CURSO</TH>\n");
				print("<TH>ACCEDER</TH>\n");
				print("</TR>\n");

				while ($resultado = mysqli_fetch_array($consulta)) {
					print("<TR>\n");
					print("<TD>" . $resultado['id_curso'] . "</TD>\n");
					print("<TD>" . $resultado['curso'] . "</TD>\n");
					print("<TD><a href='tutoria2.php'><button title='Notas'><img src='./img/acceso.png' width='35%'></button></a></TD>\n");
					print("</TR>\n");
				}
				print("</TABLE>\n");
			} else {
				print("No tienes cursos asignados como tutor.");
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