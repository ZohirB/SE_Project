<?php
$conn = mysqli_connect("localhost", "root", "", "se_project");
    function Show_Victim() {
        echo "<h2>Victims List</h2>";
        echo "<div class='table-wrapper'>";
        echo "<table class='fl-table'>";
        echo "<thead>";
        echo "<tr>";
        echo "<th>ID Victim</th>";
        echo "<th>ID GS</th>";
        echo "<th>Age</th>";
        echo "<th>Blood Type</th>";
        echo "<th>ID Territory</th>";
        echo "<th>Date Of Murder</th>";
        echo "</tr>";
        echo "</thead>";

        // Check connection, if failed show error
        if ($GLOBALS['conn']-> connect_error) {
            die("Connection failed:". $GLOBALS['conn']-> connect_error);
        }
        $sql = "SELECT * from victim";
        $result = $GLOBALS['conn'] -> query($sql);
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
        $GLOBALS['conn']-> close();
  }

    function Show_Customers() {
        echo "<h2>Customers List</h2>";
        echo "<div class='table-wrapper'>";
        echo "<table class='fl-table'>";
        echo "<thead>";
        echo "<tr>";
        echo "<th>ID Customer</th>";
        echo "<th>Customer Name</th>";
        echo "<th>Age</th>";
        echo "<th>Blood Type</th>";
        echo "<th>Wanted Part</th>";
        echo "</tr>";
        echo "</thead>";

        // Check connection, if failed show error
        if ($GLOBALS['conn']-> connect_error) {
            die("Connection failed:". $GLOBALS['conn']-> connect_error);
        }
        $sql = "SELECT * from Customers";
        $result = $GLOBALS['conn'] -> query($sql);
        if ($result -> num_rows > 0){
        // Output data for each row
            while ($row = $result -> fetch_assoc()){
                echo "<tr>
                <td>". $row["ID_Customer"]. "</td>
                <td>". $row["Customer_Name"]. "</td>
                <td>". $row["Age"]. "</td>
                <td>". $row["Blood_Type"]. "</td>
                <td>". $row["Wanted_Part"]. "</td>
                </tr>";
            }
            echo "</table>";
        }
        else {
            echo "No Vivtim Found";
        }
        $GLOBALS['conn']-> close();
    }
?>