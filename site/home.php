<?=template_header('Strona Główna')?>
<?php
// Wyświetl 4 nowo dodane produkty
$stmt = $pdo->prepare('SELECT * FROM products ORDER BY date_added DESC LIMIT 4');
$stmt->execute();
$recently_added_products = $stmt->fetchAll(PDO::FETCH_ASSOC);
?>
<div class="products content-wrapper">
    <h2>Nowo dodane produkty</h2>
    <hr>
    <div class="products-wrapper">
            <?php foreach ($recently_added_products as $product): ?>
                <a href="index.php?page=product&id=<?=$product['id']?>" class="product">
                    <img src="imgs/<?=$product['img']?>" alt="<?=$product['name']?>">
                    <span class="name"><h1><?=$product['name']?></h1></span>
                    <span class="price">
                        <?=$product['price']?> zł
                    </span>
                </a>
            <?php endforeach; ?>
    </div>
</div>
<?=template_footer()?>