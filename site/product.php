<?php
// Sprawdź czy parametr id jest sprecyzowany w pasku URL
if (isset($_GET['id'])) {
    // Przygotuj zapytanie i wykonaj wraz z zabezpieczeniem przed SQL injection
    $stmt = $pdo->prepare('SELECT * FROM products WHERE id = ?');
    $stmt->execute([$_GET['id']]);
    // Wybierz produkt z bazy danych i zwróc wynik jako tablicę
    $product = $stmt->fetch(PDO::FETCH_ASSOC);
    // Sprawdzamy czy produkt istnieje
    if (!$product) {
        // Zwracamy prosty komunikat kiedy id produktu nie istnieje
        exit('Produkt nie istnieje !');
    }
} else {
    // Zwracamy prosty komunikat jeżeli id nie zostało sprecyzowane w pasku URL
    exit('Produkt nie istnieje !');
}
?>

<?=template_header('Produkt')?>

<div class="product productpage content-wrapper">
    <img src="imgs/<?=$product['img']?>"alt="<?=$product['name']?>">
    <div>
        <h1 class="name"><?=$product['name']?></h1>
        <span class="price">
            Cena: <?=$product['price']?> zł
        </span>
       <h2>Opis produktu:</h2>
        <div class="description">
            <?=$product['desc']?>
        </div>
        </br>
        <?php
            if (isset($_SESSION['login'])&& $_SESSION['login'] == 'admin'){
                $_SESSION['product_data'] = $product;
                echo <<<HTML
                    <form method="POST" action="index.php?page=edit_product">
                        <button type="submit" data-bs-toggle="tooltip" data-bs-placement="bottom" title="Edytuj produkt"><i class='fa fa-pencil-square-o'></i></button>
                    </form>
                    <form method="POST" action="index.php?page=delete_product&id={$_GET['id']}">
                        <button type="submit" data-bs-toggle="tooltip" data-bs-placement="bottom" title="Usuń Produkt"><i class='fa fa-trash-o'></i></button>
                    </form>
                HTML; 
            }
        ?>
    </div>
</div>

<?=template_footer()?>