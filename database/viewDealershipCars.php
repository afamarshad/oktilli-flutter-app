<?php
    include_once("connection.php");
    $statement = $pdo->prepare("SELECT * from dealershipcars");
    $statement->execute();
    
    $myarray = array();

    while($result = $statement ->fetch()){
        array_push(
            $myarray,array(
                "id"=>$result['id'],
                "name"=>$result['name'],
                "image"=>$result['image'],
                "version"=>$result['version'],
                "price"=>$result['price'],
                "creator"=>$result['creator'],
                "company"=>$result['company'],
            )
        );
    }

    echo json_encode($myarray);
?>