<!DOCTYPE html>
<html>
<head>
    <title>Territory Section</title>
	<link rel="stylesheet" href="../css/style.css">
	<link rel="stylesheet" href="../css/button.css">
	<?php include 'phpFunction.php';?>
</head>
<body>
	<div class="grid">
		<form method="POST" action="phpTable.php">
			<input type="submit" name="Territory" value="Show Full Territories info" class="button-18"><br><br>
			<input type="submit" name="kTerritory" value="Show Territories For Killing" class="button-18"><br><br>
			<input type="submit" name="gTerritory" value="Show Burial Territories" class="button-18"><br><br>
		</form>
	</div>
	<div class="grid">
		<?php
			echo "<a href='http://localhost/SE_Project/' class='button-18 button-19'>Return to main page</a>";
			?>
	</div>
</body>
</html>