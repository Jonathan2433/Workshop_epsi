<?php
header('Access-Control-Allow-Origin: *');
include "config.php";

$quizz = mysqli_query($con,"SELECT * FROM (SELECT * FROM question ORDER BY RAND() LIMIT 10) as q ORDER BY q.id_question");
while($row = mysqli_fetch_assoc($quizz)){
    $response1[] = $row;
    $id_question[] = $row['id_question'];
}
// echo "SELECT * FROM reponse WHERE id_question in (" . implode(',', $id_question) . ")";
$choice = mysqli_query($con,"SELECT * FROM reponse WHERE id_question in (" . implode(',', $id_question) . ") ORDER BY id_question");
while($row = mysqli_fetch_assoc($choice)){
    $response2[] = $row;
    // echo json_encode($row);
}
echo json_encode([$response1,$response2], JSON_PRETTY_PRINT);
exit;