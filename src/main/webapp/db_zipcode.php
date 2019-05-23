<?php
require_once "pdo.php";
$pdo = connect();


$zips = array();

$stmt = $pdo->query("SELECT * FROM zipcode");
while ( $row = $stmt->fetch(PDO::FETCH_ASSOC) ) {		
	$zips[$row['zip']] = $row['state'];	
}

$q = $_REQUEST['q'];
$result = array();
if(array_key_exists($q, $zips)){
	array_push($result , $zips[$q]);

}
$response = new stdClass();
$response->suggs = $result ;

echo json_encode($response);

?>