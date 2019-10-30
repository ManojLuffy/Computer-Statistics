<?php
	header('Access-Control-Allow-Origin: *');
	$connection = mysqli_connect("localhost","root","","lablogs");
	
	if(isset($_GET["cname"]) && !empty($_GET["cname"]))
	{
	$cname = $_GET['cname'];
	$cloc = $_GET['cloc'];
	$cstatus = $_GET['cstatus'];
	$cuser = $_GET['cuser'];
	$cnotes = $_GET['cnotes'];
	$caltname = '';
	
	if ($stmt = mysqli_prepare($connection, "INSERT INTO computernames (computername, computer_location, alt_computername, notes, Status, user) VALUES (?, ?, ?, ?, ?, ?)")) {
    mysqli_stmt_bind_param($stmt, "ssssii", $cname, $cloc, $caltname, $cnotes, $cstatus, $cuser);
    mysqli_stmt_execute($stmt);
    echo "Data inserted";
   }
   else {
    die(mysqli_error($connection));
   }
	}
	else if(isset($_GET["username"]) && !empty($_GET["username"]))
	{
		
		$username = $_GET['username'];
		$password = $_GET['password'];
			$stmt = $connection->prepare("select * from login where username=? and password=?");
			$stmt->bind_param('ss',$username,$password);
			$stmt->execute();
			$stmt->store_result();
		 
		
		if ($stmt->num_rows)
		{
			echo "success";
			
		}
		else{
			echo "failed";
		
		}
	}
?>