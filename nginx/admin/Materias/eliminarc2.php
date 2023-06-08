<?php
session_start();
$id = $_REQUEST["id"];

$conexion = mysqli_connect("db", "root", "rootroot", "educados") or die("No se puede conectar con la base de datos");
mysqli_select_db($conexion, "educados") or die("No se puede seleccionar la base de datos");

$query_select = "SELECT id_curso FROM curso WHERE id_curso='$id'";
$resultado_select = mysqli_query($conexion, $query_select);

if (mysqli_num_rows($resultado_select) > 0) {
    $query_delete = "DELETE FROM curso WHERE id_curso='$id'";

    if (mysqli_query($conexion, $query_delete)) 
    {
        echo "<script language='javascript'>
                alert('¡¡¡Curso eliminado!!!');
                window.location.replace('./materias.php')
                </script>";
    } else {
        echo "<script language='javascript'>
                alert('¡¡¡Curso NO eliminado!!!');
                window.location.replace('./eliminarc.php')
                </script>";
    }
} else {
    echo "<script language='javascript'> /* NO HACE COMPROBACÇION SI NO EXISTE EN BBDD */
            alert('¡¡¡Ese ID NO existe en la BBDD!!!');
            window.location.replace('./eliminarc.php')
            </script>";
}

mysqli_close($conexion);
?>
