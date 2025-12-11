<?php
    session_start();
    require_once("funzioni.php");

    if(!isset($_SESSION["user"])){
        header("Location: login.php");
        return;
    }

    if(!isset($_POST["votoObiettivo"]) || !isset($_POST["fk_id_materia_obiettivo"])){
        header("Location: ../index.php");
        return;
    }

    $obiettivo = $_POST["votoObiettivo"];
    $id_materia = $_POST["fk_id_materia_obiettivo"];
    $_SESSION["obiettivo"] = $obiettivo . " " . $id_materia;

    $pdo = pdoConnection();

    if(!$pdo){
        header("Location: ../index.php");
        return;
    }

    $stmt = $pdo->prepare("UPDATE Materia SET obiettivo = :obiettivo WHERE ID = :id_materia AND fk_id_studente = :fk_id_studente");

    $stmt->bindParam(":obiettivo", $obiettivo, PDO::PARAM_STR);
    $stmt->bindParam(":id_materia", $id_materia, PDO::PARAM_INT);
    $stmt->bindParam(":fk_id_studente", $_SESSION["user"]["id"]);

    $stmt->execute();
    header("Location: ../index.php");
    return;
?>