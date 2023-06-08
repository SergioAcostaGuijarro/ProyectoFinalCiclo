<?php
$conexion = mysqli_connect("db", "root", "rootroot", "educados");

/* Obtener los datos enviados por el formulario */
$correo = $_GET['correo'];
$codigo_verificacion = $_GET['codigo'];

/* Consulta para verificar si el correo y código de verificación existen en la base de datos */
$sql = "SELECT * FROM usuario WHERE correo = '$correo' AND verification_code = '$codigo_verificacion'";

$resultado = mysqli_query($conexion, $sql);

if(mysqli_num_rows($resultado) > 0) {
    /* Actualizar el campo 'verificado' a true */
    $sql_update = "UPDATE usuario SET verificado = true WHERE correo = '$correo'";
    mysqli_query($conexion, $sql_update);

    /* Mostrar mensaje de éxito */
    echo "Su cuenta ha sido verificada con éxito. <a href='inicio_sesion.php'>Iniciar sesión</a>";
} else {
    /* Mostrar mensaje de error */
    echo "Ha ocurrido un error al verificar su cuenta.";
}

mysqli_close($conexion);
?>
