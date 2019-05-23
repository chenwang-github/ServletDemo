<?php
require 'db_state.php';


$q = $_REQUEST['q'];
$suggestions = [];

foreach($names as $k) {
	$q = strtoupper($q);
	if(substr(strval($k), 0, strlen($q)) === $q)
		if(!in_array($k, $suggestions)){
			array_push($suggestions, $k);
		}
}


$response = new stdClass();
$response->suggs = $suggestions;

echo json_encode($response);

?>
