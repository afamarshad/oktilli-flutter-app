<?php
	try{
	$pdo = new PDO('mysql:host=localhost;dbname=id10370550_oktilli', 'id10370550_root', 'aziajn_13');
	$pdo->setAttribute(PDO::ATTR_ERRMODE,PDO::ERRMODE_EXCEPTION);
	// echo "Connection established!!";
	}
	catch(PDOException $ex){
		echo $ex->getMessage();
		die("Could not connect");
	}

?>