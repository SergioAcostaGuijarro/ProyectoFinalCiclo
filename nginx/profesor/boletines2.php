<?php
//Importar clases PHPMailer
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;
use PHPMailer\PHPMailer\SMTP;

session_start();

// Verificar si existe correo
$conexion = mysqli_connect("db", "root", "rootroot", "educados") or die("No se puede conectar con el servidor");

$correo = $_POST["correo"];
$boletin = $_FILES["archivo"];

$query = "SELECT * FROM alumno WHERE correo='$correo'";
$consulta = mysqli_query($conexion, $query) or die("Fallo en la consulta");

if (mysqli_num_rows($consulta) > 0) {

    // El correo existe en la base de datos, enviar el correo
    // Importar clases PHPMailer
    require './PHPMailer/Exception.php';
    require './PHPMailer/PHPMailer.php';
    require './PHPMailer/SMTP.php';

    // Obtener el nombre del alumno
    $resultado = mysqli_fetch_assoc($consulta);
    $nombre = $resultado['nombre'];

    // Obtener el correo del profesor desde la sesión
    $correoprofesor = $_SESSION['correo'];

    // Cuerpo del correo electrónico
    $body = '<html><head><style>';
    $body .= 'h2 {color: #0066cc; font-size: 24px;}';
    $body .= 'p {font-size: 16px; line-height: 1.5;}';
    $body .= 'strong {font-weight: bold;}';
    $body .= 'a {color: #0066cc;}';
    $body .= '</style></head><body>';
    $body .= '<h2>Boletin de notas</h2>';
    $body .= '<p>Hola:<strong> ' . $nombre . '</strong>, ya se han publicado las notas.</p>';
    $body .= '</body></html>';

    // Crear instancia de PHPMailer
    $mail = new PHPMailer(true);

    try {
        // Ajustes del servidor SMTP
        $mail->SMTPDebug = 0;                                       // Habilitar el registro detallado de depuración
        $mail->isSMTP();                                            // Enviar utilizando SMTP
        $mail->Host       = 'smtp.gmail.com';                       
        $mail->SMTPAuth   = true;                           
        $mail->Username   = 'educadosinfo@gmail.com';              
        $mail->Password   = 'griitqiiiawfsyjq';                     
        $mail->SMTPSecure = 'tls';                                  
        $mail->Port       = 587;                                    
        $mail->IsHTML(true);                                        // Establecer el formato del mensaje como HTML

        // Remitentes
        $mail->setFrom($correoprofesor);
        $mail->addAddress($correo, $nombre);                         // Agregar destinatario (A QUIEN SE ENVÍA EL CORREO)

        // Contenido
        $mail->isHTML(true);
        $mail->CharSet = 'UTF-8';                                   
        $mail->Subject = 'Publicación boletín';
        $mail->Body    = $body;
        $mail->AddAttachment($boletin['tmp_name'], $boletin['name']); 

        // Enviar correo
        $mail->send();
        echo "<script language='javascript'>
        alert('¡¡¡Correo enviado con éxito!!!');
        window.location.replace('./boletines.php');
        </script>";
        exit;
    } catch (Exception $e) {
        echo "¡¡¡Correo no enviado: " . $mail->ErrorInfo . "!!!";
    }
} else {
    // El correo no corresponde a ningún alumno en la base de datos
    echo "<script language='javascript'>
    alert('El correo no corresponde a ningún alumno.');
    window.location.replace('./boletines.php');
    </script>";
    exit;
}
?>
