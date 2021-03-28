<?php
// Połączenie z bazą danych
function pdo_connect_mysql() {
    //Dane logowania do bazy danych
    $DATABASE_HOST = 'localhost';
    $DATABASE_USER = 'root';
    $DATABASE_PASS = '';
    $DATABASE_NAME = 'shopdb';
    try {
    	return new PDO('mysql:host=' . $DATABASE_HOST . ';dbname=' . $DATABASE_NAME . ';charset=utf8', $DATABASE_USER, $DATABASE_PASS);
    } catch (PDOException $exception) {
    	// Zwraca błąd jeśli nie uda się połączyć z bazą danych.
    	exit('Błąd połączenia z bazą danych :(');
    }
}

// Szablon nagłówka
 function template_header($title) {
echo <<<EOT

<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./css/style.css/">

    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">

    <link rel="stylesheet" href="./css/style.css">
</head>
<body>
 <!-- Top Menu bar -->
    <header>
        <nav class="fixed-top">
            <nav class="navbar bg-light navbar-light navbar-expand-lg">
                <div class="container">
                    <a class="navbar-brand" href="index.php">Sklep</a>
                    <!-- Mobile version toggler -->
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <!-- Navbar menu -->
                    <div class="collapse navbar-collapse" id="navbarNav">
                        <ul class="navbar-nav mx-auto">
                            <li class="nav-item"><a class="nav-link"  href="#">Strona Główna</a></li>
                            <li class="nav-item"><a class="nav-link"  href="#">Produkty</a></li>
                            <li class="nav-item"><a class="nav-link"  href="#">Kontakt</a></li>
                        </ul>
                    </div>
                    <!-- Navbar user icon -->
                    <ul class="nav navbar-nav flex-row flex-nowrap">
                        <li class="nav-item"><a class="nav-link" href="https://www.facebook.com/MEBLE-DELUX-112775073808073" target="blank"><i class="fa fa-user-o" style="font-size: 36px;"></i> użytkownik</a></li>
                    </ul>
                </div>
            </nav>
            <!-- Search Bar -->
            <nav class="navbar srchbar navbar-light bg-light">
                <form class="container mx-auto">
                    <div class="input-group">
                        <input type="text" class="form-control" placeholder="Czego szukasz?" >
                        <button class="btn btn-outline-dark input-group-text" id="basic-addon1" type="submit">Szukaj</button>
                    </div>
                </form>
            </nav>
        </nav>
    </header>
    <!--Main site -->
    <main class="position-absolute top-50 start-50 translate-middle">
EOT;
}
 
 // Szablon stopki
function template_footer() {
    $year = date("Y");
echo <<<EOT
</main>

<!-- Footer -->
<footer class="bg-light text-center text-lg-start fixed-bottom">
   <!-- Copyright -->
   <div class="text-center p-3">
       © $year Copyright:
       <a class="text-dark" href="https://github.com/Cielako">Cielako</a>
   </div>
   <!-- Copyright -->
</footer>

</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js" integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0" crossorigin="anonymous"></script>
</html>
EOT;    
}
?>