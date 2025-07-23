<?php
include 'config.php';
session_start();
$email = $_POST['email'];
$mot_de_passe = $_POST['mot_de_passe'];

// Vérifier
$stmt = $pdo->prepare("SELECT id, mot_de_passe FROM users WHERE email = ?");
$stmt->execute([$email]);
$user = $stmt->fetch();

if ($user && password_verify($mot_de_passe, $user['mot_de_passe'])) {
  $_SESSION['user_id'] = $user['id'];
  echo "Connecté ! <br>Remplissez votre profil  <br> <br> <a href='profil.html'>Clique ici </a>";
} else {
  echo "Identifiants incorrects.";
}
?>