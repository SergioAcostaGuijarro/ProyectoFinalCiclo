<?php
	session_start();
	$curso = $_GET['curso'];
	$materia = $_GET['materia'];
?>

<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width,initial-scale=1.0">
		<title>PROFESOR GUI</title>
		<link rel="stylesheet" href="./style.css">
	</head>	
	<script>
		function abrir(){
           document.getElementById("pitola").style="display:block"
        }
		function cerrar(){
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
    	if ( window.history.replaceState ) {
    		window.history.replaceState( null, null, window.location.href );
    	}
    </script>
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
							<option value="EVALUACIÓN" hidden >---</option>
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
							session_start();
							$correo = $_SESSION['correo'];
							$conexion = mysqli_connect("db", "root", "rootroot", "educados") or die("No se puede conectar con el servidor");
							$instruccion = "SELECT id_usuario FROM profesor WHERE correo = '$correo'";
							$consulta = mysqli_query($conexion, $instruccion) or die("Fallo en la consulta");
							$id_profesor = mysqli_fetch_array($consulta)['id_usuario'];

							$materia = $resultado['materia'];
							// Obtener la materia seleccionada
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
								print("<TH>MATERIA</TH>\n");
								print("<TH>ID_ALUMNO</TH>\n");
								print("<TH>ALUMNO</TH>\n");
								print("<TH>CORREO</TH>\n");
								print("<TH>NOTA</TH>\n");
								print("<TH>INGRESAR</TH>\n");
								print("</TR>\n");

								while ($resultado = mysqli_fetch_array($consulta)) {
									print("<TR>\n");
									print("<TD>" . $resultado['materia'] . "</TD>\n");
									print("<TD>" . $resultado['id_alumno'] . "</TD>\n");
									print("<TD>" . $resultado['alumno'] . "</TD>\n");
									print("<TD>" . $resultado['correo'] . "</TD>\n");
									if ($evaluacion == "primer_ev") {
										$nota = $resultado['primer_ev'];
										print("<TD>" . ($nota != 0 ? $nota : 'N/A') . "</TD>\n");
									} elseif ($evaluacion == "segunda_ev") {
										$nota = $resultado['segunda_ev'];
										print("<TD>" . ($nota != 0 ? $nota : 'N/A') . "</TD>\n");
									} elseif ($evaluacion == "tercer_ev") {
										$nota = $resultado['tercer_ev'];
										print("<TD>" . ($nota != 0 ? $nota : 'N/A') . "</TD>\n");
									}	
									print("<TD><input type='submit' class='nota' name='nota' value='Nota' onclick='abrir()'></TD>\n");
									print("</TR>\n");
									echo "<div class='dashboard__item'>";
									echo "<div class='card' id='pitola' style='display: none;'>";
										echo "<div>";
										echo "<form action='calificaciones4.php?materia=%' method='post' onsubmit='return validar()'>";
										echo "	<h5>Nota para ".$resultado['alumno']." en ".$evaluacion."</h5>";
										echo "	<p>Nota: <input type='text' id='nota' name='nota'></p>";
										echo "	<span id='errorNota' style='color:red;display:none;'>Ingrese una nota válida</span>";
										echo "	<p>Actitud: <input type='text' id='actitud' name='actitud'></p>";
										echo "	<span id='errorActitud' style='color:red;display:none;'>Ingrese una actitud válida</span>";
										echo "	<p>Comentario: <input type='text' id='comentario' name='comentario'></p>";
										echo "	<span id='errorComentario' style='color:red;display:none;'>Ingrese un comentario válido</span>";
										echo "	<input type='hidden' name='id_profesor' value='" . $id_profesor . "'>";
										echo "	<input type='hidden' name='curso' value='" . $curso . "'>";
										echo "	<input type='hidden' name='materia' value='" . $materia . "'>";
										echo "  <input type='hidden' name='evaluacion' value='" . $evaluacion . "'>";
										echo "  <input type='hidden' name='id_alumno' value='" . $resultado['id_alumno'] . "'>";								 
										echo "	<input type='submit' name='guardar' value='GUARDAR'>";
										echo "</form>";
										echo "	<input type='button' name='comprobar' value='CANCELAR' onclick='cerrar()'>";
										echo "</div>";
									echo " </div>";	
					?>
					<?php
									if (isset($_POST['guardar'])) {
										echo "<script language='javascript'>
										alert('hola') ;
										</script>"; 
										$nota = $_POST['nota'];
										$actitud = $_POST['actitud'];
										$comentario = $_POST['comentario'];
										$id_profesor = $_POST['id_profesor'];

										if ($evaluacion == 'primer_ev') {
											$query = "UPDATE calificaciones SET primer_ev = '$nota', comentario = '$comentario', actitud = '$actitud' WHERE id_alumno = " . $resultado['id_alumno'];
										} elseif ($evaluacion == 'segunda_ev') {
											$query = "UPDATE calificaciones SET segunda_ev = '$nota', comentario = '$comentario', actitud = '$actitud' WHERE id_alumno = " . $resultado['id_alumno'];
										} elseif ($evaluacion == 'tercer_ev') {
											$query = "UPDATE calificaciones SET tercer_ev = '$nota', comentario = '$comentario', actitud = '$actitud' WHERE id_alumno = " . $resultado['id_alumno'];
										}
										
										if (mysqli_query($conexion, $query)) {
											echo $query;
										} else {
											echo $query;
										}
									}
								}
								print("</TABLE>\n");
							} else {
								print("Seleccione una evaluación.");
							}
						}
							mysqli_close($conexion);
						?>
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