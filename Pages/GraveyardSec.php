<!DOCTYPE html>
<html>
<head>
    <title>Graveyard Section</title>
	<link rel="stylesheet" href="../css/style.css">
	<link rel="stylesheet" href="../css/button.css">
	<?php include 'phpFunction.php';?>
</head>
<body>
	<div class="grid">
		<form method="POST" action="phpTable.php">
				<input type="submit" name="Graveyard" value="Show Graveyard info" class="button-18"><br><br>
				<input type="submit" name="SubGraveyard" value="Show Sub Graveyard info" class="button-18"><br><br>
				<input type="submit" name="FGraveyard" value="Show Full Grave-Graveyard info" class="button-18"><br><br>
		</form>
	</div>
	<div class="grid">
		<?php
			echo "<a href='http://localhost/SE_Project/' class='button-18 button-19'>Return to main page</a>";
		?>
	</div>
</body>
</html>