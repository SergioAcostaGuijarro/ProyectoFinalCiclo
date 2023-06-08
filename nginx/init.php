<?php

    spl_autoload_register(function($class) {
        require $class. '.php';
    });

    define("DB_HOST", "db");
    define("DB_NAME", "educados");
    define("DB_USER", "root");
    define("DB_PASS", "rootroot");
    define("BASE_URL", "http://localhost:8080/");

    $validate = new Validate;
    $userObj = new User;
?>
