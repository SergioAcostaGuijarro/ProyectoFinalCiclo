<?php
$curso = $_REQUEST['curso'];
$profesor = $_REQUEST['profesor'];
$materia = $_REQUEST['materia'];

$conexion = mysqli_connect("db", "root", "rootroot") or die ("No se puede conectar con el servidor");
mysqli_select_db($conexion, "educados") or die ("No se puede seleccionar la base de datos");

// Comprobamos si el profesor existe en la tabla "profesor"
$query_profesor = "SELECT * FROM profesor WHERE nombre='$profesor'";
$resultado = mysqli_query($conexion, $query_profesor);
if (mysqli_num_rows($resultado) == 0) {
    echo "<script language='javascript'>
            alert('¡¡¡Profesor no encontrado en la plantilla!!!');
            window.location.replace('./añadir.php');
            </script>";
    exit();
}

// Insertamos la nueva materia en la tabla "materia"
$query = "INSERT INTO materia (curso, profesor, materia) VALUES ('$curso','$profesor','$materia')";
if(mysqli_query ($conexion, $query)) {
    echo "<script language='javascript'>
            alert('¡¡¡Materia creada!!!');
            window.location.replace('./añadir.php');
            </script>"; 
} else {
    echo "<script language='javascript'>
            alert('¡¡¡Materia no creada, compruebe los parámetros!!!');
            window.location.replace('./añadir.php');
            </script>";
}

mysqli_close($conexion);
?>
