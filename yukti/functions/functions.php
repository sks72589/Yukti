<?php 
// After uploading to online server, change this connection accordingly
$db_con = mysqli_connect("localhost","admin","aDMIN","yukti");

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
      $option_title = $row_option['option_title'];
      $option_icon = $row_option['option_icon'];
      echo "<li><a href='#'><img src='admin_area/option_images/$option_icon' width='40' height='40'/><p>$option_title</p></a></li>  "; 
  }
// index.php?option=$option_id'

}

function getCityupdate(){
	// global $db_con;
	echo "<script>alert('$city_name Has been inserted!')</script>";

}





//getting the Local News

function getLocalnews(){
	
	global $db_con; 
	
	$get_news = "select * from local_news";
	
	$run_news = mysqli_query($db_con, $get_news);
	
	while ($row_news=mysqli_fetch_array($run_news)){
	
		$news_id = $row_news['news_id']; 
		$news_title = $row_news['update_title'];
		$city_name = $row_news['city_name'];
		$update2_by = $row_news['update_by'];

	// echo "<li><p style='text-align=center; color=black; font-weight: bold;'>Update From $city_name</p></li>";
	echo "<li><a href='#'><p align='left'style='color=red;'> &#8226; $news_title<br>Source: $update2_by</p></a></li>";
	// echo "<li ><a href='#'style='color=black; text-decoration=none;'>$news_title</a></li>";
	
	// index.php?brand=$brand_id
	}
}

function getNationalnews(){
	
	global $db_con; 
	
	$get_update = "select * from national_update";
	
	$run_update = mysqli_query($db_con, $get_update);
	
	while ($row_update=mysqli_fetch_array($run_update)){
	
		$update_id = $row_update['update_id']; 
		$update_by = $row_update['update_by'];
		$news = $row_update['news'];

	// echo "<li><p style='text-align=center; color=black; font-weight: bold;'>Update From $city_name</p></li>";
	echo "<li><a href='#'><p align='left'style='color=red;'> &#8226; $news<br>Source: $update_by</p></a></li>";
	// echo "<li ><a href='#'style='color=black; text-decoration=none;'>$news_title</a></li>";
	
	// index.php?brand=$brand_id
	}
}






?>