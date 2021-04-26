<?=template_header("Dodaj nowy produkt do sklepu")?>
<?php  
    if(isset($_SESSION['login'])&& $_SESSION['login'] =='admin'){
      echo <<<HTML
        <form method="POST" action="index.php?page=add_product&name&category&desc&price&quantity&img">
            <h3>Nazwa</h3> <input required type="text" name="name" placeholder="nazwa"><br/>
            <h3>Kategoria</h3> <input required type="text" name="category" placeholder="kategoria"><br/>
            <h3>Opis</h3> <textarea required type="text" name="desc" placeholder="opis"></textarea><br/>
            <h3>Cena</h3> <input required type="number" name="price" step="any" min="0" placeholder="cena"><br/>
            <h3>Ilość</h3> <input required type="number" name="quantity" placeholder="ilość"><br/>
            <h3>Zdjęcie</h3> <input required type="file" name="img" placeholder="Zdjęcie"><br/>
            <input type="submit" name="submit" value="Dodaj nowy produkt">
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