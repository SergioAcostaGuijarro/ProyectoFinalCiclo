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
          <strong>Nivel de la clase</strong>
          <?php
// Conexión a la base de datos
$servername = "localhost";
$username = "root";
$password = "rootroot";
$dbname = "educados";

$conn = mysqli_connect($servername, $username, $password, $dbname);

// Consulta para obtener la suma de calificaciones y la nota media
$sql = "SELECT SUM(primer_ev + segunda_ev + tercer_ev) AS total_calificaciones, AVG(primer_ev + segunda_ev + tercer_ev) AS nota_media FROM calificaciones";
$resultado = mysqli_query($conn, $sql);

if (mysqli_num_rows($resultado) > 0) {
    $fila = mysqli_fetch_assoc($resultado);
    $total_calificaciones = $fila["total_calificaciones"];
    $nota_media = $fila["nota_media"];
} else {
    echo "No se encontraron resultados";
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
          ['Calificaciones de los alumnos', <?php echo $total_calificaciones; ?>],
          ['Nota media', <?php echo $nota_media; ?>]
        ]);

        var options = {
          title: 'Comparación de calificaciones con la nota media',
          legend: { position: 'none' },
          chartArea: { width: '50%' },
          hAxis: {
            title: 'Valor',
            minValue: 0
          },
          vAxis: {
            title: 'Calificaciones'
          }
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
        </div>
      </div>
      <div class="dashboard__item">
        <div class="card">
            <strong>Calendario</strong>
            <iframe src="https://calendar.google.com/calendar/embed?height=600&wkst=2&bgcolor=%23ffffff&ctz=Europe%2FMadrid&showTz=0&showCalendars=0&showTabs=0&showTitle=0&title=EDUCADOS&showNav=1&showDate=1&showPrint=1&mode=MONTH&src=YWNvc3RhZ3VpamFycm9zZXJnaW9AZ21haWwuY29t&src=Y19jbGFzc3Jvb21jYjE3ZGZkNUBncm91cC5jYWxlbmRhci5nb29nbGUuY29t&src=ZXMuc3BhaW4jaG9saWRheUBncm91cC52LmNhbGVuZGFyLmdvb2dsZS5jb20&src=NzRjNGx1bm5sbDVmNDFmNWY5cjZwOWlpZGxoY3QzN2pAaW1wb3J0LmNhbGVuZGFyLmdvb2dsZS5jb20&color=%23039BE5&color=%230047a8&color=%230B8043&color=%23D81B60" style="border-width:0" width="750" height="600" frameborder="0" scrolling="no"></iframe>        </div>
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