<!DOCTYPE html>
<html>
<head>
    <title>Gang Member Section</title>
	<link rel="stylesheet" href="../css/style.css">
	<link rel="stylesheet" href="../css/button.css">
	<?php include 'phpFunction.php';?>
</head>
<body>
	<div class="grid">
		<form method="POST" action="phpTable.php">
				<input type="submit" name="Gang_Member" value="Show Gang Member Info" class="button-18"><br><br>
				<input type="submit" name="F_GangMember" value="Show Full Gang Members Info" class="button-18"><br><br>
				<input type="submit" name="GS" value="Show Gang Member Sub Group Names" class="button-18"><br><br>
				<input type="submit" name="F_Gang_Member_ww" value="Show Gang Members with weapons" class="button-18"><br><br>
		</form>
	</div>
	<div class="grid">
		<?php
			echo "<a href='http://localhost/SE_Project/' class='button-18 button-19'>Return to main page</a>";
			?>
	</div>
</body>
</html>