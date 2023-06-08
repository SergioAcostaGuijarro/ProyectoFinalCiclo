<?php
$curso = $_POST['curso'];
$materia = $_POST['materia'];
$id_profesor = $_POST['id_profesor'];

$nota = $_POST['nota'];
$actitud = $_POST['actitud'];
$comentario = $_POST['comentario'];
$evaluacion = $_POST['evaluacion'];
$id_alumno = $_POST['id_alumno'];
echo $id_alumno."Nota<br>";
$conexion = mysqli_connect("db", "root", "rootroot") or die("No se puede conectar con el servidor");
mysqli_select_db($conexion, "educados") or die("No se puede seleccionar la base de datos");

    if ($evaluacion == 'primer_ev') {
        $query = "UPDATE calificaciones SET primer_ev = '$nota', comentario = '$comentario', actitud = '$actitud' WHERE id_alumno = '$id_alumno' and materia = '$materia'";
    } elseif ($evaluacion == 'segunda_ev') {
        $query = "UPDATE calificaciones SET segunda_ev = '$nota', comentario = '$comentario', actitud = '$actitud' WHERE id_alumno = '$id_alumno' and materia = '$materia'";
    } elseif ($evaluacion == 'tercer_ev') {
        $query = "UPDATE calificaciones SET tercer_ev = '$nota', comentario = '$comentario', actitud = '$actitud' WHERE id_alumno = '$id_alumno' and materia = '$materia'";
    }

    if (mysqli_query($conexion, $query)) {
        echo "<script language='javascript'>
              alert('¡¡¡Nota enviada!!!');
              window.location.replace('./inicio_sesión.php');
              </script>";
    } else {
        echo "<script language='javascript'>
              alert('¡¡¡Uy, algo falla, compruebe los parámetros!!!');
              window.location.replace('./inicio_sesión.php');
              </script>";
    }
mysqli_close($conexion);
?>
