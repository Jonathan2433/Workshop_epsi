<?php
header('Access-Control-Allow-Origin: *');
include "config.php";

$id_centre_formation = $_GET["id_centre_formation"];

$formation = mysqli_query($con,"SELECT metier.id_metier,metier.libelle 
                                FROM metier 
                                INNER JOIN etab_met ON metier.id_metier = etab_met.id_metier
                                INNER JOIN etablissement ON etab_met.id_etablissement = etablissement.id_etablissement
                                WHERE etablissement.id_etablissement = " . $id_centre_formation );
while($row = mysqli_fetch_assoc($formation)){
    $response[] = $row;
}
echo json_encode($response);
exit;