<?php

session_start();

$inactivity_time = 1800;

if (isset($_SESSION['last_activity']) && (time() - $_SESSION['last_activity'] > $inactivity_time)) {
    session_unset();
    session_destroy();
    header('Location: inicio_sesion.php');
    exit();
}

$_SESSION['last_activity'] = time();

$conexion = mysqli_connect("db", "root", "rootroot", "educados") or die("No se puede conectar con el servidor");

$correo = mysqli_real_escape_string($conexion, $_REQUEST["correo"]);
$pass = mysqli_real_escape_string($conexion, $_REQUEST["pass"]);
$passencryp = md5($pass);

$query = "SELECT * FROM usuario WHERE correo='$correo' AND contrasena='$passencryp'";
$consulta = mysqli_query($conexion, $query) or die("Fallo en la consulta: " . mysqli_error($conexion));

if (mysqli_num_rows($consulta) == 1) {
    $resultado = mysqli_fetch_array($consulta);
    $_SESSION['tipo_usuario'] = $resultado['tipo_usuario'];
    $_SESSION['nombre'] = $resultado['nombre'];
    $_SESSION['contrasena'] = $resultado['contrasena'];
    $_SESSION['correo'] = $correo;

    if ($_SESSION['tipo_usuario'] == "padre") {
        $correo_padre = $resultado['correo'];
        $query = "SELECT primer_login FROM padre WHERE correo='$correo_padre'";
        $consulta_padre = mysqli_query($conexion, $query) or die("Fallo en la consulta: " . mysqli_error($conexion));
        $resultado_padre = mysqli_fetch_array($consulta_padre);

        if ($resultado_padre['primer_login'] == 1) {
            header('Location: ./padre/registrar_hijo.php');
            $query = "UPDATE padre SET primer_login = 0 WHERE correo = '$correo_padre'";
            mysqli_query($conexion, $query) or die("Fallo en la consulta de update: " . mysqli_error($conexion));
            exit();
        } else {
            header('Location: ./padre/padreindex.php');
        }
    } elseif ($_SESSION['tipo_usuario'] == "alumno") {
        $correo_alumno = $resultado['correo'];
        $query = "SELECT primer_login FROM alumno WHERE correo='$correo_alumno'";
        $consulta_alumno = mysqli_query($conexion, $query) or die("Fallo en la consulta: " . mysqli_error($conexion));
        $resultado_alumno = mysqli_fetch_array($consulta_alumno);

        if ($resultado_alumno['primer_login'] == 1) {
            header('Location: ./alumno/alumno_eval.php');
            $query = "UPDATE alumno SET primer_login = 0 WHERE correo = '$correo_alumno'";
            mysqli_query($conexion, $query) or die("Fallo en la consulta de update: " . mysqli_error($conexion));
            exit();
        } else {
            header('Location: ./alumno/alumnoindex.php');
        }
    } elseif ($_SESSION['tipo_usuario'] == "admintech644394412") {
        header('Location: ./admin/adminindex.php');
    } elseif ($_SESSION['tipo_usuario'] == "profesor") {
        header('Location: ./profesor/profesorindex.php');
    } else {
        echo "<script language='javascript'>
              alert('¡¡¡Uy, algo falla, compruebe los parámetros!!!');
              window.location.replace('./inicio_sesion.php');
              </script>";
    }
} else {
    $query = "SELECT correo FROM usuario WHERE correo='$correo'";
    $consulta = mysqli_query($conexion, $query) or die("Fallo en la consulta: " . mysqli_error($conexion));

    if (mysqli_num_rows($consulta) == 0) {
        echo "<script language='javascript'>
              alert('¡¡¡El correo electrónico ingresado no existe!!!');
              window.location.replace('./inicio_sesion.php');
              </script>";
    } else {
        echo "<script language='javascript'>
              alert('¡¡¡La contrasena ingresada es incorrecta!!!');
              window.location.replace('./inicio_sesion.php');
              </script>";
    }
}

mysqli_close($conexion);

?>
