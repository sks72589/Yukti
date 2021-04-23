<!DOCTYPE html>
<?php 
session_start();
include("functions/functions.php");

global $city_name;
$city_name= "Citywise";
?>

<html lang="en">    
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge"> 
		<title>Yukti-Home</title>
		<link href="style/style.css" rel="stylesheet" type="text/css" />
		<link href="js/script.js" rel="stylesheet" type="text/javascript" />
		<link href="https://fonts.googleapis.com/css2?family=Playball&display=swap" rel="stylesheet">
	</head>
    <body>
    	<header id="header">
    		<p>Covid Information Forum</p>
    	</header>


		<!-- 3-vertical partition of page -->
		<section id="main-holder">
			<!-- Updtes Section -->
				<section id="partition1">
					<br>
				<!-- City Update -->
					<div class="precaution">
						<h2><?php echo "$city_name"; ?>  Update</h2>
							<!-- Side Bar Starts -->
				    		<div id="sidebar">					
								<ul id="cats">
								
								<?php getLocalnews();
								 ?>
								
								<ul>				
							</div>
		    				<!-- Side Bar Ends -->

					</div>
					<br>
				<!-- National Update -->
					<div class="live-update">					
						<h2> National Update</h2>
						<!-- Side Bar Starts -->
				    		<div id="sidebar">					
								<ul id="cats">
								
								<?php getNationalnews(); ?>
								
								<ul>				
							</div>
		    				<!-- Side Bar Ends -->
					</div>
				</section>
			
			<!-- News Feed -->
			<section id="partition2">
				<div class="location">

					<div class="location-icon">
						<img src="assets/pin.png">
						<p> Detect My Location<!-- <h6 style="vertical-align: middle;margin: auto;">(Coming Soon)</h6> --></p>
					</div>
					

					<div class="location-input">	
						<form action="" method="post" enctype="multipart/form-data" id="location_form"> 
											
							<input type="text" name="city_name" placeholder="    ENTER YOUR CITY NAME" required="required" />
							<input type="submit" name="insert_option" value="SUBMIT"/>
						</form>
					</div>
					<?php 


						if (isset($_POST['insert_option'])) 
						{
							$city_name = $_POST['city_name'];
						}

					?>
					
				</div>
				<br>
				<div class="news-feed">

					
				</div>
				
			</section>





			<!-- Options to users -->
			<section id="partition3">
				<!-- Side Bar Starts -->
	    		<div id="sidebar2">
				
					<div id="sidebar_title"><h3 align="center">Options</h3></div>					
					<ul id="poption"> 
					<!-- 	<li><a href='#'>
							<img src='admin_area/option_images/hospital.png' width='40' height='40'/><p>hospital</p>
							</a>
						</li>   --> 
	    				
					<?php getPublicMenu(); ?>					
					<ul>				
				</div>
	    		<!-- Side Bar Ends -->

			</section>
		</section>
		<!-- Footer -->
		<!--<footer id="footer">
			 <p>Copyright</p>			
		</footer> -->



    </body>
</html>