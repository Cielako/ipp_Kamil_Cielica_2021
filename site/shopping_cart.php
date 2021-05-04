<?php
    // Sprawdzamy formularz po dodaniu do koszyka na stronie produktu
    if(isset($_POST['product_id'], $_POST['quantity']) && is_numeric($_POST['product_id']) && is_numeric($_POST['quantity'])) {
        // Tworzymy zmienne do których mozemy się potem odwołać
        $product_id = (int)$_POST['product_id'];
        $quantity = (int)$_POST['quantity'];

        // Sprawdzamy czy szukany produkt istnieje w bazie danych
        $stmt = $pdo->prepare('SELECT * FROM products WHERE id = ?');
        $stmt->execute([$_POST['product_id']]);
        
        // Wyciągamy produkt z bazy
        $product = $stmt->fetch(PDO::FETCH_ASSOC);

        // Sprawdzamy czy  produkt istnieje
        if($product && $quantity > 0) {
            if (isset($_SESSION['cart']) && is_array($_SESSION['cart'])){
                // Sprawdzamy czy istnieje produkt o danym id w koszyku 
                if(array_key_exists($product_id, $_SESSION['cart'])){
                    $_SESSION['cart']['product_id'] += $quantity;
                }
                // Produktu nie ma w koszyku, więc go dodamy
                else $_SESSION['cart']['product_id'] = $quantity;
            }
            // Jeśli nie istnieje zmienna sesyjna koszyk utwórz taką
            else $_SESSION['cart'] = array($product_id => $quantity); 
        }
        // Zapobiegamy ponownemu dodaniu do koszyka tego samego produktu
        header('location: index.php?page=shopping_cart');
        exit;
    }
?>
<?=template_header('Koszyk')?>
    <div class="cart">
        <h1>Zawartość Twojego koszyka</h1>
        <table>
            <thead>
                <tr>
                    <td>Nazwa Produktu</td>
                    <td>Ilość</td>
                    <td>Cena za sztukę</td>
                    <td>Suma</td>
                </tr>
            </thead>
        </table>
        <hr>
    </div>
<?=template_footer()?>