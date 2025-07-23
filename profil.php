<?php
include 'config.php';


if (!isset($_SESSION['user_id'])) {
  echo "Vous devez être connecté.";
  exit;
}

$nom = $_POST['nom'];
$prenom = $_POST['prenom'];
$filiere = $_POST['filiere'];
$matricule = $_POST['matricule'];

$user_id = $_SESSION['user_id'];

// Vérifier si déjà existant
$stmt = $pdo->prepare("SELECT id FROM eleves WHERE user_id = ?");
$stmt->execute([$user_id]);


if ($stmt->fetch()) {
  $stmt = $pdo->prepare("UPDATE eleves SET nom=?, prenom=?, filiere=?, matricule=? WHERE user_id=?");
  $stmt->execute([$nom, $prenom, $filiere, $matricule, $user_id]);
  
} else {
  $stmt = $pdo->prepare("INSERT INTO eleves (user_id, nom, prenom, filiere, matricule) VALUES (?, ?, ?, ?, ?)");
  $stmt->execute([$user_id, $nom, $prenom, $filiere, $matricule]);
   
  
}

//redirection ver la page des cours

header("Location: cours.php");
exit();

 
?>  