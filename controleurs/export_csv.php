<?php

$outputCsv = $_POST['outputCsv'];
header("Content-disposition: attachment; filename=export_csv.csv");
header("Content-Type: application/force-download");
header("Content-Transfer-Encoding: application/vnd.ms-excel\n");
header("Pragma: no-cache");
header("Cache-Control: must-revalidate, post-check=0, pre-check=0, public");
header("Expires: 0");

echo $outputCsv;
exit();




?>
