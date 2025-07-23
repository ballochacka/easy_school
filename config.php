<?php
session_start();

$host = "localhost"; // remplace par le vrai nom affiché
$dbname = "easy_school"; // ta base
$username = "root"; // ton identifiant
$password = ""; // ton mot de passe


/*$host = "sql305.infinityfree.com"; // remplace par le vrai nom affiché
$dbname = "if0_39497460_easy_school"; // ta base
$username = "if0_39497460"; // ton identifiant
$password = "F1uCNyAuY9ne"; // ton mot de passe
*/

try{
    $pdo = new
    PDO("mysql:host=localhost;dbname=easy_school;charset=utf8", "root", "");
    $pdo->setAttribute(PDO::ATTR_ERRMODE,
    PDO::ERRMODE_EXCEPTION);
}catch(PDOException $e){
    die("Erreur de connexion : ".
    $e->getMessage());
}



/*try {
    $conn = new PDO("mysql:host=$host;dbname=$dbname", $username, $password);
    // Activer les erreurs
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    echo "Connexion réussie !";
} catch(PDOException $e) {
    echo "Erreur : " . $e->getMessage();
}
    */
?>