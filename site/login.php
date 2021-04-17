<?php error_reporting(0); ?>
<?=template_header('Zaloguj się')?>
<?php 
    if(!isset($_SESSION['login'])){
      echo <<<HTML
        <form method="POST" action="index.php?page=login&log&pass">
            <h3>login</h3> <input required type="text" name="log" placeholder="Login"><br />
            <h3>haslo</h3> <input required type="password" name="pass" placeholder="Hasło"><br />
            <input type="submit" value="zaloguj">
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
           
            #header("Location: index.php");
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