<?php
$conn = mysqli_connect("localhost", "root", "", "se_project");
    function Show_Table($Table_Name) {
        echo "<h2>".$Table_Name." List</h2>";
        echo "<div class='table-wrapper'>";
        echo "<table class='fl-table'>";
        echo "<thead>";
        echo "<tr>";
        $sql = "SHOW COLUMNS FROM ".$Table_Name;
        $result = mysqli_query($GLOBALS['conn'],$sql);
        $column_name = array();
        $i = 0;
        while($row = mysqli_fetch_array($result)){
            $column_name[] = $row['Field'];
            echo "<th>". $column_name[$i] ."</th>";
            $i++;
        }
        echo "</tr>";
        echo "</thead>";

        // Check connection, if failed show error
        if ($GLOBALS['conn']-> connect_error) {
            die("Connection failed:". $GLOBALS['conn']-> connect_error);
        }
        $sql = "SELECT * from ".$Table_Name;
        $result = $GLOBALS['conn'] -> query($sql);
        if ($result -> num_rows > 0){
            // Output data for each row
            while ($row = $result -> fetch_assoc()){
                echo "<tr>";
                foreach ($column_name as $element) {
                    echo "<td>". $row[$element]. "</td>";
                }
                echo "</tr>";
            }
            echo "</table>";
        }
        else {
            echo "No ".$Table_Name." Found";
        }
        $GLOBALS['conn']-> close();
  }
?>