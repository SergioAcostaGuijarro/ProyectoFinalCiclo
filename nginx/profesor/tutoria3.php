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
        <script src="https://cdnjs.cloudflare.com/ajax/libs/html2pdf.js/0.10.1/html2pdf.bundle.min.js"></script>
	    <script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.17.0/xlsx.full.min.js"></script>
        <script src="./export.js"></script>
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
                        <option value="EVALUACIÓN" hidden>---</option>
                        <option value="primer_ev" <?php if(isset($_POST['evaluacion']) && $_POST['evaluacion'] == 'primer_ev') echo 'selected'; ?>>Primera EV</option>
                        <option value="segunda_ev" <?php if(isset($_POST['evaluacion']) && $_POST['evaluacion'] == 'segunda_ev') echo 'selected'; ?>>Segunda EV</option>
                        <option value="tercer_ev" <?php if(isset($_POST['evaluacion']) && $_POST['evaluacion'] == 'tercer_ev') echo 'selected'; ?>>Tercera EV</option>
                        <option value="nota_media" <?php if(isset($_POST['evaluacion']) && $_POST['evaluacion'] == 'nota_media') echo 'selected'; ?>>Final curso</option>
                    </select>
                    <input type="hidden" name="id_alumno" value="<?php echo $_POST['id_alumno']; ?>">
                    <input type="submit" value="Mostrar" name="mostrar" class="btn btn--primary">
                </form>

					</form>
                    <?php
                        $evaluacion = $_POST['evaluacion'];
                        $id_usuario = $_POST['id_alumno'];

                        // Obtener el id del profesor a partir del correo de inicio de sesión
                        $correo = $_SESSION['correo'];
                        $conexion = mysqli_connect("db", "root", "rootroot", "educados") or die("No se puede conectar con el servidor");
                        $instruccion = "SELECT id_usuario FROM profesor WHERE correo = '$correo'";
                        $consulta = mysqli_query($conexion, $instruccion) or die("Fallo en la consulta");
                        $id_profesor = mysqli_fetch_array($consulta)['id_usuario'];

                        $instruccion2 = "SELECT * FROM curso, materia, calificaciones WHERE curso.id_curso=materia.id_curso and materia.id_materia=calificaciones.id_materia AND tutor='$_SESSION[nombre]' AND id_alumno='$id_usuario'";
                        if ($evaluacion == "primer_ev") {
                            $instruccion2 .= " AND primer_ev IS NOT NULL";
                        } elseif ($evaluacion == "segunda_ev") {
                            $instruccion2 .= " AND segunda_ev IS NOT NULL";
                        } elseif ($evaluacion == "tercer_ev") {
                            $instruccion2 .= " AND tercer_ev IS NOT NULL";
                        } elseif ($evaluacion == "nota_media") {
                            $instruccion2 .= " AND nota_media IS NOT NULL";
                        } else {
                            $instruccion2 .= " AND 1=0"; // No se seleccionará ningún registro si no se ha elegido una evaluación
                        }

                        $consulta = mysqli_query($conexion, $instruccion2) or die("Fallo en la consulta");

                        $nfilas = mysqli_num_rows($consulta);
                        $curso = $resultado['curso'];
                        if ($nfilas > 0) {
                            print("<TABLE class='table'>\n");
                            print("<TR>\n");
                            print("<TH>ID</TH>\n");
                            print("<TH>MATERIA</TH>\n");
                            print("<TH>ALUMNO</TH>\n");
                            print("<TH>NOTA</TH>\n");
                            print("<TH>CURSO</TH>\n");
                            print("</TR>\n");

                            while ($resultado = mysqli_fetch_array($consulta)) {
                                print("<TR>\n");
                                print("<TD>" . $resultado['id_materia'] . "</TD>\n");
                                print("<TD>" . $resultado['materia'] . "</TD>\n");
                                print("<TD>" . $resultado['alumno'] . "</TD>\n");
                                if ($evaluacion == "primer_ev") {
                                    $nota = $resultado['primer_ev'];
                                    print("<TD>" . ($nota != 0 ? $nota : 'N/A') . "</TD>\n");
                                } elseif ($evaluacion == "segunda_ev") {
                                    $nota = $resultado['segunda_ev'];
                                    print("<TD>" . ($nota != 0 ? $nota : 'N/A') . "</TD>\n");
                                } elseif ($evaluacion == "tercer_ev") {
                                    $nota = $resultado['tercer_ev'];
                                    print("<TD>" . ($nota != 0 ? $nota : 'N/A') . "</TD>\n");
                                } elseif ($evaluacion == "nota_media") {
                                    $nota = $resultado['nota_media'];
                                    print("<TD>" . ($nota != 0 ? $nota : 'N/A') . "</TD>\n");
                                } elseif ($evaluacion == "EVALUACIÓN") {
                                    print("<TD><p>Elija una evaluación</p></TD>\n");
                                }
                                print("<TD>" . $resultado['curso'] . "</TD>\n");
                                echo "<form method='post' action='tutoria3.php'>";
                                echo "  <input type='hidden' name='id_materia' value='" . $resultado['id_materia'] . "'>";
                                echo "  <input type='hidden' name='materia' value='" . $resultado['materia'] . "'>";
                                echo "  <input type='hidden' name='id_alumno' value='" . $resultado['id_alumno'] . "'>";
                                echo "  <input type='hidden' name='evaluacion' value='" . $evaluacion . "'>";
                                echo "  <input type='hidden' name='curso' value='" . $resultado['curso'] . "'>";

                                echo "</form>";
                            }
                            print("</TABLE>\n");

                            echo "<button onclick='generateExcel()'>Exportar a Excel</button><button onclick='generatePDF()'>Exportar a PDF</button>\n";
                        } else {
                            echo "<br>";
                            print("Tienes que elegir una evaluación");
                        }
                        mysqli_close($conexion);
                        ?>

                    </div>
                    </div>
                    <div class="dashboard__item">
            <div class="card">
          <strong>Nivel de la clase</strong>
        
          <?php
            $conexion2 = mysqli_connect("db", "root", "rootroot", "educados") or die("No se puede conectar con el servidor");
            $instruccion3 = "SELECT * FROM curso, materia, calificaciones WHERE curso.id_curso=materia.id_curso and materia.id_materia=calificaciones.id_materia AND tutor='$_SESSION[nombre]' AND id_alumno='$id_usuario'";
            $consulta2 = mysqli_query($conexion2, $instruccion3) or die("Fallo en la consulta");
            $resultado2 = mysqli_fetch_array($consulta2);

            $id_materia = $resultado2['id_materia'];
            $materia = $resultado2['materia'];
            $id_alumno = $resultado2['id_alumno'];
            $curso = $resultado2['curso'];

            // Conexión a la base de datos
            $servername = "db";
            $username = "root";
            $password = "rootroot";
            $dbname = "educados";

            $notaalumno = "(select COUNT(id_alumno) from calificaciones where id_alumno='$id_alumno')";
            $notaclase = "(select COUNT(id_alumno) from calificaciones, materia where 
            calificaciones.id_materia=materia.id_materia and curso='$curso')";
            $conn = mysqli_connect($servername, $username, $password, $dbname);

            // Consulta SQL
            if ($evaluacion == "primer_ev") {
                $sql = "SELECT SUM(primer_ev)/$notaalumno AS NotaAlumno, (SELECT sum(primer_ev)/$notaclase FROM 
                calificaciones, materia WHERE calificaciones.id_materia=materia.id_materia AND curso='$curso') AS 
                NotaClase FROM calificaciones WHERE id_alumno='$id_alumno'";
            } elseif ($evaluacion == "segunda_ev") {
                $sql = "SELECT SUM(segunda_ev)/$notaalumno AS NotaAlumno, (SELECT sum(segunda_ev)/$notaclase FROM 
                calificaciones, materia WHERE calificaciones.id_materia=materia.id_materia AND curso='$curso') AS 
                NotaClase FROM calificaciones WHERE id_alumno='$id_alumno'";
            } elseif ($evaluacion == "tercer_ev") {
                $sql = "SELECT SUM(tercer_ev)/$notaalumno AS NotaAlumno, (SELECT sum(tercer_ev)/$notaclase FROM 
                calificaciones, materia WHERE calificaciones.id_materia=materia.id_materia AND curso='$curso') AS 
                NotaClase FROM calificaciones WHERE id_alumno='$id_alumno'";
            } elseif ($evaluacion == "nota_media") {
                $sql = "SELECT SUM(nota_media)/$notaalumno AS NotaAlumno, (SELECT SUM(nota_media)/$notaclase FROM 
                calificaciones, materia WHERE calificaciones.id_materia=materia.id_materia AND curso='$curso') AS 
                NotaClase FROM calificaciones WHERE id_alumno='$id_alumno'";
            }

            // Ejecutar la consulta
            $resultado = mysqli_query($conn, $sql);

            if (mysqli_num_rows($resultado) > 0) {
                $fila = mysqli_fetch_assoc($resultado);
                $total_calificaciones = round($fila["NotaAlumno"]); // Redondear a valor entero
                $nota_media = round($fila["NotaClase"]); // Redondear a valor entero

                // Mostrar los resultados
                echo "<br>Nota alumno: " . $total_calificaciones . "<br>";
                echo "Media clase: " . $nota_media . "<br>";
            } else {
                echo "<br><br>No se encontraron resultados";
            }

            // Cerrar la conexión
            mysqli_close($conn);

            // Crear el gráfico de barras utilizando Google Charts
            ?>
<html>
<head>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
    google.charts.load('current', {'packages':['corechart']});
    google.charts.setOnLoadCallback(drawChart);

    function drawChart() {
    var data = google.visualization.arrayToDataTable([
        ['Calificaciones', 'Valor'],
        ['Calificaciones del alumno', <?php echo $total_calificaciones; ?>],
        ['Nota media', <?php echo $nota_media; ?>]
    ]);

    var options = {
        title: 'Comparación de calificaciones con la nota media',
        legend: { position: 'none' },
        chartArea: { width: '50%' },
        hAxis: {
        title: 'Valor',
        minValue: 0, // Establecer el valor mínimo en 0
        maxValue: 10, // Establecer el valor máximo en 10
        ticks: Array.from(Array(11).keys()) // Generar una matriz de 0 a 10 para las etiquetas del eje X
        },
        vAxis: {
        title: 'Calificaciones'
        },
        colors: ['red'] // Establecer el color de las barras a rojo
    };
    var chart = new google.visualization.BarChart(document.getElementById('chart_div'));
    chart.draw(data, options);
}
</script>
</head>
<body>
    <div id="chart_div" style="width: 100%; height: 500px;"></div>
</body>
        </html>
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