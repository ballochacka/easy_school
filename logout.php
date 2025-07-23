<?php
include 'config.php';
session_destroy();
echo "Vous êtes déconnecté. <a href='login.html'>Se reconnecter</a>";
?>