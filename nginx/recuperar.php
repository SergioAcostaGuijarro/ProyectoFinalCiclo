<?php
session_start();

$sessData = !empty($_SESSION['sessData'])?$_SESSION['sessData']:'';
if(!empty($sessData['status']['msg'])){
    $statusMsg = $sessData['status']['msg'];
    $statusMsgType = $sessData['status']['type'];
    unset($_SESSION['sessData']['status']);
}

?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>EDUCADOS</title>
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
    <br><br><br><br><br>
    <main class="container">
        <form action="recuperar2.php" class="contact-form">
            <h2>Recuperar contrasena</h2>
            <div class="form-group">
                <input type="email" id="email" name="email" placeholder="Escriba aquí su email..." required>
            </div>
            <div class="form-group">
                <a href="inicio_sesion.php">¿Ya tienes cuenta?</a>
            </div>
            <div class="botones">
                <input type="submit" name="comprobar" value="Enviar"></button>
            </div>
        </form>
    </main>
    <footer>
        <div class="pie_pagina">
            <div clas="foto_foot">
                <img src="img/educadosfooter.png" id="imgenfooter" width="10%"></a>
            </div>
            <div class="quienes_somos">
                <h2>¿Quiénes somos?</h2> <!-- PIE DE PAGINA -->
                <p>EDUCADOS es una plataforma de aprendizaje en línea que ofrece una amplia variedad de cursos y recursos educativos para estudiantes de todo el mundo. Nuestro enfoque se basa en la excelencia académica y la innovación tecnológica, brindando una experiencia educativa de calidad y accesible para todos.</p>
            </div>
        </div>
    </footer>
</body>
</html>