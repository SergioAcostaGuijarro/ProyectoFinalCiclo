<?php
session_start();
$profesor = $_REQUEST["profesor"];
$materia = $_REQUEST["materia"];
$curso = $_REQUEST["curso"];
$id = $_REQUEST["id"];

$conexion = mysqli_connect ("db", "root", "rootroot") or die ("No se puede conectar con la base de datos");
mysqli_select_db ($conexion, "educados") or die ("No se puede seleccionar la base de datos");

// Consulta para verificar si el profesor existe
$query_profesor = "SELECT id_usuario FROM profesor WHERE nombre = '$profesor'";
$resultado_profesor = mysqli_query($conexion, $query_profesor);

if (mysqli_num_rows($resultado_profesor) == 0) {
    // Si el profesor no existe, mostrar alerta y detener la actualización
    mysqli_close($conexion);
    echo "<script language='javascript'>
            alert('¡¡¡El profesor no se encuentra en la plantilla!!!');
            window.location.replace('./actualizarm.php')
          </script>";
    die();
}

$query = "UPDATE materia SET materia='$materia', profesor='$profesor', curso='$curso' WHERE id_materia='$id'";

if(mysqli_query($conexion, $query)) {
    echo "<script language='javascript'>
            alert('Materia actualizada!!!');
            window.location.replace('./materias.php')
          </script>";
}
else {
    echo "<script language='javascript'>
            alert('¡¡¡Materia NO actualizada!!!');
            window.location.replace('./actualizarm.php')
          </script>";
}
mysqli_close($conexion);
?>
