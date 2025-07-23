<?php
include 'config.php';
//session_start(); // N'oublie pas ça si tu utilises les sessions

if (!isset($_SESSION['user_id'])) {
    echo "Veuillez vous connecter.";
    exit;
}

// Récupération des cours depuis la base
$cours = $pdo->query("SELECT * FROM cours")->fetchAll();
?>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Liste des cours</title>
    <link rel="stylesheet" href="Style3.css">
</head>
<body>

    <h1>Liste des cours</h1>

    <div class="course-list">
        <?php foreach ($cours as $c) { ?>
            <div class="course-item">
                <div class="course-title"><?= htmlspecialchars($c['titre']) ?></div>
                <div>
                    Prix : <?= htmlspecialchars($c['prix']) ?> FCFA
                    <a href="acheter.php?cours_id=<?= $c['id'] ?>">Acheter</a>
                </div>
            </div>
        <?php } ?>
    </div>

    <a class="logout" href="logout.php">Déconnexion</a>

</body>
</html>