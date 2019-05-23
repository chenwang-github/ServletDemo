<?php
require_once "pdo.php";
$pdo = connect();
?>

<!doctype html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Products</title>
    <link rel = "stylesheet" type = "text.css" href = "style.css">
</head>
<body>
<?php

$stmt = $pdo->query("SELECT * FROM products");
while ( $row = $stmt->fetch(PDO::FETCH_ASSOC)) {
    ?>
    <div id = "Eye">
        <div class="columns">
            <ul  class="products">
                <img class = "height: 50px" src="<?php echo $row["itemi"]; ?>"
                     onclick="loadProduct('<?php echo str_replace("\\","\\\\",$row["itemi"]); ?>',
                             '<?php echo $row["itemn"]; ?>', <?php echo $row["itemp"]; ?>, 1);
                             openButton('sdkfjal');">
                <li> <?php echo $row["itemn"]; ?></li>
                <li class= "price">$<?php echo $row["itemp"]; ?></li>
                <li><button class="cartbutton" onclick="addItem('<?php echo str_replace("\\","\\\\",$row["itemi"]); ?>',
                            '<?php echo $row["itemn"]; ?>', <?php echo $row["itemp"]; ?>, 1)">
                        ADD TO CART</button></li>

            </ul>
        </div>
    </div>
    <?php
}
?>
</body>
</html>
