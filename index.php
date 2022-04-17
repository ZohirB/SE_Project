<!DOCTYPE html>
<html>
<head>
    <title>Books</title>
    <link rel="stylesheet" type="text/css" href="bookstyle.css">
</head>
<body>
<button>View Table</button>
<button>View by Title</button>
<button>View by Author</button>

<table>
    <tr>
        <th>Id</th>
        <th>Title</th>
        <th>Author</th>
        <th>Price</th>
    </tr>
<?php
$conn = mysqli_connect("localhost", "root", "", "se_project");

// Check connection, if failed show error
if ($conn-> connect_error) {
    die("Connection failed:". $conn-> connect_error);
}
$sql = "SELECT id, title, author, price from books";
$result = $conn -> query($sql);

if ($result -> num_rows > 0){
// Output data for each row
    while ($row = $result -> fetch_assoc()){
        echo "<tr><td>". $row["id"]. "</td><td>". $row["title"]. "</td><td>". $row["author"]. "</td><td>". $row["price"]. "</td></tr>";
    }
echo "</table>";
}
else {
    echo "0 results";
}$conn-> close();
?>

</table>
</body>
</html>