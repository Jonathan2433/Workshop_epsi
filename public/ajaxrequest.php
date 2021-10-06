<?php
header('Access-Control-Allow-Origin: *');
include "config.php";

// Prenom
$cond_firstName = "1";
if(isset($_GET['firstName']) and $_GET['firstName'] != ""){
    $firstName = $_GET['firstName'];
    $cond_firstName = "firstName='".$firstName."'";
}

// Nom
$cond_lastName = "1";
if(isset($_GET['lastName']) and $_GET['lastName'] != ""){
    $lastName = $_GET['lastName'];
    $cond_lastName = "lastName='".$lastName."'";
}

// age
$cond_age = "1";
if(isset($_GET['age']) and $_GET['age'] != ""){
    $age = $_GET['age'];
    $cond_age = "age='".$age."'";
}

// Centre de formation
$cond_cForm = "1";
if(isset($_GET['cForm']) and $_GET['cForm'] != ""){
    $cForm = $_GET['cForm'];
    $cond_cForm = "cForm='".$cForm."'";
}

// Metier
$cond_formation = "1";
if(isset($_GET['formation']) and $_GET['formation'] != ""){
    $formation = $_GET['formation'];
    $cond_formation = "formation='".$formation."'";
}

// Email
$cond_email = "1";
if(isset($_GET['email']) and $_GET['email'] != ""){
    $email = $_GET['email'];
    $cond_email = "email='".$email."'";
}
$cond_loginEmail = "1";
if(isset($_GET['loginEmail']) and $_GET['loginEmail'] != ""){
    $loginEmail = $_GET['loginEmail'];
    $cond_loginEmail = "email='".$loginEmail."'";
}

// Password
$cond_password = "1";
if(isset($_GET['password']) and $_GET['password'] != ""){
    $password = hash("sha256", $_GET['password']);
    $cond_password = "password='".$password."'";
}
$cond_loginPassword = "1";
if(isset($_GET['loginPassword']) and $_GET['loginPassword'] != ""){
    $loginPassword = hash("sha256", $_GET['loginPassword']);
    $cond_loginPassword = "password='".$loginPassword."'";
}

if(isset($_GET['requestType'])){
    if(strtolower($_GET['requestType']) == "select"){
        $userData = mysqli_query($con,"SELECT * FROM users WHERE " . $cond_firstName . " AND " . $cond_lastName . " AND " . $cond_age . " AND " . $cond_cForm . " AND " . $cond_formation . " AND " . $cond_email . " AND ". $cond_loginEmail . " AND " . $cond_password . " AND " . $cond_loginPassword);
        // $response = "SELECT * FROM users WHERE " . $cond_firstName . " AND " . $cond_lastName . " AND " . $cond_email . " AND ". $cond_loginEmail . " AND " . $cond_password . " AND " . $cond_loginPassword;
        $response = array();
        while($row = mysqli_fetch_assoc($userData)){
            $response[] = $row;
        }
    }
    if(strtolower($_GET['requestType']) == "insert"){
        mysqli_query($con,"INSERT INTO users (id, firstName, lastName, email, age,  password) VALUES (null, \"" . $firstName . "\", \"" . $lastName . "\", \"" . $email . "\", \"" . $password . "\")");
        $userData = mysqli_query($con,"SELECT * FROM users WHERE " . $cond_firstName . " AND " . $cond_lastName . " AND " . $cond_email . " AND ". $cond_loginEmail . " AND " . $cond_password . " AND " . $cond_loginPassword);
        // $response = "SELECT * FROM users WHERE " . $cond_firstName . " AND " . $cond_lastName . " AND " . $cond_email . " AND ". $cond_loginEmail . " AND " . $cond_password . " AND " . $cond_loginPassword;
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