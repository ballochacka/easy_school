<?php
include 'config.php';

$email = $_POST['email'];
$mot_de_passe = $_POST['mot_de_passe'];

// Vérifier si l'email existe déjà
$stmt = $pdo->prepare("SELECT id FROM users WHERE email = ?");
$stmt->execute([$email]);

if ($stmt->fetch()) {
  echo "Cet email existe déjà.";
  exit;
}

// Hasher le mot de passe
$hash = password_hash($mot_de_passe, PASSWORD_DEFAULT);

// Insérer
$stmt = $pdo->prepare("INSERT INTO users (email, mot_de_passe) VALUES (?, ?)");
$stmt->execute([$email, $hash]);

echo "Compte créé. <a href='login.html'>Se connecter</a>";
?>