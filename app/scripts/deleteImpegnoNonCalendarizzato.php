<?php
session_start();
require_once("funzioni.php");
header("Content-Type: application/json");

ini_set('display_errors', 1);
error_reporting(E_ALL);

try {
    if (!isset($_SESSION["user"])) {
        throw new Exception("Utente non autenticato");
    }

    if (!isset($_POST["id"])) {
        throw new Exception("ID mancante");
    }

    $pdo = pdoConnection();
    if (!$pdo) {
        throw new Exception("Connessione al DB fallita");
    }

    $stmt = $pdo->prepare("DELETE FROM ElementoLista WHERE ID = :id AND fk_id_studente = :studente");
    $stmt->bindValue(":id", $_POST["id"], PDO::PARAM_INT);
    $stmt->bindValue(":studente", $_SESSION["user"]["id"], PDO::PARAM_INT);

    if (!$stmt->execute()) {
        throw new Exception("Errore durante l'eliminazione.");
    }

    echo json_encode(["successo" => true]);
} catch (Exception $e) {
    http_response_code(500);
    echo json_encode(["errore" => $e->getMessage()]);
}
?>