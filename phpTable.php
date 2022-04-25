<?php
    include 'phpFunction.php';
    echo "<!DOCTYPE html>";
    echo "<html>";
    echo "<head>";
    echo "<title>Victims Table</title>";
    echo "<link rel='stylesheet' href='css/style.css'>";
    echo "<link rel='stylesheet' href='css/button.css'>";
    echo "</head>";
    echo "<body>";
    echo "<div class ='grid'>";
    if(isset($_POST['Gang_Member'])){
        Show_Table("Gang_Member");
        echo "</div>";
        echo "</table>";
    }
    else if(isset($_POST['Victims'])){
        Show_Table("Victim");
        echo "</div>";
        echo "</table>";
    }
    else if(isset($_POST['Part_Name'])){
        Show_Table("Part_Name");
        echo "</div>";
        echo "</table>";
    }
    else if(isset($_POST['Dealer'])){
        Show_Table("Dealer");
        echo "</div>";
        echo "</table>";
    }
    else if(isset($_POST['Customer'])){
        Show_Table("Customer");
        echo "</div>";
        echo "</table>";
    }
    else if(isset($_POST['Territory'])){
        Show_Table("Territory");
        echo "</div>";
        echo "</table>";
    }
    else if(isset($_POST['sale'])){
        Show_Table("sale");
        echo "</div>";
        echo "</table>";
    }
    else {
        echo" Error 404";
    }
    echo "<a href='http://localhost/SE_Project/' class='button-18'>Return to main page</a>";
    echo "</div>";
    echo "</body>";
    echo "</html>";
?>