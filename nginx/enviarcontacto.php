<?php
//Contenido correo
$nombre = $_POST["name"];
$correo = $_POST["email"];
$asunto = $_POST["subject"];
$mensaje = $_POST["message"];

// Cuerpo del correo electrónico
$body = '<html><head><style>';
$body .= 'h2 {color: #0066cc; font-size: 24px;}';
$body .= 'p {font-size: 16px; line-height: 1.5;}';
$body .= 'strong {font-weight: bold;}';
$body .= 'a {color: #0066cc;}';
$body .= '</style></head><body>';
$body .= '<h2>Información de contacto.html</h2>';
$body .= '<p><strong>Nombre:</strong> ' . $nombre . '</p>';
$body .= '<p><strong>Correo:</strong> <a href="mailto:' . $correo . '">' . $correo . '</a></p>';
$body .= '<p><strong>Mensaje:</strong></p><p>' . $mensaje . '</p>';
$body .= '</body></html>';

//Importar clases PHPMailer
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

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
    $mail->setFrom($correo, $nombre);
    $mail->addAddress('educadosinfo@gmail.com');                                 //Add a recipient(A QUIEN SE ENVIA CORREO)

    //Content
    $mail->isHTML(true);
    $mail->CharSet = 'UTF-8';                                //Set email format to HTML
    $mail->Subject = $asunto;
    $mail->Body    = $body;

    //Enviar
    $mail->send();
    echo "<script language='javascript'>
    alert('¡¡¡Correo enviado con éxito!!!');
    window.location.replace('./index.html');
    </script>";
    exit;
} catch (Exception $e) {
    echo "¡¡¡Correo no enviado: $mail->ErrorInfo!!!";
}
