<?=template_header('Zarejestruj się')?>
<?php 
    if(!isset($_SESSION['login'])){
        echo <<<HTML
            <form method="POST" action="index.php?page=register&log&mail&pass&repass">
                    <h3>Login</h3> <input required type="text" name="log" placeholder="Login"><br />
                    <h3>E-mail</h3> <input required type="email" name="mail" placeholder="Adres e-mail"><br />
                    <h3>Hasło</h3> <input required type="password" name="pass" placeholder="Hasło"><br />
                    <h3>Powtórz Hasło</h3> <input required type="password" name="repass" placeholder="Powtórz hasło"><br />
                    <input type="submit" value="zarejestruj">
            </form>
        HTML;
    }
    else header("Location: index.php");
    
    // Sprawdzenie poprawności loginu i hasła
    if(isset($_POST['log']) && isset($_POST['mail'])&& isset($_POST['pass'])&& isset($_POST['repass'])){
        if ($_POST['pass'] == $_POST['repass']){
            if (strlen($_POST['pass']) >= 8){
                $stmt = $pdo->prepare('INSERT INTO users VALUES (0,?,?,?,?) ');
                $stmt->execute([$_POST['log'],hash('sha256',$_POST['pass']),$_POST['mail'],$_SERVER['REMOTE_ADDR']]);
                $_SESSION['login'] = $_POST['log'];
                echo "<script>alert('Gratulacje Twoje konto zostało utworzone');
                window.location.href='index.php'</script>";
            }
            else{
                echo("Hasło musi składać się z minimum 8 znaków");
            }
        }
        else echo("Hasła różnią się od siebie");
    }
?>
<?=template_footer()?>