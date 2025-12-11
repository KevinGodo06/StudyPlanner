<?php
session_start();
require_once '../../googleAPI/vendor/autoload.php';
require_once 'funzioni.php';

$client = new Google_Client();
$client->setClientId('');
$client->setClientSecret('');
$client->setRedirectUri('https://studyplanner.altervista.org/app/scripts/google-callback.php');

if (isset($_GET['code'])) {
    $token = $client->fetchAccessTokenWithAuthCode($_GET['code']);
    
    if (!isset($token['error'])) {
        $client->setAccessToken($token['access_token']);

        // Ottieni le info utente
        $oauth = new Google_Service_Oauth2($client);
        $userData = $oauth->userinfo->get();

        $_SESSION["user"] = [
            "id" => $userData->id,
            "username" => explode("@", $userData->email)[0],
            "email" => $userData->email,
            "nome" => $userData->given_name,
            "cognome" => $userData->family_name,
            "imgProfilo" => $userData->picture
        ];

        $pdo = pdoConnection();

        $stmt = $pdo->prepare('SELECT * FROM Studente WHERE ID = :ID');
        $stmt->bindParam(":ID", $userData->id, PDO::PARAM_STR);
        $stmt->execute();
        $res = $stmt->fetch(PDO::FETCH_ASSOC);
        if(!$res){
            $stmt = $pdo->prepare('INSERT INTO Studente (ID, email, nome, cognome, imgProfilo) VALUES (:ID, :email, :nome, :cognome, :imgProfilo)');
            $stmt->bindParam(":ID", $userData->id);
            $stmt->bindParam(":email", $userData->email, PDO::PARAM_STR);
            $stmt->bindParam(":nome", $userData->given_name, PDO::PARAM_STR);
            $stmt->bindParam(":cognome", $userData->family_name, PDO::PARAM_STR);
            $stmt->bindParam(":imgProfilo", $userData->picture, PDO::PARAM_STR);
            $stmt->execute();
        }

        // Reindirizza alla dashboard
        header('Location: ../index.php');
        exit();
    } else {
        echo "Errore nell'autenticazione con Google.";
    }
} else {
    echo "Codice non fornito da Google.";
}