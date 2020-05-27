<?php include("includes/db.php");?>

	
<body bgcolor="skyblue">
	<form action="" method="post" enctype="multipart/form-data"> 
		<table align="center" width="795" border="2" bgcolor="#187eae">
			<tr align="center">
				<td colspan="7"><h2>Insert New Option for Public</h2></td>
			</tr>
			
			<tr>
				<td align="right"><b>Option Title:</b></td>
				<td><input type="text" name="option_title" size="60" required/></td>
			</tr>
			
			<tr>
				<td align="right"><b>Option Image:</b></td>
				<td><input type="file" name="option_image" /></td>
			</tr>
			
			<tr align="center">
				<td colspan="7"><input type="submit" name="addpublic_opt" value="Insert option Now"/></td>
			</tr>
		
		</table>
	
	
	</form>

	
<br><hr><br>
<table width="795" align="center" bgcolor="pink"> 

	
	<tr align="center">
		<td colspan="6"><h2>View All optionegories Here</h2></td>
	</tr>
	
	<tr align="center" bgcolor="skyblue">
		<th>Option ID</th>
		<th>Option Title</th>
		<th>Option Icon</th>
		<th>Edit</th>
		<th>Delete</th>
	</tr>
	<?php 
	include("includes/db.php");
	
	$get_option = "select * from public_menu";
	
	$run_option = mysqli_query($db_con, $get_option); 
	
	$i = 0;
	
	while ($row_option=mysqli_fetch_array($run_option)){
		
		$option_id = $row_option['option_id'];
		$option_title = $row_option['option_title'];
		$option_icon = $row_option['option_icon'];
		$i++;
	
	?>
	<tr align="center">
		<td><?php echo $i;?></td>
		<td align="left"><?php echo $option_title;?></td>
		<td><img src="option_images/<?php echo $option_icon;?>" width="60" height="60"/></td>
		<td><a href="index.php?edit_option=<?php echo $option_id; ?>">Edit</a></td>
		<td><a href="delete_option.php?delete_option=<?php echo $option_id;?>">Delete</a></td>
	
	</tr>
	<?php } ?>




</table>





</body> 
</html>



<?php 

	if(isset($_POST['insert_post'])){
	
		//getting the text data from the fields
		$option_title = $_POST['option_title'];	
		//getting the image from the field
		$option_image = $_FILES['option_image']['name'];
		$option_image_tmp = $_FILES['option_image']['tmp_name'];
		
		move_uploaded_file($option_image_tmp,"option_images/$option_image");
	
		 $insert_option = "insert into public_menu (option_title,option_icon) 
		 values ('$option_title','$option_image')";
		 
		 $insert_pro = mysqli_query($db_con, $insert_option);
		 
		 if($insert_pro){
		 	echo "$option_title has been succsessfully added.";		 
			echo "<script>alert('option Has been inserted!')</script>";
			echo "<script>window.open('index.php?addpublic_opt','_self')</script>";
		 }
		 else{echo "Insert Option Failed";}
	}
?>




