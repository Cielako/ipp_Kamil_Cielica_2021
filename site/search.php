<?php
$num_products_each_page = 4;
// Obecna strona, w pasku URL będzie miała postać index.php?page=products&p=1 .... etc.
$curr_page = isset($_GET['p']) && is_numeric(($_GET['p']))? (int)$_GET['p']:1;
// Sprawdź czy parametr se jest sprecyzowany w pasku URL
if (isset($_POST['se'])) {
    $keyword = $_POST['se'];
    $_SESSION['se'] = $keyword;
    $query = "SELECT * FROM products WHERE (name LIKE '%$keyword%') OR (id LIKE '%$keyword%') OR (category LIKE '%$keyword%') ORDER BY date_added DESC LIMIT ?,?";
    // Przygotuj zapytanie i wykonaj wraz z zabezpieczeniem przed SQL injection
    $stmt = $pdo->prepare($query);
    $stmt->bindValue(1, ($curr_page - 1) * $num_products_each_page, PDO::PARAM_INT);
    $stmt->bindValue(2, $num_products_each_page, PDO::PARAM_INT);
    $stmt->execute();
    // Wybierz produkt z bazy danych i zwróc wynik jako tablicę
    $products = $stmt->fetchAll(PDO::FETCH_ASSOC);

    $total_searched_products = $pdo->query("SELECT * FROM products WHERE (name LIKE '%$keyword%') OR (id LIKE '%$keyword%') OR (category LIKE '%$keyword%')")->rowCount();
    // Sprawdzamy czy produkt istnieje
    if (!$products) {
        // Zwracamy prosty komunikat kiedy id produktu nie istnieje
        template_header('Nie znaleziono');

        exit('Szukany produkt nie istnieje spróbuj ponownie !');       
    }
} else {
    // Zwracamy prosty komunikat jeżeli id nie zostało sprecyzowane w pasku URL
    $keyword=$_SESSION['se'];
    $query = "SELECT * FROM products WHERE (name LIKE '%$keyword%') OR (id LIKE '%$keyword%') OR (category LIKE '%$keyword%') ORDER BY date_added DESC LIMIT ?,?";
    // Przygotuj zapytanie i wykonaj wraz z zabezpieczeniem przed SQL injection
    $stmt = $pdo->prepare($query);
    $stmt->bindValue(1, ($curr_page - 1) * $num_products_each_page, PDO::PARAM_INT);
    $stmt->bindValue(2, $num_products_each_page, PDO::PARAM_INT);
    $stmt->execute();
    // Wybierz produkt z bazy danych i zwróc wynik jako tablicę
    $products = $stmt->fetchAll(PDO::FETCH_ASSOC);

    $total_searched_products = $pdo->query("SELECT * FROM products WHERE (name LIKE '%$keyword%') OR (id LIKE '%$keyword%') OR (category LIKE '%$keyword%')")->rowCount();
    // Sprawdzamy czy produkt istnieje
    if (!$products) {
        // Zwracamy prosty komunikat kiedy id produktu nie istnieje
        template_header('Nie znaleziono');

        exit('Szukany produkt nie istnieje spróbuj ponownie !');       
    }
}
?>

<?=template_header('Znalezione produkty')?>
<div class="products content-wrapper">
        <h1>Produkty</h1>
        <p>Liczba znalezionych produktów: <?=$total_searched_products?></p>
        <hr>
        <div class="products-wrapper">
            <?php foreach ($products as $product): ?>
                <a href="index.php?page=product&id=<?=$product['id']?>" class="product">
                    <img src="imgs/<?=$product['img']?>" alt="<?=$product['name']?>">
                    <span class="name"><h1><?=$product['name']?></h1></span>
                    <span class="price">
                        <?=$product['price']?> zł
                    </span>
                </a>
            <?php endforeach; ?>
        </div>
        <hr>
        <?=$curr_page?> strona</p>
        <div class="buttons">
            <?php if($curr_page > 1): ?>
                <a href="index.php?page=search&p=<?=$curr_page - 1 ?>">Poprzednia</a>
            <?php endif; ?>

            <?php if ($total_searched_products > ($curr_page * $num_products_each_page) - $num_products_each_page + count($products)): ?>
                <a href="index.php?page=search&se&p=<?=$curr_page + 1 ?>">Następna</a>
            <?php endif; ?>
        </div>
    </div>  
</div>

<?=template_footer()?>