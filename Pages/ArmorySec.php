<!DOCTYPE html>
<html>
<head>
    <title>Armory Section</title>
	<link rel="stylesheet" href="../css/style.css">
	<link rel="stylesheet" href="../css/button.css">
	<?php include 'phpFunction.php';?>
</head>
<body>
	<div class="grid">
		<form method="POST" action="phpTable.php">
				<input type="submit" name="Armory" value="Show Armory info" class="button-18"><br><br>
				<input type="submit" name="Weapon_detail" value="Show Weapon detail" class="button-18"><br><br>
				<input type="submit" name="Shipments" value="Show Shipments info" class="button-18"><br><br>
		</form>
	</div>
	<div class="grid">
		<?php
			echo "<a href='http://localhost/SE_Project/' class='button-18 button-19'>Return to main page</a>";
			?>
	</div>

</body>
</html>