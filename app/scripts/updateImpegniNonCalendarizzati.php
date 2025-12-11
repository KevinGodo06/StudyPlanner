<?php
session_start();
require_once("funzioni.php");

if (!isset($_SESSION["user"])) {
    http_response_code(401);
    exit;
}

if (!isset($_POST["id"], $_POST["checked"])) {
    http_response_code(400);
    exit;
}

$pdo = pdoConnection();
if (!$pdo) {
    http_response_code(500);
    exit;
}

$stmt = $pdo->prepare("UPDATE ElementoLista SET checked = :checked WHERE ID = :id AND fk_id_studente = :fk");
$stmt->bindValue(":checked", $_POST["checked"]);
$stmt->bindValue(":id", $_POST["id"], PDO::PARAM_INT);
$stmt->bindValue(":fk", $_SESSION["user"]["id"], PDO::PARAM_INT);
$stmt->execute();
?>