<?=template_header('Zarejestruj się')?>
<?php 
    if(!isset($_SESSION['login'])){
        echo <<<HTML
               
            <h1>Utwórz nowe konto</h1>
            <br>
            <form method="POST" action="index.php?page=register&log&mail&pass&repass">
                    <div class="form-floating input-group mb-3">
                        <input required type="text" name="log" class="form-control" id="loginInput" placeholder="Login">
                        <label for="loginInput" class="form-label">Login</label>
                        <span class="input-group-text" id="basic-addon"><i class="fa fa-user" aria-hidden="true"></i></span>
                    </div>
                    <div class="form-floating input-group mb-3">
                        <input required type="email" name="mail" class="form-control" id="mailInput" placeholder="Adres e-mail">
                        <label for="mailInput" class="form-label">E-mail</label> 
                        <span class="input-group-text" id="basic-addon"><i class="fa fa-envelope" aria-hidden="true"></i></span>
                    </div>
                    <div class="form-floating input-group mb-3">
                        <input required type="password" name="pass" class="form-control" id="passInput" placeholder="Hasło" >
                        <label for="passInput" class="form-label">Hasło</label>
                        <span class="input-group-text" id="basic-addon"><i class="fa fa-unlock-alt" aria-hidden="true"></i></span>
                    </div>
                    <div class="form-floating mb-2">
                        <input required type="password" name="repass"  class="form-control" id="repassInput" placeholder="Powtórz hasło">
                        <label for="repassInput" class="form-label">Powtórz Hasło</label>
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