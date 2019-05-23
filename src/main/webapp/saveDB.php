<?php
require_once "pdo.php";
$pdo = connect();
if ( isset($_POST['first_name']) && isset($_POST['last_name']) &&
    isset($_POST['email']) && isset($_POST['address']) &&
    isset($_POST['city']) && isset($_POST['state']) &&
    isset($_POST['zipcode']) && isset($_POST['phone_number']) &&
    isset($_POST['cardname']) && isset($_POST['cardnumber']) &&
    isset($_POST['cvv']) && isset($_POST['expmonth']) &&
    isset($_POST['expyear'])

) {
	$first_name = get_text($_POST["first_name"]);
    $last_name = get_text($_POST["last_name"]);
    $email = get_text($_POST["email"]);
    $address = get_text($_POST["address"]);
    $city = get_text($_POST["city"]);
    $state = get_text($_POST["state"]);
    $zipcode = get_text($_POST["zipcode"]);
    $phone_number = get_text($_POST["phone_number"]);
    $cardname = get_text($_POST["cardname"]);
    $cardnumber = get_text($_POST["cardnumber"]);
    $cvv = get_text($_POST["cvv"]);
    $expmonth = get_text($_POST["expmonth"]);
    $expyear = get_text($_POST["expyear"]);
    
	
    $sql = "INSERT INTO users (first_name, last_name, email,
address, city, state, zipcode, phone_number,cardname,cardnumber, cvv,
expmonth,expyear)
VALUES (:first_name, :last_name,:email, :address,
               :city, :state, :zipcode, :phone_number, 
               :cardname, :cardnumber, :cvv, :expmonth, :expyear)";
    $stmt = $pdo->prepare($sql);
    $stmt->execute(array(
        ':first_name' => $_POST['first_name'],
        ':last_name' => $_POST['last_name'],
        ':email' => $_POST['email'],
        ':address' => $_POST['address'],
        ':city' => $_POST['city'],
        ':state' => $_POST['state'],
        ':zipcode' => $_POST['zipcode'],
        ':phone_number' => $_POST['phone_number'],
        ':cardname' => $_POST['cardname'],
        ':cardnumber' => $_POST['cardnumber'],
        ':cvv' => $_POST['cvv'],
        ':expmonth' => $_POST['expmonth'],
        ':expyear' => $_POST['expyear']));
}
function get_text($data) {
    $data = trim($data);
    $data = stripslashes($data);
    $data = htmlspecialchars($data);
    return $data;
}
?>
<html>
<head></head>
<body>

<?php
    echo "<h2>Shipping Form:</h2>"; ?>
    
    <p><b>First Name:	</b><?php echo $first_name; ?></p>
    <p><b>Last Name:	</b><?php echo $last_name; ?></p>
    <p><b>Email:	</b><?php echo $email; ?></p>

    <p><b>Address:	</b><?php echo$address  ; ?></p>
    <p><b>City:	</b><?php echo$city ; ?></p>
    <p><b>State:	</b><?php echo $state ; ?></p>
    <p><b>Zipcode:	</b><?php echo $zipcode ; ?></p>
    <p><b>Phone Number:	</b><?php echo $phone_number ; ?></p>
    <p><b>Payment Method:	</b><?php echo $cardnumber ; ?></p>
      
    

</body>

