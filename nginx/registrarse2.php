<?php
    //Importar clases PHPMailer
    use PHPMailer\PHPMailer\PHPMailer;
    use PHPMailer\PHPMailer\Exception;
    
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
            window.location.replace('./registrarse.php');
            </script>";
    } elseif (strlen($pass) <= 4) {
        echo "<script language='javascript'>
            alert('¡¡¡Las contrasenas tienen que tener mínimo 5 caracteres!!!');
            window.location.replace('./registrarse.php');
            </script>";
    } elseif ($pass != $pass2) {
        echo "<script language='javascript'>
            alert('¡¡¡Las contrasenas no coinciden!!!');
            window.location.replace('./registrarse.php');
            </script>";
    }
     else {
            $unicode = rand(100000, 999999);

            // Cuerpo del correo electrónico
            $body = '<html><head><style>';
            $body .= 'h2 {color: #0066cc; font-size: 24px;}';
            $body .= 'p {font-size: 16px; line-height: 1.5;}';
            $body .= 'strong {font-weight: bold;}';
            $body .= 'a {color: #0066cc;}';
            $body .= '</style></head><body>';
            $body .= '<h2>Hola,' . $nombre . '</h2>';
            $body .= '<p>Este es el código:<strong>' . $unicode . '</strong></p>';
            $body .= '<p><p>';
            $body .= '<br><p>Si no ha sido usted ignore y borre este correo</strong></p>';
            $body .= '</body></html>';
     

            //Dirección de ficheros zip
            require './PHPMailer/Exception.php';
            require './PHPMailer/PHPMailer.php';
            require './PHPMailer/SMTP.php';

            //Crear estancia
            $mail = new PHPMailer(true);

            try {
                //Ajustes server
                $mail->SMTPDebug = 0;                                       //Enable verbose debug output
                $mail->isSMTP();                                            //Send using SMTP
                $mail->Host       = 'smtp.gmail.com';                       //Set the SMTP server to send through
                $mail->SMTPAuth   = true;                                   //Enable SMTP authentication
                $mail->Username   = 'educadosinfo@gmail.com';               //SMTP username
                $mail->Password   = 'griitqiiiawfsyjq';                     //SMTP password
                $mail->SMTPSecure = 'tls';            //Enable implicit TLS encryption //OJO: SI DA ERROR DE CONEXION A SMTP SERVER CAMBIAR POR 'tls' O PHPMailer::ENCRYPTION_SMTPS;
                $mail->SMTPAuth   = true;                                   //Activar autenticacion smtp servidor
                $mail->Port       = 587;  //o 465                           //TCP port to connect to; use 587 if you have set `SMTPSecure = PHPMailer::ENCRYPTION_STARTTLS`
                $mail->IsHTML(true);                                        //ADICIONAL: Para especificar el formato del mensaje

                //Recipients
                $mail->setFrom('educadosinfo@gmail.com');
                $mail->addAddress($correo, $nombre);                                 //Add a recipient(A QUIEN SE ENVIA CORREO)

                //Content
                $mail->isHTML(true);
                $mail->CharSet = 'UTF-8';                                //Set email format to HTML
                $mail->Subject = 'Código de verificación en educados';
                $mail->Body    = $body;

                //Enviar
                $mail->send();
                // Mostrar el formulario de verificación
                ?>
                <!DOCTYPE html>
                <html lang="en">
                <head>
                    <meta charset="utf-8" />
                    <title>Registrarse</title>
                    <link rel="stylesheet" href="./formulario.css">
                </head>
                <body>
                    <header>
                        <div class="header__superior">
                            <div class="logo">
                                <img src="img/educados.png" name="logo">
                            </div>
                            <div class="iniciosesion">
                                <a href="./inicio_sesion.php" id="inicio"><img src="./img/iniciowhite.png" alt="" width="75rpx"></a>
                            </div>
                        </div>
                        <div class="container__menu">
                            <div class="menu">
                                <nav>
                                    <ul>
                                        <li><a href="index.html" id="selected"><img src="img/home.png" alt="" width="40px"></a></li>
                                        <li><a href="programas.html">Programas</a></li>
                                        <li><a href="invesigacion.html">Investigación</a></li>
                                        <li><a href="comunidad.html">Comunidad</a></li>
                                        <li><a href="recursos.html">Recursos</a></li>
                                        <li><a href="contacto.html">Contacto</a></li>
                                    </ul>
                                </nav>
                            </div>
                        </div>
                    </header>
                    <main>
                        <article>
                            <h1>Registro</h1>
                            <form action='registrarse3.php' method='POST'>
                            <p>Código: <input type='text' placeholder='Código...' name='cod-validacion'/><input type="submit" id="entrar" name="enviar"  class="botones" value="Verificar"> 
                            <h2 style="color: red;">Hemos enviado un código a su correo</h2>
                        </article>
                    </main>
                    <footer>
                        <div class="pie_pagina">
                            <div clas="foto_foot"><img src="img/educadosfooter.png" id="imgenfooter" width="10%"></a></div>
                            <div class="quienes_somos">
                                <h2>¿Quiénes somos?</h2> <!-- PIE DE PAGINA -->
                                <p>EDUCADOS es una plataforma de aprendizaje en línea que ofrece una amplia variedad de cursos y recursos educativos para estudiantes de todo el mundo. Nuestro enfoque se basa en la excelencia académica y la innovación tecnológica, brindando una experiencia educativa de calidad y accesible para todos.</p>
                            </div>
                        </div>
                    </footer>
                </body>
                </html>

                <?php
                echo "<input type='hidden' value=$nombre name='nombre' />\n";
                echo "<input type='hidden' value=$correo name='correo' />\n";
                echo "<input type='hidden' value=$pass name='pass' />\n";
                echo "<input type='hidden' value=$passencryp name='passencryp' />\n";
                echo "<input type='hidden' value=$tipo_usuario name='tipo_usuario' />\n";
                echo "<input type='hidden' value=$unicode name='unicode' />\n";
                echo "</form>\n";
            } catch (Exception $e) {
                echo "¡¡¡Correo no enviado: $mail->ErrorInfo!!!";
            }
        }

        mysqli_close($conexion);

?>
 
