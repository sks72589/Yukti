<?php 
session_start(); 

if(!isset($_SESSION['user_email'])){
	
	echo "<script>window.open('login.php?not_admin=You are not an Admin!','_self')</script>";
}
else {

?>

<!DOCTYPE> 

<html>
	<head>
		<title>Admin Panel</title> 
		
	<link rel="stylesheet" href="styles/style.css" media="all" /> 
	</head>


<body> 

	<div class="main_wrapper">
	
	
		<div id="header">
			<h1 align="center"><a href="index.php">Welcome to Yukti Admin Pannel</a> </h1>
		</div>
		
		<div id="right">
		<h2 style="text-align:center;">Manage Content</h2>	

			<a href="index.php?addadmin_opt">Admin Options</a>	
			<a href="index.php?addpublic_opt">Public Options</a>
			<a href="index.php?viewpublic_opt">View Public Options</a>
			<a href="logout.php">Admin Logout</a>
		
		</div>
		
		<div id="left">
		<h2 style="color:red; text-align:center;"><?php echo @$_GET['logged_in']; ?></h2>
		<?php 
		
		if(isset($_GET['addadmin_opt'])){
		
		include("addadmin_opt.php"); 
		
		}


		if(isset($_GET['addpublic_opt'])){
		
		include("addpublic_opt.php"); 
		
		}
		if(isset($_GET['viewpublic_opt'])){
		
		include("viewpublic_opt.php"); 
		
		}

		if(isset($_GET['manage_admin'])){
		
		include("manage_admin.php"); 
		
		}


		

		
		?>
		</div>






	</div>


	</body>
	</html>

	<?php 
} 
?>