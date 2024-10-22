<?php 
// Liczba produktów na konkretnej stronie
$num_products_each_page = 6;
// Obecna strona, w pasku URL będzie miała postać index.php?page=products&p=1 .... etc.
$curr_page = isset($_GET['p']) && is_numeric(($_GET['p'])) ? (int)$_GET['p']:1;
// Przygotuj zapytanie o produkty z bazy danych sortując według daty dodania
$stmt = $pdo->prepare('SELECT * FROM PRODUCTS ORDER BY date_added DESC LIMIT ?,?');
// bindValue pozwala użyć inta przy zapytaniu SQL, gdzie zastępujemy znaki zapytania (wartościami) żeby ograniczyć ilośc produktów na stronie
$stmt->bindValue(1, ($curr_page - 1) * $num_products_each_page, PDO::PARAM_INT);
$stmt->bindValue(2, $num_products_each_page, PDO::PARAM_INT);
$stmt->execute();
// Pobierz produkty z bazy danych według zapytania (zwraca dane jako tablice)
$products = $stmt->fetchAll(PDO::FETCH_ASSOC);
//  Liczba wszystkich produktów na stronie 
$total_products = $pdo->query('SELECT * FROM products')->rowCount();
?>
<?= template_header("Produkty")?>
    <div class="products content-wrapper">
        <h1>Produkty</h1>
        <p>Liczba wszystkich produktów: <?=$total_products?></p>
        <hr>
        <div class="products-wrapper">
            <?php foreach ($products as $product): ?>
                <a href="index.php?page=product&id=<?=$product['id']?>" class="product">
                    <img src="imgs/<?=$product['img']?>" class="rounded" alt="<?=$product['name']?>">
                    <span class="name"><p><?=$product['name']?></p></span>
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
                <a href="index.php?page=products&p=<?=$curr_page - 1 ?>">Poprzednia</a>
            <?php endif; ?>

            <?php if ($total_products > ($curr_page * $num_products_each_page) - $num_products_each_page + count($products)): ?>
                <a href="index.php?page=products&p=<?=$curr_page + 1 ?>">Następna</a>
            <?php endif; ?>
        </div>
    </div>  
<?= template_footer()?>