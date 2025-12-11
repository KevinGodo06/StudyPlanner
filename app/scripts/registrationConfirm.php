<?php
    session_start();
    require_once("funzioni.php");

    if(isset($_SESSION["user"])) {
        header("Location: ../index.php");
        return;
    }

    /*controllo che i campi obbligatori siano inseriti*/
    if(!isset($_POST['nome']) || !isset($_POST['cognome']) || !isset($_POST['email']) || !isset($_POST['pwd']) || !isset($_POST['confPwd'])){
        $_SESSION["errorRegistrationConfirm"] = "Campi obbligatori non inseriti";
        header("Location: ../registrazione.php");
        return;
    }

    /*salvataggio dati*/
    $nome = $_POST["nome"];
    $cognome = $_POST["cognome"];
    $email = $_POST["email"];
    $password = $_POST["pwd"];
    $confermaPassword = $_POST["confPwd"];

    /*controllo password*/
    if(!preg_match("/^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/", $password)){
        $_SESSION["errorRegistrationConfirm"] = "è necessario un carattere maiuscolo, un carattere minuscolo, un numero e un carattere speciale (@ $ ! % * ? & )";
        header("Location: ../registrazione.php");
        return;
    }

    if($password != $confermaPassword) {
        $_SESSION["errorRegistrationConfirm"] = "Le password non corrispondono";
        header("Location: ../registrazione.php");
        return;
    }

    /*creazione PDO*/
    $pdo = pdoConnection();

    if(!$pdo){
        $_SESSION["errorRegistrationConfirm"] = "Connessione al DataBase fallita";
        header("Location: ../registrazione.php");
        return;
    }

    /*controllo email*/
    $stmt = $pdo->prepare("SELECT * FROM Studente WHERE email = :email");
    $stmt->bindValue(":email", $email, PDO::PARAM_STR);
    $res = $stmt->execute();
    $row = $stmt->fetch();

    //controllo che non esista, o che se esista, le prime 4 lettere del campo imgProfilo non siano http
    if($row && substr($row["imgProfilo"], 0, 4) != "http") {
        $_SESSION["errorRegistrationConfirm"] = "Email già registrata";
        header("Location: ../registrazione.php");
        return;
    }

    $idProva;
    do{
        $idProva = rand() % 1000000000;
        $_SESSION["idProva"] = $idProva;
        $stmt = $pdo->prepare("SELECT * FROM Studente WHERE ID = :ID");
        $stmt->bindValue(":ID", $idProva, PDO::PARAM_INT);
        $res = $stmt->execute();
        $row = $stmt->fetchAll();
    } while($row);


    /*inserimento utente nel database*/
    $stmt = $pdo->prepare("INSERT INTO Studente (ID, email, nome, cognome, hashPassword, token) VALUES (:ID, :email, :nome, :cognome, :pwd, :token)");

    $stmt->bindValue(":ID", $idProva);

    $stmt->bindValue(":email", $email, PDO::PARAM_STR);

    $stmt->bindValue(":nome", $nome, PDO::PARAM_STR);

    $stmt->bindValue(":cognome", $cognome, PDO::PARAM_STR);

    $hashPassword = hash("sha256", $password);
    $stmt->bindValue(":pwd", $hashPassword, PDO::PARAM_STR);

    $hashToken = hash("sha256", rand());
    $stmt->bindValue(":token", $hashToken, PDO::PARAM_STR);

    $res = $stmt->execute();

    if(!$res){
        $_SESSION["errorRegistrationConfirm"] = "Registrazione fallita";
        header("Location: ../registrazione.php");
        return;
    }

    require_once("mailHeaderBody.php");

    if(mail($email, "Verifica", $corpo, $headers)){
        $_SESSION["successRegistration"] = "Ti abbiamo inviato una mail per verificare il tuo account";
        header("Location: ../login.php");
        return;
    } else {
        $_SESSION["errorRegistrationConfirm"] = "Invio mail fallito";
        header("Location: ../registrazione.php");
        return;
    }
?>