<?php
session_start();
        // Define el tiempo de inactividad en segundos (por ejemplo, 30 minutos (1800))
        $inactivity_time = 1800; 

        // Verifica si existe una sesión y si ha pasado el tiempo de inactividad
        if (isset($_SESSION['last_activity']) && (time() - $_SESSION['last_activity'] > $inactivity_time)) {
            // Si el usuario ha estado inactivo durante más tiempo que el tiempo de inactividad permitido, destruye la sesión y redirige al usuario a la página de inicio de sesión
            session_unset();
            session_destroy();
            header('Location: inicio_sesión.php');
            exit();
        }

        // Actualiza el tiempo de actividad
        $_SESSION['last_activity'] = time();

$conexion = mysqli_connect("db", "root", "rootroot", "educados") or die("No se puede conectar con el servidor");

$correo = mysqli_real_escape_string($conexion, $_REQUEST["correo"]);
$pass = mysqli_real_escape_string($conexion, $_REQUEST["pass"]);
$passencryp = md5($pass);

$query = "SELECT * FROM usuario WHERE correo='$correo' AND contraseña='$passencryp'";
$consulta = mysqli_query($conexion, $query) or die("Fallo en la consulta");
$resultado = mysqli_fetch_array($consulta);

if (mysqli_num_rows($consulta) == 1) {
    $_SESSION['tipo_usuario'] = $resultado['tipo_usuario'];
    $_SESSION['nombre'] = $resultado['nombre'];
    $_SESSION['contraseña'] = $resultado['contraseña'];
    $_SESSION['correo'] = $correo;

    if ($_SESSION['tipo_usuario'] == "padre") {
        // Obtener el valor de primer_login de la tabla padre
        $correo_padre = $resultado['correo'];
        $query = "SELECT primer_login FROM padre WHERE correo='$correo_padre'";
        $consulta_padre = mysqli_query($conexion, $query) or die("Fallo en la consulta");
        $resultado_padre = mysqli_fetch_array($consulta_padre);

        if ($resultado_padre['primer_login'] == 1) {
            // Redirige al formulario de registro de hijo
            header('Location: ./padre/registrar_hijo.php');
            
            // Establecer primer_login a falso en la tabla padre
            $query = "UPDATE padre SET primer_login = 0 WHERE correo = '$correo_padre'";
            mysqli_query($conexion, $query) or die ("Fallo en la consulta de update");
            exit();
        } else {
            // Redirige al índice del padre
            header('Location: ./padre/padreindex.php');
        }
        } elseif ($_SESSION['tipo_usuario'] == "alumno") {
            // Obtener el valor de primer_login de la tabla alumno
        $correo_alumno = $resultado['correo'];
        $query = "SELECT primer_login FROM alumno WHERE correo='$correo_alumno'";
        $consulta_alumno = mysqli_query($conexion, $query) or die("Fallo en la consulta");
        $resultado_alumno = mysqli_fetch_array($consulta_alumno);

        if ($resultado_alumno['primer_login'] == 1) {
            // Redirige al formulario de registro de datos del alumno
            header('Location: ./alumno/alumno_eval.php');
            
            // Establecer primer_login a falso en la tabla alumno
            $query = "UPDATE alumno SET primer_login = 0 WHERE correo = '$correo_alumno'";
            mysqli_query($conexion, $query) or die ("Fallo en la consulta de update");
            exit();
        } else {
            // Redirige al índice del alumno
            header('Location: ./alumno/alumnoindex.php');
        }
    } elseif ($_SESSION['tipo_usuario'] == "admintech644394412") {
        header('Location: ./admin/adminindex.php');
    } elseif ($_SESSION['tipo_usuario'] == "profesor") {
        header('Location: ./profesor/profesorindex.php');
    } else {
        echo "<script language='javascript'>
              alert('¡¡¡Uy, algo falla, compruebe los parámetros!!!');
              window.location.replace('./inicio_sesión.php');
              </script>";
    }
} else {
    // El correo electrónico o la contraseña son incorrectos
    // Verificar si el correo electrónico existe en la base de datos
    $query = "SELECT correo FROM usuario WHERE correo='$correo'";
    $consulta = mysqli_query($conexion, $query) or die("Fallo en la consulta");
    if (mysqli_num_rows($consulta) == 0) {
        // El correo electrónico no existe en la base de datos
        echo "<script language='javascript'>
              alert('¡¡¡El correo electrónico ingresado no existe!!!');
              window.location.replace('./inicio_sesión.php');
              </script>";
    } else {
        // El correo electrónico existe, pero la contraseña es incorrecta
        echo "<script language='javascript'>
              alert('¡¡¡La contraseña ingresada es incorrecta!!!');
              window.location.replace('./inicio_sesión.php');
              </script>";
    }
}
mysqli_close($conexion);
?>

