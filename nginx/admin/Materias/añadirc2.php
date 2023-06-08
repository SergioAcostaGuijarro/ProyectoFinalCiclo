<?php
$curso = $_REQUEST['curso'];
$tutor = $_REQUEST['tutor'];

$conexion = mysqli_connect("db", "root", "rootroot") or die ("No se puede conectar con el servidor");
mysqli_select_db($conexion, "educados") or die ("No se puede seleccionar la base de datos");
$query = "insert into curso (curso, tutor) values ('$curso', '$tutor')";
    
    if(mysqli_query ($conexion, $query)) {
        echo "<script language='javascript'>
            alert('¡¡¡Curso creado!!!');
            window.location.replace('./materias.php');
            </script>"; 
    } else {
        echo "<script language='javascript'>
            alert('¡¡¡Curso no creado, compruebe los parámetros!!!');
            window.location.replace('./añadirm.php');
            </script>";
    }


mysqli_close($conexion);
?>
