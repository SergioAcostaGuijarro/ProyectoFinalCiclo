<?php
session_start();

// Comprobación de que el usuario ha iniciado sesión
if (!isset($_SESSION["correo"])) {
    echo "<script language='javascript'>
            alert('¡¡¡Debe iniciar sesión para acceder a esta página!!!');
            window.location.replace('../index.html')
            </script>";
    exit();
}

// Comprobación de que se han enviado los datos por POST
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $curso = $_POST['curso'];

    // Comprobación de que los campos no están vacíos
    if ($curso == "---") {
        echo "<script language='javascript'>
            alert('¡¡¡Por favor, elija un curso!!!');
            window.location.replace('./registrar_hijo.php')
            </script>";
        exit();
    }

    $conexion = mysqli_connect("db", "root", "rootroot", "educados") or die("No se puede conectar con la base de datos");

    // Obtener el ID del curso seleccionado
    $instruccion = "SELECT id_curso FROM curso WHERE curso='$curso'";
    $consulta = mysqli_query($conexion, $instruccion) or die("Fallo en la consulta");
    $resultado = mysqli_fetch_array($consulta);
    $id_curso = $resultado['id_curso'];

    // Actualizar la tabla alumno con el ID del curso
    $instruccion = "UPDATE alumno SET id_curso=$id_curso, curso='$curso' WHERE correo='$_SESSION[correo]'";
    mysqli_query($conexion, $instruccion) or die("Fallo en la actualización");

    // Redirigir al usuario a la página principal
    echo "<script language='javascript'>
            alert('¡¡¡El curso ha sido actualizado correctamente!!!');
            window.location.replace('./alumnoindex.php')
            </script>";
    exit();
}
?>
