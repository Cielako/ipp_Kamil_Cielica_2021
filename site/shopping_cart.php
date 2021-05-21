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
                    $_SESSION['cart'][$product_id] += $quantity;
                }
                // Produktu nie ma w koszyku, więc go dodamy
                else $_SESSION['cart'][$product_id] = $quantity;
            }
            // Jeśli nie istnieje zmienna sesyjna koszyk utwórz taką
            else $_SESSION['cart'] = array($product_id => $quantity); 
        }
        // Zapobiegamy ponownemu dodaniu do koszyka tego samego produktu
        header('location: index.php?page=shopping_cart');
        exit;
    }

    //Aktualizowanie ilości produktów w koszyku
    if (isset($_POST['update']) && isset($_SESSION['cart'])){
        foreach($_POST as $p => $v){
            echo("<p>'.$v.'</p>");
            if(strpos($p, 'quantity') !== false && is_numeric($v)){
                $id = str_replace('quantity_','',$p);
                $quantity = (int)$v;
                // Zawsze sprawdzamy i wprowadzamy zmiany
                if(isset($_SESSION['cart']) && is_numeric($id) && $quantity > 0){
                    // Aktualizujemy ilośc danego produktu
                    $_SESSION['cart'][$id] = $quantity;
                }
            }
        }
        // zapobiegamy ponownemu wykonaniu się czynności 
        header('location: index.php?page=shopping_cart');
        exit;
    }

    // Usuwanie zawartości koszyka (konkretnego produktu)
    if (isset($_GET['remove']) && is_numeric($_GET['remove'])){
        if (isset($_SESSION['cart']) && isset($_SESSION['cart'][$_GET['remove']])){
            // Usuń produkt z koszyka
            unset($_SESSION['cart'][$_GET['remove']]);
            // Załaduj ponownie stronę
            header('location: index.php?page=shopping_cart');
            exit;
        }  
    }

    // Sprawdzamy zmienną sesyjną czy w koszyku znajdują się jakieś produkty
    $cart_products = isset($_SESSION['cart']) ? $_SESSION['cart'] : array();
    $products = array();
    $subtotal = 0.00;
    // Jeśli istnieje jakiś produkt w koszyku to wyciągamy jego dane z bazy 
    if($cart_products){
        $array_to_question_marks = implode(',', array_fill(0, count($cart_products), '?'));
        $stmt = $pdo->prepare('SELECT * FROM products WHERE id IN (' . $array_to_question_marks . ')');
        // Potrzebujemy tylko kluczy nie ich wartości
        $stmt->execute(array_keys($cart_products));
        // Wyciągnij produkty z bazy danych i zwróć jako 
        $products = $stmt->fetchAll(PDO::FETCH_ASSOC);
        // Oblicz kwotę do zapłaty
        foreach ($products as $product) {
            $subtotal += (float)$product['price'] * (int)$cart_products[$product['id']];
        }
    }

?>
<?=template_header('Koszyk')?>
    <div class="cart">
        <h1>Zawartość Twojego koszyka</h1>
        <form action="index.php?page=shopping_cart" method="POST">
            <table>
                <thead>
                    <tr>
                        <td colspan="2">Nazwa Produktu</td>
                        <td>Ilość</td>
                        <td>Cena za sztukę</td>
                        <td>Suma</td>
                        <td></td>
                    </tr>
                </thead>
                <tbody>
                    <?php 
                        if (empty($products)){
                            echo<<<HTML
                                <tr>
                                    <td colspan="6" style="text-align:center;">Twój koszyk jest pusty</td>
                                </tr>
                            HTML;
                        }
                        else foreach ($products as $product):
                    ?>
                        <tr>
                            <td class="img">
                                <a href="index.php?page=product&id=<?=$product['id']?>">
                                    <img src="imgs/<?=$product['img']?>" width="50" height="50" alt="<?=$product['name']?>">
                                </a>
                            </td>
                            <td>
                                <a href="index.php?page=product&id=<?=$product['id']?>"><?=$product['name']?></a>
                            </td>
                            <td class="quantity">
                                <input type="number" name="quantity_<?=$product['id']?>" value="<?=$cart_products[$product['id']]?>" min="1" max="<?=$product['quantity']?>" placeholder="Quantity" required>
                            </td>
                            <td class="price"><?=$product['price']?> zł</td>
                            <td class="price"><?=$product['price'] * $cart_products[$product['id']]?> zł</td>
                            <td>
                                <a href="index.php?page=shopping_cart&remove=<?=$product['id']?>" class="remove"><i class="fa fa-trash"></i></a>
                            </td>
                        </tr>
                        <?php endforeach; ?>
                </tbody>
            </table>
            <div class="subtotal">
                <span class="text">Kwota do zapłaty</span>
                <span class="price"> <?=$subtotal?> zł </span>
            </div>
            <div class="buttons">
                <input type="submit" name="order" value="Złóż zamówienie">
                <input type="submit" name="update" value="Aktualizuj Zawartość koszyka">
            </div>
        </form>
    </div>
<?=template_footer()?>