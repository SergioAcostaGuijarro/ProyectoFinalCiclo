<?php
session_start();

    $nombre = $_REQUEST["nombre"];
    $correo = $_REQUEST["email"];
    $pass = $_REQUEST["contraseña"];
    $id = $_REQUEST["id"];

    $conexion = mysqli_connect ("db", "root", "rootroot") or die ("No se puede conectar con la base de datos");
    mysqli_select_db ($conexion, "educados") or die ("No se puede seleccionar la base de datos");

    $query="update usuario set nombre='$nombre', correo='$correo', contraseña=MD5('$pass') where id_usuario='$id' and tipo_usuario='profesor'";

    if(mysqli_query ($conexion,$query))
    {
        echo "<script language='javascript'>
            alert('¡¡¡Trabajador actualizado!!!');
            window.location.replace('./plantilla.php')
            </script>";
    }
    else
    {
        echo "<script language='javascript'>
            alert('¡¡¡Trabajador NO actualizado!!!');
            window.location.replace('./actualizara.php')
            </script>";
    }
    mysqli_close($conexion);
?>