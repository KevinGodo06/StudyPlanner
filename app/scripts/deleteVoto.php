<?php
    session_start();
    header("Content-Type: application/json");
    require_once("funzioni.php");

    if(!isset($_SESSION["user"])){
        header("Location: login.php");
        return;
    }

    $pdo = pdoConnection();

    if(!$pdo){
        header("Location: index.php");
        return;
    }

    $stmt = $pdo->prepare("DELETE FROM Verifica WHERE ID = :id");
    $stmt->bindValue(":id", $_GET["idVoto"], PDO::PARAM_INT);
    $stmt->execute();
?>