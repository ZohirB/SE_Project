<!DOCTYPE html>
<html>
<head>
    <title>SE_Project</title>
	<link rel="stylesheet" href="css/style.css">
	<link rel="stylesheet" href="css/button.css">
	<?php include 'phpFunction.php';?>
</head>
<body>
	<div class="grid">
		<form method="POST" action="phpTable.php">
			<input type="submit" name="Gang_Member" value="Show Gang Member" class="button-18">
			<input type="submit" name="Victims" value="Show Victims" class="button-18">
			<input type="submit" name="Part_Name" value="Show Parts" class="button-18">
			<input type="submit" name="Dealer" value="Show Dealers" class="button-18">
			<input type="submit" name="sale" value="Show Sales" class="button-18">
			<input type="submit" name="Territory" value="Show Territories" class="button-18">
			<input type="submit" name="Customer" value="Show Customers" class="button-18">
		</form>
	</div>
</body>
</html>


