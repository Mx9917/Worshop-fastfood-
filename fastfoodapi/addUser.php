<?php
	include 'connected.php';
	header("Access-Control-Allow-Origin: *");
if (!$link) {
    echo "Error: Unable to connect to MySQL." . PHP_EOL;
    echo "Debugging errno: " . mysqli_connect_errno() . PHP_EOL;
    echo "Debugging error: " . mysqli_connect_error() . PHP_EOL;
    
    exit;
}

if (!$link->set_charset("utf8")) {
    printf("Error loading character set utf8: %s\n", $link->error);
    exit();
	}

if (isset($_GET)) {
	if ($_GET['isAdd'] == 'true') {
				
		$name = $_GET['name'];
		$phone = $_GET['phone'];
		$pass = $_GET['pass'];
		$chooseType = $_GET['chooseType'];

		

	
			
		$sql = "INSERT INTO `users`(`id`,`name`,`phone`,`pass`,`chooseType`) VALUES (Null, '$name', '$phone','$pass','$chooseType')";	
							
		//$sql = "INSERT INTO `users`(`id`,`name`,`phone`,`pass`,`choosetype`) VALUES ('$name','$phone','$pass','$chooseType')";

		$result = mysqli_query($link, $sql);

		if ($result) {
			echo "true";
		} else {
			echo "false";
		}

	} else echo "Welcome API by ehdev";
   
}
	mysqli_close($link);
?>