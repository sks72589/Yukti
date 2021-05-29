<!DOCTYPE html>
<?php 
session_start();
include("functions/functions.php");

global $city_name;
$city_name= "City";
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
			<!-- Options to users -->
				<section id="partition1">
				<div id="sidebar2" class="options1">
					<div id="sidebar_title">
						<h3 align="center">Options</h3></div>					
						<ul id="poption"> 
							<!-- <li><a href='#'>
									<img src='admin_area/option_images/hospital.png' width='40' height='40'/><p>hospital</p>
									</a>
								</li>    -->
								
							<?php getPublicMenu(); ?>					
								<ul>				
							</div>
					</div>
				</section>
			
			<!-- Dyanamic Content Area -->
			<section id="partition2">
				<div class="location">
					<!-- <div class="location-icon">
						<img src="assets/pin.png">
					<p> Detect My Location<h6 style="vertical-align: middle;margin: auto;">(Coming Soon)</h6></p>
					</div>
					-->
					<div class="location-input">	
						<form action="" method="get" enctype="multipart/form-data" id="location_form"> 
											
						<input type="text" name="city_name" placeholder="Enter your city name" required="required" />
							<input type="submit" name="insert_option" value="SUBMIT"/>
						</form>
					</div>
					<?php 
					if (isset($_GET['insert_option'])) 
						{
							$city_name = $_GET['city_name'];

						}

					?>
					
				</div>

				<div class="news-feed">
					<h2>What are the new symptoms</h2>
					<ul>
						
					<li>fever</li>
					<li>dry cough</li>
					<li>tiredness</li>
					<li>Less common symptoms:</li>
					<li>aches and pains</li>
					<li>sore throat</li>
					<li>diarrhoea</li>
					<li>conjunctivitis</li>
					<li>headache</li>
					<li>loss of taste or smell</li>
					<li>a rash on skin, or discolouration of fingers or toes</li>
					<li>Serious symptoms:</li>
					<li>difficulty breathing or shortness of breath</li>
					<li>chest pain or pressure</li>
					<li>loss of speech or movement</li>
					</ul>

				<h2>How to Fight</h2>
				<h3>DO’s</h3>
				<ul>
					<li>Do wear a cloth covering on your face at all times when you are not at home.</li>
					
					<li>Do wash your hands before you wear your mask. Only touch the earloops</li>

					<li>Do stay informed of the situation as events and advisories are rapidly evolving.</li> 

					<li>Do practice good hand hygiene and wash your hands frequently.</li>

					<li>Do cover your cough or sneeze. The best way to cough or sneeze is into your elbow and not your hands</li>

					<li>Do work from home. Do leave your home only for essential reasons, such as buying food or medications.</li>

					<li>Do cancel elective dental, medical, recreational and non-essential appointments as these can interfere with social distancing.</li>

					<li>Do move away from others who cough or sneeze.</li>

					<li>Do wipe down all surfaces you come into contact with.</li>

					<li>Do begin buying a 60-90 day supply of supplies and drugs.</li>
				</ul>
				<hr>


				<h3>Don'ts</h3>
				<ul>
					<li>Don’t travel within the United States or abroad.</li>

					<li>Don’t touch your eyes, nose, mouth or face without washing your hands.</li>

					<li>Don’t put your shoes on surfaces you may touch. </li> 

					<li>Don’t interact with your pets if you think you may have symptoms concerning for COVID-19.</li>

					<li>Don’t treat “social distancing” like a “vacation”.</li>

					<li>Don’t plan “play dates” for your kids if they are not in school. </li>

					<li>Don’t share utensils or drinking glasses with others, including family members.</li>

					<li>Don’t shake hands or give hugs as greetings. </li>
				
					<li>Don’t visit your older relatives or community members, as they are the highest risk group.</li>

					<li>Don’t go to public places like gyms, theaters, restaurants.</li>
				</ul>



				</div>
			</section>
			<!-- Updtes Section -->

			<section id="partition3">
				<!-- City Update -->
				<div class="city-update">
						<h2><?php echo "$city_name"; ?>  Update</h2>
				<!-- Side Bar Starts -->
				    		<div id="sidebar">					
								<ul id="cats">
				
								<?php 
								if(isset($_GET['insert_option'])){
		
									fetchCitynews(); 
									
									}
								else {

								getLocalnews();
								}
								 ?>
	    				
					<ul>				
				</div>
	    		<!-- Side Bar Ends -->

					</div>
				<!-- National Update -->
					<div class="national-update">					
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
		</section>



    </body>
</html>