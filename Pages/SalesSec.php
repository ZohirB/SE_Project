<!DOCTYPE html>
<html>
<head>
    <title>Sales Section</title>
	<link rel="stylesheet" href="../css/style.css">
	<link rel="stylesheet" href="../css/button.css">
	<?php include 'phpFunction.php';?>
</head>
<body>
	<div class="grid">
		<form method="POST" action="phpTable.php">
				<input type="submit" name="Sales" value="Show all Sales" class="button-18"><br><br>
				<input type="submit" name="Customer" value="Show Customer List" class="button-18"><br><br>
				<input type="submit" name="Fsales" value="Show Full Sales info" class="button-18">
		</form>
	</div>
	<div class="grid">
		<?php
			echo "<a href='http://localhost/SE_Project/' class='button-18 button-19'>Return to main page</a>";
			?>
	</div>
</body>
</html>