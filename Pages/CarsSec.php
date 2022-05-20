<!DOCTYPE html>
<html>
<head>
    <title>Cars Section</title>
	<link rel="stylesheet" href="../css/style.css">
	<link rel="stylesheet" href="../css/button.css">
	<?php include 'phpFunction.php';?>
</head>
<body>
	<div class="grid">
		<form method="POST" action="phpTable.php">
				<input type="submit" name="Car_Detail" value="Show Cars info" class="button-18"><br><br>
				<input type="submit" name="License_plate" value="Show License plates info" class="button-18"><br><br>
				<input type="submit" name="Fcars" value="Show Full cars license plates info" class="button-18">
		</form>
	</div>
	<div class="grid">
		<?php
			echo "<a href='http://localhost/SE_Project/' class='button-18 button-19'>Return to main page</a>";
			?>
	</div>
</body>
</html>