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
                <a href="./inicio_sesión.php" id="inicio"><img src="./img/iniciowhite.png" alt="" width="75rpx"></a>
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
        <form id="login_form" action="registrarse2.php" method="GET">
        <hr>
            <label id="icon" for="name"><i class="icon-user"></i></label>
            <input type="text" name="nombre" id="nombre" placeholder="Usuario" required/>
            <label id="icon" for="name"><i class="icon-envelope"></i></label>
            <input type="email" name="correo" id="correo" placeholder="Correo" required/>
            <label id="icon" for="name"><i class="icon-shield"></i></label>
            <input type="password" name="pass" id="pass" placeholder="Contraseña" required/>
            <label id="icon" for="name"><i class="icon-check"></i></label>
            <input type="password" name="pass2" id="pass2" placeholder="Repita la contraseña" required/>
        <hr>
            <pre><br><a><input type="radio" value="padre" name="opcion" required> Soy padre     <a> <input type="radio" value="alumno" name="opcion" required> Soy alumno</a></pre>
            <div class="gender"><p><input type="checkbox" name="politica" id="politica" required> Ha leido y acepta todas nuestras políticas</p></div>
            <input type="submit" id="entrar" name="enviar"  class="botones" value="ACEPTAR">  
        
        </form><br>
        <a href="inicio_sesión.php">¿Ya tiene una cuenta?, inicie sesión</a>
        <br><br><hr>
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
