<?php
    $conn = mysqli_connect("localhost", "root", "", "se_project");
    function Show_Table_SP ($column_name,$sql_Select,$tn){
        echo "<h2> $tn </h2>";
        echo "<div class='table-wrapper'>";
        /*
        foreach ($column_name as $value) {
            echo "$value:<input type='text' name='.$value.' id='.$value.'><br><br>";
        }
        */
        echo "<table class='fl-table' id='table'>";
        echo "<thead>";
        echo "<tr>";
        $i = 0;
        while($i < sizeof($column_name)){
            echo "<th>". rem_($column_name[$i]) ."</th>";
            $i++;
        }
        echo "</tr>";
        echo "</thead>";

        // Check connection, if failed show error
        if ($GLOBALS['conn']-> connect_error) {
            die("Connection failed:". $GLOBALS['conn']-> connect_error);
        }

        $sql = $sql_Select;
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
            echo "Not Found";
        }
        $GLOBALS['conn']-> close();
    }

    function Show_Table($Table_Name) {
        echo "<h2>".rem_($Table_Name)."s List</h2>";
        echo "<div class='table-wrapper'>";
        echo "<table class='fl-table'>";
        echo "<thead>";
        echo "<tr>";
        $sql = "SHOW COLUMNS FROM ".$Table_Name; // لنجيب أسماء الأعمدة
        $result = mysqli_query($GLOBALS['conn'],$sql);
        $column_name = array();
        $i = 0;
        while($row = mysqli_fetch_array($result)){
            $column_name[] = $row['Field'];
            echo "<th>". rem_($column_name[$i]) ."</th>";
            $i++;
        }
        echo "</tr>";
        echo "</thead>";

        // Check connection, if failed show error
        if ($GLOBALS['conn']-> connect_error) {
            die("Connection failed:". $GLOBALS['conn']-> connect_error);
        }
        //$sql = "SELECT * from ".$Table_Name." ORDER BY ID_".$Table_Name;
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
  function rem_($str){
      $f_Str ="";
      for ($i=0 ; $i < strlen($str) ; $i++){
          if ($str[$i] != '_'){
                $f_Str .= $str[$i];
          }
          else{
            $f_Str .= ' ';
          }
      }
      return $f_Str;
  }
?>