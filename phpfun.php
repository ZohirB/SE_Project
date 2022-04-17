<?php
    function Show_Victim(){
        echo "<table>";
        echo "<tr>";
        echo "<th>ID_Victim</th>";
        echo "<th>ID_GS</th>";
        echo "<th>Age</th>";
        echo "<th>Blood_Type</th>";
        echo "<th>ID_Territory</th>";
        echo "<th>Date_Of_Murder</th>";
        echo "</tr>";
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
    }$conn-> close();

    echo "</table>";
}
?>