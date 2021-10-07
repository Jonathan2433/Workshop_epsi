<?php
header('Access-Control-Allow-Origin: *');
include "config.php";

// Prenom
$cond_nom = "1";
if(isset($_GET['nom']) && $_GET['nom'] != ""){
    $nom = $_GET['nom'];
    $cond_nom = "nom='".$nom."'";
}

// Nom
$cond_prenom = "1";
if(isset($_GET['prenom']) && $_GET['prenom'] != ""){
    $prenom = $_GET['prenom'];
    $cond_prenom = "prenom='".$prenom."'";
}

// age
$cond_age = "1";
if(isset($_GET['age']) && $_GET['age'] != ""){
    $age = $_GET['age'];
    $cond_age = "age='".$age."'";
}

// Centre de formation
$cond_centre_formation = "1";
if(isset($_GET['centre_formation']) && $_GET['centre_formation'] != ""){
    $centre_formation = $_GET['centre_formation'];
    $cond_centre_formation = "centre_formation='".$centre_formation."'";
}

// Metier
$cond_formation = "1";
if(isset($_GET['formation']) && $_GET['formation'] != ""){
    $formation = $_GET['formation'];
    $cond_formation = "formation='".$formation."'";
}

// Email
$cond_mail = "1";
if(isset($_GET['mail']) && $_GET['mail'] != ""){
    $mail = $_GET['mail'];
    $cond_mail = "mail='".$mail."'";
}
$cond_loginMail = "1";
if(isset($_GET['loginMail']) && $_GET['loginMail'] != ""){
    $loginMail = $_GET['loginMail'];
    $cond_loginMail = "mail='".$loginMail."'";
}

// Password
$cond_password = "1";
if(isset($_GET['password']) && $_GET['password'] != ""){
    $password = hash("sha256", $_GET['password']);
    $cond_password = "password='".$password."'";
}
$cond_loginPassword = "1";
if(isset($_GET['loginPassword']) && $_GET['loginPassword'] != ""){
    $loginPassword = hash("sha256", $_GET['loginPassword']);
    $cond_loginPassword = "password='".$loginPassword."'";
}

if(isset($_GET['requestType'])){
    if(strtolower($_GET['requestType']) == "select"){
        $userData = mysqli_query($con,"SELECT * FROM utilisateur WHERE " . $cond_nom . " AND " . $cond_prenom . " AND " . $cond_age . " AND " . $cond_centre_formation . " AND " . $cond_formation . " AND " . $cond_mail . " AND ". $cond_loginMail . " AND " . $cond_password . " AND " . $cond_loginPassword);
        // $response = "SELECT * FROM users WHERE " . $cond_nom . " AND " . $cond_prenom . " AND " . $cond_mail . " AND ". $cond_loginMail . " AND " . $cond_password . " AND " . $cond_loginPassword;
        $response = array();
        while($row = mysqli_fetch_assoc($userData)){
            $response[] = $row;
        }
    }
    if(strtolower($_GET['requestType']) == "insert"){
        mysqli_query($con,"INSERT INTO utilisateur (id_utilisateur, nom, prenom, mail, age,  mdp) VALUES (null, \"" . $nom . "\", \"" . $prenom . "\", \"" . $mail . "\", \"" . $age . "\", \"" . $password . "\")");
        $userData = mysqli_query($con,"SELECT * FROM users WHERE " . $cond_nom . " AND " . $cond_prenom . " AND " . $cond_mail . " AND ". $cond_loginMail . " AND " . $cond_password . " AND " . $cond_loginPassword);
        // $response = "SELECT * FROM users WHERE " . $cond_nom . " AND " . $cond_prenom . " AND " . $cond_mail . " AND ". $cond_loginMail . " AND " . $cond_password . " AND " . $cond_loginPassword;
        $response = array();
        while($row = mysqli_fetch_assoc($userData)){
            $response[] = $row;
        }
    }
} else {
    exit;
}
echo json_encode($response);
exit;