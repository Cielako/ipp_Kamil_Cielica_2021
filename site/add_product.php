<?=template_header("Dodaj nowy produkt do sklepu")?>
<?php  
    if(isset($_SESSION['login'])&& $_SESSION['login'] =='admin'){
      echo <<<HTML
        <form method="POST" action="index.php?page=add_product&name&category&desc&price&quantity&img">
            <div class="mb-2">
                <label for="nameInput" class="form-label">Nazwa</label>
                <input required type="text"  name="name" class="form-control" id="nameInput" placeholder="np. Atari">
            </div>
            <div class="mb-2">
                <label for="catInput" class="form-label">Kategoria</label>
                <input required type="text"  name="category" class="form-control" id="catInput" placeholder="np. komputer">
            </div>
            <div class="mb-2">
                <label for="descInput" class="form-label">Opis</label>
                <textarea required resize="none" type="text" rows="6" name="desc" class="form-control" id="descInput" placeholder="np. fajny komputer"></textarea>
            </div>
            <div class="mb-2">
                <label for="priceInput" class="form-label">Cena</label>
                <input required type="number" step="any" min="0" name="price" class="form-control" id="priceInput" placeholder="Cena za sztukę">
            </div>
            <div class="mb-2">
                <label for="quanInput" class="form-label">Ilość</label>
                <input required type="number" name="quantity" class="form-control" id="quanInput" placeholder="Ilość sztuk">
            </div>
            <div class="mb-3">
                <label for="imgInput" class="form-label">Zdjęcie</label>
                <input required type="file" name="img" class="form-control" id="imgInput">
            </div>
            <div class="buttons">
                <input type="submit" name="submit" value="Dodaj nowy produkt">
            </div>
        </form>
        HTML;
    }
    else header("Location: index.php");

    if (isset($_POST['submit'])){
        // Zapytanie odpowiadające za dodanie nowego produktu do bazy danych sklepu
        $stmt = $pdo->prepare('INSERT INTO products VALUES (0,?,?,?,?,?,?,current_timestamp())');
        $stmt->execute([$_POST['name'], $_POST['category'], $_POST['desc'], $_POST['price'],$_POST['quantity'],$_POST['img']]);
        unset($_POST);

        // Zapobiega ponownemu przesłaniu danych produktu do bazy danych
        echo("<p>Dodano nowy produkt do bazy danych sklepu</p>
        <script>
            if ( window.history.replaceState ) {
                window.history.replaceState( null, null, window.location.href );
            }
        </script>");
    }
?>
<?=template_footer()?>