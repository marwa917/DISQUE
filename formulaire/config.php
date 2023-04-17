<?php
try {
    $bdd =new PDO ('mysql:host=localhost;dbname=disque;charset=ytf8','root','');
}catch (exception $e)
{
    die('Erreur'.$e->getMessage());
}