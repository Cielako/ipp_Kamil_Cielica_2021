<?php
// Sprawdź czy parametr id jest sprecyzowany w pasku URL
if (isset($_GET['id'])) {
    // Przygotuj zapytanie i wykonaj wraz z zabezpieczeniem przed SQL injection
    $stmt = $pdo->prepare('SELECT * FROM products WHERE id = ?');
    $stmt->execute([$_GET['id']]);
    // Wybierz produkty z bazy danych i zwróc wynik jako tablicę
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
            Cena: <?=$product['price']?> zł  <button>Dodaj do koszyka</button>
        </span>
       <h2>Opis produktu:</h2>
        <div class="description">
            <?=$product['desc']?>
        </div>
    </div>
</div>

<?=template_footer()?>