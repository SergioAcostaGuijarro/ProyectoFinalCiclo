<?php
session_start();
$id = $_REQUEST["id"];

$conexion = mysqli_connect("db", "root", "rootroot", "educados") or die("No se puede conectar con la base de datos");
mysqli_select_db($conexion, "educados") or die("No se puede seleccionar la base de datos");

$query_select = "SELECT id_usuario FROM usuario WHERE id_usuario='$id'";
$resultado_select = mysqli_query($conexion, $query_select);

if (mysqli_num_rows($resultado_select) > 0) {
    $query_delete = "DELETE FROM usuario WHERE id_usuario='$id' and tipo_usuario='profesor'";

    if (mysqli_query($conexion, $query_delete)) 
    {
        echo "<script language='javascript'>
                alert('¡¡¡Trabajador eliminado!!!');
                window.location.replace('./plantilla.php')
                </script>";
    } else {
        echo "<script language='javascript'>
                alert('¡¡¡Trabajador NO eliminado!!!');
                window.location.replace('./eliminaru.php')
                </script>";
    }
} else {
    echo "<script language='javascript'> /* NO HACE COMPROBACÇION SI NO EXISTE EN BBDD */
            alert('¡¡¡Ese ID NO existe en la BBDD!!!');
            window.location.replace('./eliminaru.php')
            </script>";
}

mysqli_close($conexion);
?>
