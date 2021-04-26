<?=template_header("Edytuj produkt")?>
<?php
    if(isset($_SESSION['login'])&& $_SESSION['login'] =='admin'){
      echo <<<HTML
        <form method="POST" action="index.php?page=edit_product&name&category&desc&price&quantity&img">
            <h3>Id produktu</h3> <input required type="number" name="id" placeholder="id" value="{$_SESSION['product_data']['id']}"><br/>
            <h3>Nazwa</h3> <input required type="text" name="name" placeholder="nazwa" value="{$_SESSION['product_data']['name']}"><br/>
            <h3>Kategoria</h3> <input required type="text" name="category" placeholder="kategoria" value="{$_SESSION['product_data']['category']}"><br/>
            <h3>Opis</h3> <textarea required type="text" name="desc" placeholder="opis">{$_SESSION['product_data']['desc']}</textarea><br/>
            <h3>Cena</h3> <input required type="number" name="price" step="any" min="0" placeholder="cena" value="{$_SESSION['product_data']['price']}"><br/>
            <h3>Ilość</h3> <input required type="number" name="quantity" placeholder="ilość"value="{$_SESSION['product_data']['quantity']}"><br/>
            <h3>Zdjęcie</h3> <input type="file" name="img"><button id="img_check" name='img_check'>Sprawdź</button>
        HTML;
        // Podgląd zdjęcia danego produktu
        if(empty($_POST['img'])){
            echo("<img src='imgs/{$_SESSION['product_data']['img']}' alt='{$_SESSION['product_data']['img']}' width='100px' height='100px'> ");  
        }
        elseif(isset($_POST['img'])){
            $_SESSION['product_data']['img']=$_POST['img'];
            if(isset($_POST['img_check'])){
                echo("<img src='imgs/{$_POST['img']}' alt='{$_POST['img']}' width='100px' height='100px'> ");
            }
        }
        echo ("<br/><br/><input type='submit' name='submit' value='Edytuj produkt'></form>");

        if (isset($_POST['submit'])){
            // Zapytanie odpowiadające za edycję produktu 
            $stmt = $pdo->prepare('UPDATE products SET id = ? , products.name = ?, category = ?, products.desc = ?, products.price = ?, products.quantity = ?, products.img = ? WHERE products.id = '.$_SESSION['product_data']['id'].';');
            if (empty($_POST['img'])){
                $stmt->execute([$_POST['id'],$_POST['name'], $_POST['category'], $_POST['desc'], $_POST['price'],$_POST['quantity'],$_SESSION['product_data']['img']]);
            }
            else{
                $stmt->execute([$_POST['id'],$_POST['name'], $_POST['category'], $_POST['desc'], $_POST['price'],$_POST['quantity'],$_POST['img']]);    
            }
            unset($_SESSION['product_data']);
            // Zapobiega ponownemu przesłaniu danych produktu do bazy danych
            echo("<p>Produkt został poprawnie zedytowany</p> 
            <script>
               /* if ( window.history.replaceState ) {
                    window.history.replaceState( null, null, window.location.href );
                } */
                setTimeout(function() {  
                    window.location.href = 'index.php?page=product&id={$_POST['id']}'; 
                 }, 1000);
            </script>");
        }
    }
    else header("Location: index.php");
    ?>
    <?=template_footer()?>