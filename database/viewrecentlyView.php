<?php
    include_once("connectionoktilli.php");
    $statement = $pdo->prepare("SELECT * from viewedvehicles");
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