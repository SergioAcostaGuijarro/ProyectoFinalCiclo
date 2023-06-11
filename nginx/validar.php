<?php
$nombre = $_REQUEST['usuario'];
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
        window.location.replace('./registrarse.php');
        </script>";
} elseif (strlen($pass) <= 4) {
    echo "<script language='javascript'>
        alert('¡¡¡Las contraseñas tienen que tener mínimo 5 caracteres!!!');
        window.location.replace('./registrarse.php');
        </script>";
} elseif ($pass != $pass2) {
    echo "<script language='javascript'>
        alert('¡¡¡Las contraseñas no coinciden!!!');
        window.location.replace('./registrarse.php');
        </script>";
    } else {
        $query = "insert into usuario (usuario, correo, contraseña, tipo_usuario) values ('$nombre','$correo','$passencryp','$tipo_usuario')";
        if(mysqli_query ($conexion, $query)) {

            echo "<script language='javascript'>
                alert('¡¡¡Usuario creado!!! Se ha enviado un correo electrónico para confirmar tu dirección.');
                window.location.replace('./inicio_sesión.php');
                </script>"; 
        } else {
            echo "<script language='javascript'>
                alert('¡¡¡Usuario no creado, compruebe los parámetros!!!');
                window.location.replace('./registrarse.php');
                </script>";
        }
    }
    
    mysqli_close($conexion);
?>
