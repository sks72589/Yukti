<?php 
// After uploading to online server, change this connection accordingly
$db_con = mysqli_connect("localhost","root","","yukti");

if (mysqli_connect_errno())
  {
  echo "The Connection was not established: " . mysqli_connect_error();
  }

  
 // getting the user IP address
  function getIp() {
    $ip = $_SERVER['REMOTE_ADDR'];
 
    if (!empty($_SERVER['HTTP_CLIENT_IP'])) {
        $ip = $_SERVER['HTTP_CLIENT_IP'];
    } elseif (!empty($_SERVER['HTTP_X_FORWARDED_FOR'])) {
        $ip = $_SERVER['HTTP_X_FORWARDED_FOR'];
    }
 
    return $ip;
}

//getting the public menu

function getPublicMenu()
  {
    global $db_con; 
    global $option_id;
    
    $get_option = "select * from public_menu ";
    
    $run_option = mysqli_query($db_con, $get_option);
    
    while ($row_option=mysqli_fetch_array($run_option))
    {
    
      $option_id = $row_option['option_id']; 
      $option_name = $row_option['option_name'];
      echo "<li><a href='#'>$option_name</a></li>"; 
  }
// index.php?option=$option_id'

}