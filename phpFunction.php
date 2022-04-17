<?php
        echo "<!DOCTYPE html>";
        echo "<html>";
        echo "<head>";
        echo "<title>Victims Table</title>";
        echo "<link rel='stylesheet' href='css/style.css'>";
        echo "<link rel='stylesheet' href='css/button.css'>";
        echo "</head>";
        echo "<body>";
        echo "<div class ='grid'>";
        $conn = mysqli_connect("localhost", "root", "", "se_project");
        if(isset($_POST['Victims'])){
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
            
            
            echo "</div>";
            echo "</table>";
    }

    else if(isset($_POST['Customers'])){
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
        if ($conn-> connect_error) {
            die("Connection failed:". $conn-> connect_error);
        }
        $sql = "SELECT * from Customers";
        $result = $conn -> query($sql);
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
        $conn-> close();
        echo "</div>";
        echo "</table>";
    }
    else {
    echo" Error 404";
    }
    echo "<div class ='grid'>";
    echo "<a href='http://localhost/SE_Project/' class='button-18'>Return to main page</a>";
    echo "</div>";
    echo "</div>";
    echo "</body>";
    echo "</html>";
?>