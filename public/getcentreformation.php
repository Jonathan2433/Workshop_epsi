<?php
header('Access-Control-Allow-Origin: *');
include "config.php";

$centre_formation = mysqli_query($con,"SELECT * FROM etablissement");
while($row = mysqli_fetch_assoc($centre_formation)){
    $response[] = $row;
}
echo json_encode($response);
exit;