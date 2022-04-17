<!DOCTYPE html>
<html>
<head>
    <title>SE_Project</title>
	<link rel="stylesheet" href="css/style.css">
</head>
<body>
<h2>Victim Table</h2>
<div class="table-wrapper">
    <table class="fl-table">
        <thead>
			<tr>
				<th>ID Victim</th>
				<th>ID GS</th>
				<th>Age</th>
				<th>Blood Type</th>
				<th>ID Territory</th>
				<th>Date Of Murder</th>
			</tr>
        </thead>

<?php
$conn = mysqli_connect("localhost", "root", "", "se_project");
// Check connection, if failed show error
if ($conn-> connect_error) {
    die("Connection failed:". $conn-> connect_error);
}
$sql = "SELECT * from victim";
$result = $conn -> query($sql);

if ($result -> num_rows > 0){
// Output data for each row
    while ($row = $result -> fetch_assoc()){
        echo "<tr>
		<td>". $row["ID_Victim"]. "</td>
		<td>". $row["ID_GS"]. "</td>
		<td>". $row["Age"]. "</td>
		<td>". $row["Blood_Type"]. "</td>
		<td>". $row["ID_Territory"]. "</td>
		<td>". $row["Date_Of_Murder"]. "</td>
		</tr>";
    }
	echo "</table>";
}
else {
    echo "No Vivtim Found";
}
$conn-> close();
?>

</div>
</table>
</body>
</html>