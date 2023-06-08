<?php
session_start();

$conexion = mysqli_connect("db", "root", "rootroot", "educados") or die("No se puede conectar con el servidor");
$resultado = mysqli_query($conexion, "SELECT * FROM calificaciones where id_alumno='$id'");
$resultado = mysqli_fetch_array($resultado);
?>

<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width,initial-scale=1.0">
		<title>PROFESOR GUI</title>
		<link rel="stylesheet" href="./style.css">

        <script>
            function abrir()
            {
                document.getElementById("pitola").style="display:block"
            }

			function cerrar()
            {
				document.getElementById("pitola").style="display:none"
            }          

			function validar() {
				var nota = document.getElementById("nota").value;
				var actitud = document.getElementById("actitud").value;
				var comentario = document.getElementById("comentario").value;

				if (nota == "") {
					document.getElementById("errorNota").style.display = "block";
					return false;
				}
				else {
					document.getElementById("errorNota").style.display = "none";
				}

				if (actitud == "") {
					document.getElementById("errorActitud").style.display = "block";
					return false;
				}
				else {
					document.getElementById("errorActitud").style.display = "none";
				}

				if (comentario == "") {
					document.getElementById("errorComentario").style.display = "block";
					return false;
				}
				else {
					document.getElementById("errorComentario").style.display = "none";
				}

				return true;
			}
        </script>
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
				<form method="post">
					<select name="evaluacion" id="evaluacion" style="min-width: 25%;" required>
						<option value="EVALUACIÓN">---</option>
						<option value="primer_ev">Primera EV</option>
						<option value="segunda_ev">Segunda EV</option>
						<option value="tercer_ev">Tercera EV</option>
					</select>
					<input type="submit" value="Mostrar" name="mostrar" class="btn btn--primary">
				</form>
			<?php
			if (isset($_POST['mostrar'])) {
			$evaluacion = $_POST['evaluacion'];

				// Obtener el id del profesor a partir del correo de inicio de sesión
				$correo = $_SESSION['correo'];
				$conexion = mysqli_connect("db", "root", "rootroot", "educados") or die("No se puede conectar con el servidor");
				$instruccion = "SELECT id_usuario FROM profesor WHERE correo = '$correo'";
				$consulta = mysqli_query($conexion, $instruccion) or die("Fallo en la consulta");
				$id_profesor = mysqli_fetch_array($consulta)['id_usuario'];

                $materia = $resultado['materia'];
				// Obtener todos los cursos a los que pertenece el profesor
				if (isset($_GET['materia'])) {
                    $materia = urldecode($_GET['materia']);
                } else {
                    print("Debe seleccionar una materia.");
                    exit();
                }
                // Obtener las calificaciones filtradas por materia y evaluación
				$instruccion2 = "SELECT * FROM calificaciones, alumno WHERE id_alumno=id_usuario AND materia = '$materia'";
				if ($evaluacion == "primer_ev") {
					$instruccion2 .= " AND primer_ev IS NOT NULL";
				} elseif ($evaluacion == "segunda_ev") {
					$instruccion2 .= " AND segunda_ev IS NOT NULL";
				} elseif ($evaluacion == "tercer_ev") {
					$instruccion2 .= " AND tercer_ev IS NOT NULL";
				} else {
					$instruccion2 .= " AND 1=0"; // No se seleccionará ningún registro si no se ha elegido una evaluación
				}
				$consulta = mysqli_query($conexion, $instruccion2) or die("Fallo en la consulta");

				$nfilas = mysqli_num_rows($consulta);
				if ($nfilas > 0) {
					print("<TABLE class='table'>\n");
					print("<TR>\n");
					print("<TH>ID</TH>\n");
					print("<TH>MATERIA</TH>\n");
                    print("<TH>ID_ALUMNO</TH>\n");
                    print("<TH>ALUMNO</TH>\n");
                    print("<TH>CORREO</TH>\n");
					print("<TH>NOTA</TH>\n");
                    print("<TH>INGRESAR</TH>\n");
					print("</TR>\n");

					while ($resultado = mysqli_fetch_array($consulta)) {
						print("<TR>\n");
						print("<TD>" . $resultado['id_calificaciones'] . "</TD>\n");
						print("<TD>" . $resultado['materia'] . "</TD>\n");
                        print("<TD>" . $resultado['id_alumno'] . "</TD>\n");
                        print("<TD>" . $resultado['alumno'] . "</TD>\n");
                        print("<TD>" . $resultado['correo'] . "</TD>\n");
                        if ($evaluacion == "primer_ev") {
							$nota = $resultado['primer_ev'] ? $resultado['primer_ev'] : 'N/A';
							print("<TD>" . $nota . "</TD>\n");
						} elseif ($evaluacion == "segunda_ev") {
							$nota = $resultado['segunda_ev'] ? $resultado['segunda_ev'] : 'N/A';
							print("<TD>" . $nota . "</TD>\n");
						} elseif ($evaluacion == "tercer_ev") {
							$nota = $resultado['tercer_ev'] ? $resultado['tercer_ev'] : 'N/A';
							print("<TD>" . $nota . "</TD>\n");
						}						
						print("<TD><input type='submit' class='nota' name='nota' value='Nota' onclick='abrir()'></TD>\n");
                        print("</TR>\n");
					}
					print("</TABLE>\n");
				} else {
					print("Seleccione una evaluación.");
				}
			}
			?>
			</div>
		</div>
		<div class="dashboard__item">
        <div class="card" id="pitola" style="display: none;">
            <div>
			<form action="calificaciones4.php" method="post" onsubmit="return validar()">
				<h5>Nota para <?php echo "<h5>$resultado[alumno]</h5>"; ?></h5>
				<p>Nota: <input type="text" id="nota" name="nota"></p>
				<span id="errorNota" style="color:red;display:none;">Ingrese una nota válida.</span>
				<p>Actitud: <input type="text" id="actitud" name="actitud"></p>
				<span id="errorActitud" style="color:red;display:none;">Ingrese una actitud válida.</span>
				<p>Comentario: <input type="text" id="comentario" name="comentario"></p>
				<span id="errorComentario" style="color:red;display:none;">Ingrese un comentario válido.</span>
				<input type="submit" value="Guardar">
			</form>
				<input type="submit" name="comprobar" class="botones" value="CANCELAR" onclick="cerrar()">
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