<?php include("includes/db.php");?>

	
<body bgcolor="skyblue">
	<form action="" method="post" enctype="multipart/form-data"> 
		<table align="center" width="795" border="2" bgcolor="#187eae">
			<tr align="center">
				<td colspan="7"><h2>Insert New Option for admin</h2></td>
			</tr>
			
			<tr>
				<td align="right"><b>Option Title:</b></td>
				<td><input type="text" name="option_title" size="60" required/></td>
			</tr>

			<tr>
				<td align="right"><b>Option Description:</b></td>
				<td><input type="text" name="option_desc" size="60" required/></td>
			</tr>

			<tr>
				<td align="right"><b>Rights:</b></td>
				<td>
					<select name="option_right" required="required">
						<option>Edit</option>
						<option>View</option>			
					</select>
				</td>
			</tr>
			
			<tr align="center">
				<td colspan="7"><input type="submit" name="addadmin_opt" value="Insert option Now"/></td>
			</tr>
		
		</table>
	
	
	</form>


<?php 
	// adding admin navigation bar option in database.

	if(isset($_POST['addadmin_opt'])){
	
		//getting the text data from the fields
		$option_title = $_POST['option_title'];	
		//getting the image from the field
		$option_desc = $_POST['option_desc'];
		$option_right = $_POST['option_right'];
		
		
	
	
		 $insert_option = "insert into admin_menu (option_title,option_desc,option_right) 
		 values ('$option_title','$option_desc','$option_right')";
		 
		 $insert_pro = mysqli_query($db_con, $insert_option);
		 
		 if($insert_pro){
		 	echo "$option_title has been succsessfully added.";		 
			echo "<script>alert('option Has been inserted!')</script>";
			echo "<script>window.open('index.php?addadmin_opt','_self')</script>";
		 }
		 else{
		 	echo "Insert Option Failed"; 
		 	echo "<script>alert('Process Failed!')</script>";
			}
	}
?>

	
<br><hr><br>
<table width="795" align="center" bgcolor="pink"> 

	
	<tr align="center">
		<td colspan="6"><h2>View All Admin Options Here</h2></td>
	</tr>
	
	<tr align="center" bgcolor="skyblue">
		<th>ID</th>
		<th>Option Title</th>
		<th>Option Description</th>
		<th>Access</th>
		<th>Edit</th>
		<th>Delete</th>
	</tr>
	<?php 
	include("includes/db.php");
	
	$get_option = "select * from admin_menu";
	
	$run_option = mysqli_query($db_con, $get_option); 
	
	$i = 0;
	
	while ($row_option=mysqli_fetch_array($run_option)){
		
		$option_id = $row_option['option_id'];
		$option_title = $row_option['option_title'];
		$option_desc = $row_option['option_desc'];
		$option_right = $row_option['option_right'];
		$i++;
	
	?>
	<tr align="center">
		<td><?php echo $i;?></td>
		<td align="left"><?php echo $option_title;?></td>
		<td align="left"><?php echo $option_desc;?></td>
		<td align="center"><?php echo $option_right;?></td>		
		<td><a href="index.php?edit_option=<?php echo $option_id; ?>">Edit</a></td>
		<td><a href="delete_option.php?delete_option=<?php echo $option_id;?>">Delete</a></td>
	
	</tr>
	<?php } ?>




</table>





</body> 
</html>







