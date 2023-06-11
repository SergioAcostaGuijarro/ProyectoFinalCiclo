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
   function abrir(id_alumno) {
    var divId = "pitola_" + id_alumno;
    var div = document.getElementById(divId);
    if (div) {
        div.style.display = "block";
    }
    var notaInputId = "nota_" + id_alumno;
    var notaInput = document.getElementById(notaInputId);
    if (notaInput) {
        notaInput.focus();
    }
}

    function cerrar(id_alumno) {
        var divId = "pitola_" + id_alumno;
        var div = document.getElementById(divId);
        if (div) {
            div.style.display = "none";
        }
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
                <div class="card" style="width: 100%;">
				<form method="post">
					<select name="evaluacion" id="evaluacion" style="min-width: 25%;" required>
						<option value="EVALUACIÓN" hidden>---</option>
						<option value="primer_ev" <?php if(isset($_POST['evaluacion']) && $_POST['evaluacion'] == 'primer_ev') echo 'selected'; ?>>Primera EV</option>
						<option value="segunda_ev" <?php if(isset($_POST['evaluacion']) && $_POST['evaluacion'] == 'segunda_ev') echo 'selected'; ?>>Segunda EV</option>
						<option value="tercer_ev" <?php if(isset($_POST['evaluacion']) && $_POST['evaluacion'] == 'tercer_ev') echo 'selected'; ?>>Tercera EV</option>
					</select>
					<input type="submit" value="Mostrar" name="mostrar" class="btn btn--primary">
				</form>

					<?php
					if (isset($_POST['mostrar'])) {
						// Obtener el id del profesor a partir del correo de inicio de sesión
						$correo = $_SESSION['correo'];
						$conexion = mysqli_connect("db", "root", "rootroot", "educados") or die("No se puede conectar con el servidor");
						$instruccion = "SELECT id_usuario FROM profesor WHERE correo = '$correo'";
						$consulta = mysqli_query($conexion, $instruccion) or die("Fallo en la consulta");
						$id_profesor = mysqli_fetch_array($consulta)['id_usuario'];
					
						// Obtener la materia seleccionada
						if (isset($_GET['materia'])) {
							$materia = urldecode($_GET['materia']);
						} else {
							print("Debe seleccionar una materia.");
							exit();
						}
					
						// Obtener las calificaciones filtradas por materia y evaluación
						$evaluacion = $_POST['evaluacion'];
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
							echo "<table style='border-collapse: collapse;'>";
							echo "<tr>";
							echo "<th>MATERIA</th>";
							echo "<th>ID_ALUMNO</th>";
							echo "<th>ALUMNO</th>";
							echo "<th>NOTA</th>";
							echo "<th>INGRESAR</th>";
							echo "</tr>";
							while ($resultado = mysqli_fetch_array($consulta)) {
								echo "<tr>";
								echo "<td>";
								echo $resultado['materia'];
								echo "</td>";
								echo "<td>";
								echo $resultado['id_alumno'];
								echo "</td>";
								echo "<td>";
								echo $resultado['alumno'];
								echo "</td>";
								if ($evaluacion == "primer_ev") {
									$nota = $resultado['primer_ev'];
									echo "<td>" . ($nota != 0 ? $nota : 'N/A') . "</td>";
								} elseif ($evaluacion == "segunda_ev") {
									$nota = $resultado['segunda_ev'];
									echo "<td>" . ($nota != 0 ? $nota : 'N/A') . "</td>";
								} elseif ($evaluacion == "tercer_ev") {
									$nota = $resultado['tercer_ev'];
									echo "<td>" . ($nota != 0 ? $nota : 'N/A') . "</td>";
								}
								echo "<td>";
								echo "<input type='submit' class='nota' name='nota' value='Nota' onclick='abrir(" . $resultado['id_alumno'] . ")'>";
								echo "</td>";
								echo "</tr>";
								echo "<tr>";
								echo "<td colspan='5' style='display: none;' id='pitola_" . $resultado['id_alumno'] . "'>";
									echo "<div class='dashboard__item' style='width: 250%;'>";
										echo "<div class='card''>";
											echo "<div>";
												echo "<form action='calificaciones4.php' method='post' onsubmit='return validar()'>";
													echo "<h5>Nota para " . $resultado['alumno'] . " en " . $evaluacion . "</h5>";
													echo "<p>Nota: <input type='text' id='nota' name='nota' required></p>";
													echo "<p>Actitud: <input type='text' id='actitud' name='actitud' required></p>";
													echo "<p>Comentario: <input type='text' id='comentario' name='comentario' required></p>";
													echo "<input type='hidden' name='id_profesor' value='" . $id_profesor . "'>";
													echo "<input type='hidden' name='curso' value='" . $curso . "'>";
													echo "<input type='hidden' name='materia' value='" . $materia . "'>";
													echo "<input type='hidden' name='evaluacion' value='" . $evaluacion . "'>";
													echo "<input type='hidden' name='id_alumno' value='" . $resultado['id_alumno'] . "'>";
													echo "<input type='submit' name='guardar' value='GUARDAR'>";
												echo "</form>";
												echo "<input type='button' name='comprobar' value='CANCELAR' onclick='cerrar(" . $resultado['id_alumno'] . ")'>";
											echo "</div>";
										echo "</div>";
									echo "</div>";
								echo "</td>";
								echo "</tr>";
							}
							echo "</table>";
						} else {
							echo "Seleccione una evaluación.";
						}
						mysqli_close($conexion);
					}
					?>
<style>
table {
    width: 100%;
    border-collapse: collapse;
}

th,
td {
    padding: 8px;
    text-align: left;
    border-bottom: 1px solid #ddd;
}

tr:hover {
    background-color: #f2f2f2;
}
</style>
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