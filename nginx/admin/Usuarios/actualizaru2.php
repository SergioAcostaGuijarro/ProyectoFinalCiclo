<?php
session_start();

    $nombre = $_REQUEST["nombre"];
    $correo = $_REQUEST["email"];
    $id = $_REQUEST["id"];

    $conexion = mysqli_connect ("db", "root", "rootroot") or die ("No se puede conectar con la base de datos");
    mysqli_select_db ($conexion, "educados") or die ("No se puede seleccionar la base de datos");

    $query="update usuario set nombre='$nombre', correo='$correo', contraseña=MD5('$pass') where id_usuario='$id'";

    if(mysqli_query ($conexion,$query))
    {
        echo "<script language='javascript'>
            alert('¡¡¡Usuario actualizado!!!');
            window.location.replace('./usuarios.php')
            </script>";
    }
    else
    {
        echo "<script language='javascript'>
            alert('¡¡¡Usuario NO actualizado!!!');
            window.location.replace('./actualizaru.php')
            </script>";
    }
    mysqli_close($conexion);
?>