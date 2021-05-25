<?=template_header('Zarejestruj się')?>
<?php 
    if(!isset($_SESSION['login'])){
        echo <<<HTML
            <form method="POST" action="index.php?page=register&log&mail&pass&repass">
                    <div class="mb-2">
                        <label for="loginInput" class="form-label">Login</label>
                        <input required type="text" name="log" class="form-control" id="loginInput" placeholder="Login">
                    </div>
                    <div class="mb-2">
                        <label for="mailInput" class="form-label">E-mail</label>
                        <input required type="email" name="mail" class="form-control" id="mailInput" placeholder="Adres e-mail">
                    </div>
                    <div class="mb-2">
                        <label for="passInput" class="form-label">Hasło</label>
                        <input required type="password" name="pass" class="form-control" id="passInput" placeholder="Hasło">
                        <div id="passHelp" class="form-text">Twoje hasło musi się składać z minimum 8 znaków !</div>
                    </div>
                    <div class="mb-2">
                        <label for="repassInput" class="form-label">Powtórz Hasło</label>
                        <input required type="password" name="repass"  class="form-control" id="repassInput" placeholder="Powtórz hasło">
                    </div>
                    <div class="buttons">
                        <input type="submit" value="Zarejestruj się">
                    </div>
            </form>
        HTML;
    }
    else header("Location: index.php");
    
    // Sprawdzenie poprawności loginu i hasła
    if(isset($_POST['log']) && isset($_POST['mail'])&& isset($_POST['pass'])&& isset($_POST['repass'])) {
        if ($_POST['pass'] == $_POST['repass']) {
            if (strlen($_POST['pass']) >= 8) {
                if(strpos($_POST['pass'], " ") !== false) {
                    echo("Hasło nie może zawierać spacji");
                }
                else {
                    $stmt = $pdo->prepare('INSERT INTO users VALUES (0,?,?,?,?) ');
                    $stmt->execute([$_POST['log'],hash('sha256',$_POST['pass']),$_POST['mail'],$_SERVER['REMOTE_ADDR']]);
                    $_SESSION['login'] = $_POST['log'];
                    echo "<script>alert('Gratulacje Twoje konto zostało utworzone');
                    window.location.href='index.php'</script>";
                }
            }
            else{
                echo("Hasło musi składać się z minimum 8 znaków");
            }
        }
        else echo("Hasła różnią się od siebie");
    }
?>
<?=template_footer()?>