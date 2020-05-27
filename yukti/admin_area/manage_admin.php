<!-- Eshtablishing Connection  -->
<?php 
	include("includes/db.php");
?>


<!DOCTYPE html>
<html lang="en">
<head>
	<title>Manage Options</title>
	
</head>
<body bgcolor="#62fdbb30">
	<form action="" method="post" enctype="multipart/form-data"> 
		
		<table align="center" width="795" border="2" bgcolor="#3388ff">
			
			<tr align="center">
				<td colspan="7"><h2>Manage Options</h2></td>
			</tr>
			
			<tr>
				<td align="right"><b>User Type:</b></td>
				<td>
					<select name="type_name" required="required">
						<option>Public</option>
						<option>Admin</option>
						<option>Expert</option>
									
					</select>
			</tr>
			<tr>
				<td align="right"><b>Option Name:</b></td>
				<td><input type="text" name="option_name" size="60" required/></td>
			</tr>
			<tr>
				<td align="right"><b>Rights:</b></td>
				<td>
					<select name="rights" required="required">
						<option>Edit</option>
						<option>View</option>			
					</select>
				</td>
			</tr>
			
			<tr align="center">
				<td colspan="7"><input type="submit" name="insert_option" value="Add Option"/></td>
			</tr>
		</table>
	</form>
</body> 
</html>


<?php 
	
	include("includes/db.php"); 

	if(isset($_POST['insert_option']))
	{
		//getting the text data from the fields
		$type_name = $_POST['type_name'];
		$option_name = $_POST['option_name'];
		$rights = $_POST['rights'];

		echo "$type_name,$option_name,$rights <br>";

		$sel_option="select * from option_list where type_name='$type_name' AND option_name='$option_name' AND rights='$rights' ";

		$run_brand = mysqli_query($db_con, $sel_option) or die("Error: " . mysqli_error($db_con));

		$check_brand=mysqli_num_rows($run_brand);
		echo " testing check brand value and it is $check_brand";

		if ($check_brand==0) 
		{
			$insert_option = "insert into option_list (type_name,option_name,rights) 
		 							values ('$type_name','$option_name','$rights')";
		 	$add_option=mysqli_query($db_con, $insert_option)or die("Error: " . mysqli_error($db_con));
		 	echo "<script>alert('Brand has been Added Successfully!')</script>";
		}
		else
		{
			echo "<script>alert('Option already exists!')</script>";
		}
		$check_brand=0;
		// unset($check_brand);
		echo " check_brand is reset to $check_brand";

	}

?>