<?php
    include 'phpFunction.php';
    echo "<!DOCTYPE html>";
    echo "<html>";
    echo "<head>";
    echo "<title>Victims Table</title>";
    echo "<link rel='stylesheet' href='../css/style.css'>";
    echo "<link rel='stylesheet' href='../css/button.css'>";
    echo "</head>";
    echo "<body>";
    echo "<div class ='grid'>";


    /* Gang Member Section */
    if(isset($_POST['Gang_Member'])){
        $column_name = array("Gang Member ID", "Gang Member Name", "Job", "Leader Name");
        $sql = "SELECT gm.ID_GM as 'Gang Member ID', gm.GM_Name as 'Gang Member Name', gm.Job, l.GM_name as 'Leader Name' from gang_member gm , gang_member L WHERE gm.Leader = L.ID_GM";
        Show_Table_SP ($column_name,$sql);
        echo "</div>";
        echo "</table>";
        echo "<a href='http://localhost/SE_Project/pages/GangMemberSec.php' class='button-18 button-19'>Return Back</a><br>";
    }
    else if(isset($_POST['GS'])){
        Show_Table("GS");
        echo "</div>";
        echo "</table>";
        echo "<a href='http://localhost/SE_Project/pages/GangMemberSec.php' class='button-18 button-19'>Return Back</a><br>";
    }
    else if(isset($_POST['aGangMember'])){
        Show_Table("Gang_Member");
        echo "</div>";
        echo "</table>";
        echo "<a href='http://localhost/SE_Project/pages/GangMemberSec.php' class='button-18 button-19'>Return Back</a><br>";
    }

    /* Victims Section */
    else if(isset($_POST['victims'])){
        Show_Table("Victim");
        echo "</div>";
        echo "</table>";
        echo "<a href='http://localhost/SE_Project/pages/victimsSec.php' class='button-18 button-19'>Return Back</a><br>";
    }
    else if(isset($_POST['Part_Name'])){
        Show_Table("Part_Name");
        echo "</div>";
        echo "</table>";
        echo "<a href='http://localhost/SE_Project/pages/victimsSec.php' class='button-18 button-19'>Return Back</a><br>";
    }

    /* Graveyard Section */
    else if(isset($_POST['Graveyard'])){
        Show_Table("Graveyard");
        echo "</div>";
        echo "</table>";
        echo "<a href='http://localhost/SE_Project/pages/GraveyardSec.php' class='button-18 button-19'>Return Back</a><br>";
    }
    else if(isset($_POST['SubGraveyard'])){
        Show_Table("Sub_Graveyard");
        echo "</div>";
        echo "</table>";
        echo "<a href='http://localhost/SE_Project/pages/GraveyardSec.php' class='button-18 button-19'>Return Back</a><br>";
    }
    else if(isset($_POST['FGraveyard'])){
        Show_Table("FGraveyard");
        echo "</div>";
        echo "</table>";
        echo "<a href='http://localhost/SE_Project/pages/GraveyardSec.php' class='button-18 button-19'>Return Back</a><br>";
    }

    /* Customer and sales Section */
    else if(isset($_POST['Customer'])){
        Show_Table("Customer");
        echo "</div>";
        echo "</table>";
        echo "<a href='http://localhost/SE_Project/pages/SalesSec.php' class='button-18 button-19'>Return Back</a><br>";
    }
    else if(isset($_POST['Sales'])){
        Show_Table("sale");
        echo "</div>";
        echo "</table>";
        echo "<a href='http://localhost/SE_Project/pages/SalesSec.php' class='button-18 button-19'>Return Back</a><br>";
    }
    else if(isset($_POST['Fsales'])){
        Show_Table("sale");
        echo "</div>";
        echo "</table>";
        echo "<a href='http://localhost/SE_Project/pages/SalesSec.php' class='button-18 button-19'>Return Back</a><br>";
    }

    /* Armory Section */
    else if(isset($_POST['Armory'])){
        Show_Table("Armory");
        echo "</div>";
        echo "</table>";
        echo "<a href='http://localhost/SE_Project/pages/ArmorySec.php' class='button-18 button-19'>Return Back</a><br>";
    }
    else if(isset($_POST['FArmory'])){
        Show_Table("Armory");
        echo "</div>";
        echo "</table>";
        echo "<a href='http://localhost/SE_Project/pages/ArmorySec.php' class='button-18 button-19'>Return Back</a><br>";
    }
    else if(isset($_POST['Weapon_detail'])){
        Show_Table("Weapon_detail");
        echo "</div>";
        echo "</table>";
        echo "<a href='http://localhost/SE_Project/pages/ArmorySec.php' class='button-18 button-19'>Return Back</a><br>";
    }
    else if(isset($_POST['Shipments'])){
        Show_Table("shipment");
        echo "</div>";
        echo "</table>";
        echo "<a href='http://localhost/SE_Project/pages/ArmorySec.php' class='button-18 button-19'>Return Back</a><br>";
    }

    /* Car_Detail Section */
    else if(isset($_POST['Car_Detail'])){
        Show_Table("Car_Detail");
        echo "</div>";
        echo "</table>";
        echo "<a href='http://localhost/SE_Project/pages/carssec.php' class='button-18 button-19'>Return Back</a><br>";
    }
    else if(isset($_POST['License_plate'])){
        Show_Table("License_plate");
        echo "</div>";
        echo "</table>";
        echo "<a href='http://localhost/SE_Project/pages/carssec.php' class='button-18 button-19'>Return Back</a><br>";
    }
    else if(isset($_POST['Fcars'])){
        Show_Table("car_license");
        echo "</div>";
        echo "</table>";
        echo "<a href='http://localhost/SE_Project/pages/carssec.php' class='button-18 button-19'>Return Back</a><br>";
    }

    /* Territories Section */
    else if(isset($_POST['kTerritory'])){
        $column_name = array("Territory ID","Territory Name","Number of Victim");
        $sql = "Select territory.ID_territory as 'Territory ID', territory.territory_name as 'Territory Name',count(vgs.ID_VGS) as 'Number of Victim' From territory left outer join victim on territory.id_territory=victim.id_territory left outer join vgs on victim.id_victim=vgs.id_victim where Territory_Type='K' Group by territory.territory_name";
        Show_Table_SP ($column_name,$sql);
        echo "</div>";
        echo "</table>";
        echo "<a href='http://localhost/SE_Project/pages/TerritorySec.php' class='button-18 button-19'>Return Back</a><br>";

    }
    else if(isset($_POST['gTerritory'])){
        $column_name = array("Territory ID","Territory Name","number of graveyards");
        $sql = "";
        Show_Table_SP ($column_name,$sql);
        echo "</div>";
        echo "</table>";
        echo "<a href='http://localhost/SE_Project/pages/TerritorySec.php' class='button-18 button-19'>Return Back</a><br>";
    }
    else if(isset($_POST['Territory'])){
        Show_Table("Territory");
        echo "</div>";
        echo "</table>";
        echo "<a href='http://localhost/SE_Project/pages/TerritorySec.php' class='button-18 button-19'>Return Back</a><br>";

    }

    else {
        echo" Error 404";
    }
 
    echo "<a href='http://localhost/SE_Project/' class='button-18 button-20'>Return to main page</a>";
    echo "</div>";
    echo "</body>";
    echo "</html>";
?>