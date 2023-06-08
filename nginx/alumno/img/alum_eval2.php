<?php
session_start();
$materia = $_REQUEST['materia'];

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
        $nombre = $_POST["name"];
        $correo_hijo = $_POST["email"];

        // Comprobación de que los campos no están vacíos
        if (empty($nombre) || empty($correo_hijo)) {
           echo "<script language='javascript'>
               alert('¡¡¡Por favor, ingrese los datos requeridos!!!');
                window.location.replace('./registrar_hijo.php')
                </script>";
            exit();
        }

        $conexion = mysqli_connect("localhost", "root", "rootroot", "educados") or die("No se puede conectar con la base de datos");

        // Verificar si el hijo existe en la base de datos
        $query = "SELECT id_usuario, nombre FROM alumno WHERE nombre='$nombre' AND correo='$correo_hijo'";
        $resultado = mysqli_query($conexion, $query);
        $arrayDatos = array();

        if ($resultado && mysqli_num_rows($resultado) > 0) {
            while($row = mysqli_fetch_array($resultado)){
                $arrayDatos[] = $row;
            }
            $id_hijo = $arrayDatos[0]["id_usuario"];
            $hijo = $arrayDatos[0]["nombre"];

            // Actualizar la tabla de padres con el ID del hijo y nombre correspondiente
            $correo_padre = $_SESSION["correo"];
            $query2 = "UPDATE padre SET id_hijo='$id_hijo', hijo='$hijo' WHERE correo='$correo_padre'";
            if(mysqli_query($conexion, $query2)){
                    echo "<script language='javascript'>
                    alert('¡¡¡Todo correcto, muchas gracias!!!');
                    window.location.replace('./padreindex.php')
                    </script>";
                } else {
                    echo "<script language='javascript'>
                    alert('¡¡¡Error en la actualización de datos, por favor, inténtelo de nuevo!!!');
                    window.location.replace('./registrar_hijo.php')
                    </script>";
                }
            } else {
                echo "<script language='javascript'>
                    alert('¡¡¡Los datos ingresados no corresponden a un hijo!!!');
                    window.location.replace('./registrar_hijo.php')
                    </script>";
            }
            mysqli_close($conexion);
        } else {
            echo "<script language='javascript'>
                    alert('¡¡¡Se ha producido un error en la petición, por favor, inténtelo de nuevo!!!');
                    window.location.replace('./registrar_hijo.php')
                    </script>";
        }
        ?>
