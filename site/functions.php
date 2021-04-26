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

    // Sprawdzenie, czy użytkownik jest zalogowany
    function login_session_options(){
        if (isset($_SESSION['login'])){
            if ($_SESSION['login'] == 'admin')
            {
                return "<li class='nav-item'><a class='nav-link' href='index.php?page=logout'>Wyloguj</a></li>
                <li class='nav-item'><a class='nav-link' href='index.php?page=add_product'>Dodaj nowy produkt</a></li>";
            }
            else return "<li class='nav-item'><a class='nav-link' href='index.php?page=logout'>Wyloguj</a></li>";
        }
        else{
            return "<li><a class='nav-link' href='index.php?page=login'>Zaloguj</a></li>
            <li><a class='nav-link' href='index.php?page=register'>Zarejestruj</a></li>";
        }
    }

    function display_user_login()
    {
        if (isset($_SESSION['login'])) return $_SESSION['login'];
        else return "gość";
    }
    $display_user_login = display_user_login();
    $login_session_options = login_session_options();

echo <<<HTML

<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./css/style.css">
    <title>$title</title> 

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
                            <li class="nav-item"><a class="nav-link"  href="index.php">Strona Główna</a></li>
                            <li class="nav-item"><a class="nav-link"  href="index.php?page=products">Produkty</a></li>
                            <li class="nav-item"><a class="nav-link"  href="#">Kontakt</a></li>
                        </ul>
                    </div>
                    <!-- Navbar user icon -->
                    <div class="dropdown">
                        <a class="btn btn-light dropdown-toggle" role="button" id="dropdownMenuLink" data-bs-toggle="dropdown" aria-expanded="false">
                            <i class='fa fa-user-o' style='font-size: 24px;'> $display_user_login</i> 
                        </a>
                        <ul class="dropdown-menu" aria-labelledby="dropdownMenuLink">
                            $login_session_options
                        </ul>
                    </div>
                </div>
            </nav>
            <!-- Search Bar -->
            <nav class="navbar srchbar navbar-light bg-light">
                <form name="searchform" method ="POST" action ="index.php?page=search&se" class="container mx-auto">
                    <div class="input-group">                    
                        <input name="se" type="text" class="form-control" placeholder="Czego szukasz?">
                        <input type="submit" class="btn btn-outline-dark input-group-text" id="basic-addon1" value="Szukaj">
                    </div>
                </form>
            </nav>
        </nav>
    </header>
    <!--Main site -->
    <main class="position-absolute top-50 start-50 translate-middle">
HTML;
}
 
 // Szablon stopki
function template_footer() {
    $year = date("Y");
echo <<<HTML
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
HTML;    
}
?>