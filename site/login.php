<?php error_reporting(0); ?>
<?=template_header('Zaloguj się')?>
<?php 
    if(!isset($_SESSION['login'])){
      echo <<<HTML
        <h1>Zaloguj się</h1>
        <br>
        <form method="POST" action="index.php?page=login&log&pass">
            <div class="form-floating input-group mb-3">
                <input required type="text" name="log" class="form-control" id="loginInput" placeholder="Login">
                <label for="loginInput" class="form-label">Login</label>
                <span class="input-group-text" id="basic-addon"><i class="fa fa-user" aria-hidden="true"></i></span>
            </div>
            <div class="form-floating input-group mb-3">
                <input required type="password" name="pass" class="form-control" id="passInput" placeholder="Hasło" >
                <label for="passInput" class="form-label">Hasło</label>
                <span class="input-group-text" id="basic-addon"><i class="fa fa-unlock-alt" aria-hidden="true"></i></span>
            </div>
            <div class="buttons">
                <input type="submit" value="Zaloguj się">
            </div>
            <p>Nie masz konta? <a href="index.php?page=register">zarejestruj się</a></p>
        </form>
        HTML;
    }
    else header("Location: index.php");
    
    // Sprawdzenie poprawności loginu i hasła
    if(isset($_POST['log']) && isset($_POST['pass'])){
        $stmt = $pdo->prepare('SELECT * FROM users WHERE login = ? AND passw = ? ');
        $stmt->execute([$_POST['log'],hash('sha256',$_POST['pass'])]);
        $user = $stmt->fetch(PDO::FETCH_ASSOC);
        
        if ($user['login'] == $_POST['log'] && $user['passw'] == hash('sha256',$_POST['pass'])){
            $_SESSION['login'] = $_POST['log'];
            echo "<script>alert('Zalogowano');window.location.href='index.php'</script>";
        }
        elseif ($user['login'] != $_POST['log'] || $user['passw'] != hash('sha256',$_POST['pass'])){            
            echo("Wprowadzono zły login lub hasło !");
        }
        else {
            echo("Wprowadzono zły login lub hasło !");
        }
    }
?>
<?=template_footer()?>