<?php
$curso = $_POST['curso'];
$materia = $_POST['materia'];
$id_profesor = $_POST['id_profesor'];

$nota = $_POST['nota'];
$actitud = $_POST['actitud'];
$comentario = $_POST['comentario'];
$evaluacion = $_POST['evaluacion'];
$id_alumno = $_POST['id_alumno']; // Obtener el valor de id_alumno de $_POST

$conexion = mysqli_connect("db", "root", "rootroot", "educados") or die("No se puede conectar con el servidor");

if ($evaluacion == 'primer_ev') {
    $query = "UPDATE calificaciones SET primer_ev = '$nota', comentario = '$comentario', actitud = '$actitud' WHERE id_alumno = '$id_alumno' and materia = '$materia'";
} elseif ($evaluacion == 'segunda_ev') {
    $query = "UPDATE calificaciones SET segunda_ev = '$nota', comentario = '$comentario', actitud = '$actitud' WHERE id_alumno = '$id_alumno' and materia = '$materia'";
} elseif ($evaluacion == 'tercer_ev') {
    $query = "UPDATE calificaciones SET tercer_ev = '$nota', comentario = '$comentario', actitud = '$actitud' WHERE id_alumno = '$id_alumno' and materia = '$materia'";
}

if (mysqli_query($conexion, $query)) {
    echo "<script language='javascript'>
    alert('¡¡¡Nota actualizada!!!');
    window.location.replace('./calificaciones3.php?curso=" . urlencode($curso) . "&materia=" . urlencode($materia) . "');
    </script>";
} else {
    echo "<script language='javascript'>
    alert('¡¡¡Nota no actualizada!!!');
    window.location.replace('./calificaciones3.php?curso=" . urlencode($curso) . "&materia=" . urlencode($materia) . "');
    </script>";
}

mysqli_close($conexion);
?>
