<?php
header('Access-Control-Allow-Origin: *');
include "config.php";

// Prenom
$cond_nom = "1";
if(isset($_GET['nom']) and $_GET['nom'] != ""){
    $nom = $_GET['nom'];
    $cond_nom = "nom='".$nom."'";
}

// Nom
$cond_prenom = "1";
if(isset($_GET['prenom']) and $_GET['prenom'] != ""){
    $prenom = $_GET['prenom'];
    $cond_prenom = "prenom='".$prenom."'";
}

// age
$cond_age = "1";
if(isset($_GET['age']) and $_GET['age'] != ""){
    $age = $_GET['age'];
    $cond_age = "age='".$age."'";
}

// Centre de formation
$cond_id_etablissement = "1";
if(isset($_GET['centre_formation']) and $_GET['centre_formation'] != ""){
    $id_etablissement = $_GET['centre_formation'];
    $cond_id_etablissemant = "id_etablissement='".$id_etablissement."'";
}

// Metier
$cond_id_metier = "1";
if(isset($_GET['formation']) and $_GET['formation'] != ""){
    $id_metier = $_GET['formation'];
    $cond_id_metier = "id_metier='".$id_metier."'";
}

// Email
$cond_mail = "1";
if(isset($_GET['mail']) and $_GET['mail'] != ""){
    $mail = $_GET['mail'];
    $cond_mail = "mail='".$mail."'";
}
$cond_loginMail = "1";
if(isset($_GET['loginMail']) and $_GET['loginMail'] != ""){
    $loginMail = $_GET['loginMail'];
    $cond_loginMail = "mail='".$loginMail."'";
}

// Password
$cond_password = "1";
if(isset($_GET['password']) and $_GET['password'] != ""){
    $password = hash("sha256", $_GET['password']);
    $cond_password = "mdp='".$password."'";
}
$cond_loginPassword = "1";
if(isset($_GET['loginPassword']) and $_GET['loginPassword'] != ""){
    $loginPassword = hash("sha256", $_GET['loginPassword']);
    $cond_loginPassword = "mdp='".$loginPassword."'";
}

if(isset($_GET['requestType'])){
    if(strtolower($_GET['requestType']) == "select"){
        $userData = mysqli_query($con,"SELECT * FROM utilisateur WHERE " . $cond_nom . " AND " . $cond_prenom . " AND " . $cond_age . " AND " . $cond_mail . " AND ". $cond_loginMail . " AND " . $cond_password . " AND " . $cond_loginPassword);
        // $response = "SELECT * FROM users WHERE " . $cond_nom . " AND " . $cond_prenom . " AND " . $cond_mail . " AND ". $cond_loginMail . " AND " . $cond_password . " AND " . $cond_loginPassword;
        $response = array();
        while($row = mysqli_fetch_assoc($userData)){
            $response[] = $row;
        }
    }
    if(strtolower($_GET['requestType']) == "insert"){
        $existing_mail = mysqli_query($con, "SELECT * FROM utilisateur WHERE " . $cond_mail);
        if ($existing_mail->num_rows == null) {
            mysqli_query($con,"INSERT INTO utilisateur (nom, prenom, mail, age,  mdp, id_metier, id_etablissement) VALUES (\"" . $nom . "\", \"" . $prenom . "\", \"" . $mail . "\", \"" . $age . "\", \"" . $password . "\", \"" . $id_metier . "\", \"" . $id_etablissement ."\")");
            $userData = mysqli_query($con,"SELECT * FROM utilisateur WHERE " . $cond_nom . " AND " . $cond_prenom . " AND " . $cond_mail . " AND ". $cond_loginMail . " AND " . $cond_password . " AND " . $cond_loginPassword);
            $response = array();
            while($row = mysqli_fetch_assoc($userData)){
                $response[] = $row;
            }
        } else {
            echo json_encode(null);
            exit;
        }
    }
} else {
    exit;
}
echo json_encode($response);
exit;