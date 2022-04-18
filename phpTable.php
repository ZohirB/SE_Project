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
    if(isset($_POST['Victims'])){
        Show_Victim();
        echo "</div>";
        echo "</table>";
    }
    else if(isset($_POST['Customers'])){
        Show_Customers();
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