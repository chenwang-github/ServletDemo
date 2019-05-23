<?php
require_once "pdo.php";
$pdo = connect();


$names = array();

$stmt = $pdo->query("SELECT * FROM zipcode");
while ( $row = $stmt->fetch(PDO::FETCH_ASSOC) ) {		
	if(!in_array($row['state'], $names)){

		$names[] = $row['state'];
	}
	
}
?>