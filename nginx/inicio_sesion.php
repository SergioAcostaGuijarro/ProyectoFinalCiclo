<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <title>INICIAR SESIÓN</title>
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
                <h1>Iniciar sesión</h1>
                <hr>
                    <form action="inicio_sesion2.php" method="get">
                        <div class="inputsini">
                            <label id="icon" for="name"><i class="icon-envelope"></i></label>
                            <input type="email" name="correo" id="correo" placeholder="Email..." required>
                        </div>
                        <div class="inputsini">
                            <label id="icon" for="name"><i class="icon-shield"></i></label>
                            <input type="password" name="pass" id="pass" placeholder="contrasena..." required>
                        </div>    
                        <hr>
                    <input type="submit" name="comprobar" class="botones" value="INICIAR SESION">
                    </form><br>
                <pre><a href="registrarse.php">¿No tienes cuenta?, registrate</a><a href="recuperar.php">     He olvidado mi contrasena</a></pre>
                <br><hr>    
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

<link href='https://fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600' rel='stylesheet' type='text/css'>
<link href="//netdna.bootstrapcdn.com/font-awesome/3.1.1/css/font-awesome.css" rel="stylesheet">
