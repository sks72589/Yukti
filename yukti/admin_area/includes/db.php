<?php 
// After uploading to online server, change this connection accordingly

$con = mysqli_connect("localhost","root","","ecommerc3_all");

if (mysqli_connect_errno())
  {
  echo "Failed to connect to MySQL: " . mysqli_connect_error();
  }

 $db_con = mysqli_connect("localhost","root","","yukti");

if (mysqli_connect_errno())
  {
  echo "Failed to connect to MySQL: " . mysqli_connect_error();
  }

?>