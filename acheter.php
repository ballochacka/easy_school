<?php
include 'config.php';

if (!isset($_SESSION['user_id'])) {
  echo "Veuillez vous connecter.";
  exit;
}

$cours_id = $_GET['cours_id'];
$user_id = $_SESSION['user_id'];

// ⚠ Ici normalement tu déclenches une vraie API de paiement
// On simule que le paiement est validé
$stmt = $pdo->prepare("INSERT INTO achats (user_id, cours_id, statut) VALUES (?, ?, 'paye')");
$stmt->execute([$user_id, $cours_id]);

echo '<div style="
    background-color:#d4edda;
    color:#155724;
    padding:15px;
    border:1px solid #c3e6cb;
    border-radius:5px;
    font-family:Arial, sans-serif;
    width:fit-content;
    margin-top:20px;">
    ✅ Paiement validé ! 
    <a href="voir_video.php?cours_id=' . $cours_id . '" style="color:#0c5460; text-decoration:underline;">Voir la vidéo</a>
</div>';
?>