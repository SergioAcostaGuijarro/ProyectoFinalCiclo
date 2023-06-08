<?php
    // Captcha válido, continuar con el registro
    $nombre = $_POST['nombre'];
    $correo = $_POST['correo'];
    $pass = $_POST['pass'];
    $tipo_usuario = $_POST["tipo_usuario"];
    $passencryp = MD5($pass);
    $codigo = $_POST['cod-validacion'];
    $unicode = $_POST['unicode'];

    $conexion = mysqli_connect("db", "root", "rootroot") or die ("No se puede conectar con el servidor");
    mysqli_select_db($conexion, "educados") or die ("No se puede seleccionar la base de datos");

    $correoexistente = "select correo from usuario where correo='$correo'";
    $resultado = mysqli_query($conexion, $correoexistente);

    if ((mysqli_num_rows($resultado) > 0) && ($unicode != $codigo)) {
        echo "<script language='javascript'>
            alert('¡¡¡El código de verificación no es igual al enviado!!!');
            window.location.replace('./registrarse2.php');
            </script>";
        } else {
            $query = "insert into usuario (nombre, correo, contrasena, tipo_usuario) values ('$nombre','$correo','$passencryp','$tipo_usuario')";
            if(mysqli_query ($conexion, $query)) {
                echo "<script language='javascript'>
                    alert('¡¡¡Usuario creado!!!');
                    window.location.replace('./inicio_sesion.php');
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