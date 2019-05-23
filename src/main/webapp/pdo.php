
<?php

function connect(){
    // require $_SERVER['DOCUMENT_ROOT'].'/dbconfig.php';
    $hostname = "127.0.0.1";
    $username = "root";
    $password = "root";
    $dbname = "test";

    try{
        $conn = new PDO("mysql:host=$hostname;dbname=$dbname", $username, $password);
        // set the PDO error mode to exception
        $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        return $conn;
    }
    catch(PDOException $e) {
        echo "Connection failed: " . $e->getMessage();
    }
}
