<?php 
// After uploading to online server, change this connection accordingly

 $db_con = mysqli_connect("localhost","admin","aDMIN","yukti");

if (mysqli_connect_error())
  {
  echo "Failed to connect to MySQL: " . mysqli_connect_error();
  }

?>