<?php
session_start();
include 'functions.php';
$pdo = pdo_connect_mysql();

// Załaduj stronę główną jeśli istnieje
$page = isset($_GET['page']) && file_exists($_GET['page'] . '.php') ? $_GET['page'] : 'home';
include $page . ".php";

?>