<?php
    $pdo->query("DELETE FROM products WHERE id = $_GET[id]");
    header("Location: index.php?page=products");
?>    