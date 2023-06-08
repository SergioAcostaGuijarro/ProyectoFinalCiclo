<?php
$nombre = $_REQUEST['nombre'];
$correo = $_REQUEST['correo'];
$pass = $_REQUEST['pass'];
$pass2 = $_REQUEST["pass2"];
$tipo_usuario = $_REQUEST["opcion"];
$passencryp = MD5($pass);

$conexion = mysqli_connect("db", "root", "rootroot") or die ("No se puede conectar con el servidor");
mysqli_select_db($conexion, "educados") or die ("No se puede seleccionar la base de datos");

$correoexistente = "select correo from usuario where correo='$correo'";
$resultado = mysqli_query($conexion, $correoexistente);

if (mysqli_num_rows($resultado) > 0) {
    echo "<script language='javascript'>
        alert('¡¡¡Su correo ya está registrado!!!');
        window.location.replace('./añadiru.php');
        </script>";
} elseif (strlen($pass) <= 4) {
    echo "<script language='javascript'>
        alert('¡¡¡Las contrasenas tienen que tener mínimo 5 caracteres!!!');
        window.location.replace('./añadiru.php');
        </script>";
} elseif ($pass != $pass2) {
    echo "<script language='javascript'>
        alert('¡¡¡Las contrasenas no coinciden!!!');
        window.location.replace('./añadiru.php');
        </script>";
} else {
    $query = "insert into usuario (nombre, correo, contrasena, tipo_usuario) values ('$nombre','$correo','$passencryp','$tipo_usuario')";
    if(mysqli_query ($conexion, $query)) {
        echo "<script language='javascript'>
            alert('¡¡¡Usuario creado!!!');
            window.location.replace('./usuarios.php');
            </script>"; 
    } else {
        echo "<script language='javascript'>
            alert('¡¡¡Usuario no creado, compruebe los parámetros!!!');
            window.location.replace('./añadiru.php');
            </script>";
    }
}

mysqli_close($conexion);
?>
