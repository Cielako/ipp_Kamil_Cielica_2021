<?=template_header("Edytuj produkt")?>
<?php
    if(isset($_SESSION['login'])&& $_SESSION['login'] =='admin'){
      echo <<<HTML
        <form method="POST" action="index.php?page=edit_product&name&category&desc&price&quantity&img">
            <div class="mb-2">
                <label for="idInput" class="form-label">Id</label>
                <input required type="number" name="id" value="{$_SESSION['product_data']['id']}"class="form-control" id="nameInput" placeholder="Nowe ID produktu">
            </div>
            <div class="mb-2">
                <label for="nameInput" class="form-label">Nazwa</label>
                <input required type="text"  name="name" class="form-control" id="nameInput" value="{$_SESSION['product_data']['name']}" placeholder="Nowa nazwa produktu">
            </div>
            <div class="mb-2">
                <label for="catInput" class="form-label">Kategoria</label>
                <input required type="text"  name="category" class="form-control" id="catInput" value="{$_SESSION['product_data']['category']}" placeholder="Nowa kategoria produktu">
            </div>
            <div class="mb-2">
                <label for="descInput" class="form-label">Opis</label>
                <textarea required resize="none" type="text" rows="4" name="desc" class="form-control" id="descInput" placeholder="np. fajny komputer">{$_SESSION['product_data']['desc']}</textarea>
            </div>
            <div class="mb-2">
                <label for="priceInput" class="form-label">Cena</label>
                <input required type="number" step="any" min="0" name="price" class="form-control" id="priceInput" value="{$_SESSION['product_data']['price']}" placeholder="Cena za sztukę">
            </div>
            <div class="mb-2">
                <label for="quanInput" class="form-label">Ilość</label>
                <input required type="number" name="quantity" class="form-control" id="quanInput" value="{$_SESSION['product_data']['quantity']}" placeholder="Ilość sztuk">
            </div>
            <div class="mb-2">
                <label for="imgInput" class="form-label">Zdjęcie</label>
                <input type="file" name="img" class="form-control" id="imgInput">
            </div>
            <div class="buttons">
                <button id="img_check" name='img_check'>Sprawdź</button>
           
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
        echo ("<input type='submit' name='submit' value='Edytuj produkt'></div></form>");

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