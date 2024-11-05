<?php
session_start();

$_SESSION = [];
session_unset();
session_destroy();

if (isset($_COOKIE['token'])) {
    setcookie('token', '', time() - 3600, '/');
}

header("Location: auth.php");
exit;
