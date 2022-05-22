<?php
    include 'phpFunction.php';
    include 'new_fixture.php';
  
    echo "<!DOCTYPE html>";
    echo "<html>";
    echo "<head>";
    echo "<title>Your Selection</title>";
    echo "<link rel='stylesheet' href='../css/style.css'>";
    echo "<link rel='stylesheet' href='../css/button.css'>";
    echo "<link rel='stylesheet' href='../css/st.css'>";
    echo "<script class='u-script' type='text/javascript' src='../js/js.js' defer=''></script>";

    echo "</head>";
    echo "<body>";
    echo "<div class ='grid'>";
    

    /* Gang Member Section */
    if(isset($_POST['Gang_Member'])){
        $column_name = array("Gang Member ID", "Gang Member Name", "Job", "Leader Name");
        $sql = "SELECT gm.ID_GM as 'Gang Member ID', gm.GM_Name as 'Gang Member Name', gm.Job, l.GM_name as 'Leader Name' 
                from gang_member gm , gang_member L 
                WHERE gm.Leader = L.ID_GM";
        Show_Table_SP ($column_name,$sql,"Gang Member Info");
        echo "</div>";
        echo "</table>";
        echo "<a href='http://localhost/SE_Project/pages/GangMemberSec.php' class='button-18 button-19'>Return Back</a><br>";
    }
    else if(isset($_POST['F_Gang_Member_ww'])){
        $column_name = array("Member ID","Member Name","Leader Name","Sub Group Name","Armory ID","Weapon Name");
        $sql = "SELECT g1.ID_GM as 'Member ID',g1.GM_name as 'Member Name',g2.GM_name as 'Leader Name',sub_group.SG_Name as 'Sub Group Name',armory.ID_Item as 'Armory ID',weapon_detail.W_Name as 'Weapon Name'
                from gang_member g1,gang_member g2,gs,sub_group,armory,weapon_detail
                where g1.ID_GM=gs.ID_GM
                and g2.ID_GM= g1.Leader
                and sub_group.ID_SG=gs.ID_SG
                and armory.ID_Item=gs.ID_Item
                and weapon_detail.ID_WD=armory.ID_WD";
        Show_Table_SP ($column_name,$sql,"Gang Members with weapons");
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
    else if(isset($_POST['F_GangMember'])){
        Show_Table("Gang_Member");
        echo "</div>";
        echo "</table>";

        echo "
        <div class='table-wrapper f2-table'> 
        <form action = 'new_fixture.php' method='post'> 

                <label for='cells_0'></label>
                <input type='text' name='cells_0' id='cells_0' placeholder='Gang Member ID..'>
            
                <label for='cells_1'></label>
                <input type='text' name='cells_1' id='cells_1' placeholder='Gang Member Name..'>
                
                <label for='cells_2'></label>
                <select name='cells_2' id='cells_2'>
                  <option value='Sub_Leader'>Sub Leader</option>
                  <option value='Driver'>Driver</option>
                  <option value='Killer'>Killer</option>
                  <option value='Doctor'>Doctor</option>
                </select>

                <label for='cells_3'></label>
                <input type='text' name='cells_3' id='cells_3' placeholder='Leader Name..'>
                
                <input type='radio' name='GM_d' value='1'  /> 
                <label for='1'>Insert</label>

                <input type='radio' name='GM_d' value='2' checked/> 
                <label for='2'>Update</label>

                <input type='radio' name='GM_d' value='3' /> 
                <label for='3'>Delete</label>

                <input type='submit' value='Execute'>
            </form>
        </div>";

        echo "<a href='http://localhost/SE_Project/pages/GangMemberSec.php' class='button-18 button-19'>Return Back</a><br>";
    }

    /* Victims Section */
    else if(isset($_POST['victims'])){
        Show_Table("Victim");
        echo "</div>";
        echo "</table>";
        
        echo "
        <div class='table-wrapper f2-table'> 
        <form action = 'new_fixture.php' method='post'> 
                <label for='cells_0'></label>
                <input type='text' name='cells_0' id='cells_0' placeholder='Id Victim..'>

                <label for='cells_1'></label>
                <input type='text' name='cells_1' id='cells_1' placeholder='Age..'>
            
                <label for='cells_2'></label>
                <input type='text' name='cells_2' id='cells_2' placeholder='Blood Type..'>
                
                <label for='cells_3'></label>
                <input type='text' name='cells_3' id='cells_3' placeholder='Id_Sub_Graveyard..'>

                <label for='cells_4'></label>
                <input type='text' name='cells_4' id='cells_4' placeholder='Id_Doctor 1..'>

                <label for='cells_5'></label>
                <input type='text' name='cells_5' id='cells_5' placeholder='Id_Doctor 2..'>

                <label for='cells_6'></label>
                <input type='text' name='cells_6' id='cells_6' placeholder='Id_Territory..'>

                <input type='radio' name='Vi_d' value='1' checked /> 
                <label for='1'>Insert</label>

                <input type='radio' name='Vi_d' value='2' /> 
                <label for='2'>Delete</label>

                <input type='submit' value='Execute'>
            </form>
        </div>";

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
        Show_Table("FArmory");
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
    else if(isset($_POST['Territory'])){
        $column_name = array("ID Territory","Territory Name","Territory Type");
        $sql = "SELECT ID_Territory as 'ID Territory', Territory_Name as 'Territory Name', Territory_Type as 'Territory Type'
        FROM Territory";
        Show_Table_SP ($column_name,$sql,"Territories List");
        echo "</div>";
        echo "</table>";

        echo "
            <div class='table-wrapper f2-table'> 
            <form action = 'new_fixture.php' method='post'> 
    
                    <label for='cells_0'></label>
                    <input type='text' name='cells_0' id='cells_0' placeholder='ID Territory..'>
                
                    <label for='cells_1'></label>
                    <input type='text' name='cells_1' id='cells_1' placeholder='Territory Name..'>
                    
                    
                    <label for='cells_2'></label>
                    <select name='cells_2' id='cells_2'>
                      <option value='K'>K</option>
                      <option value='G'>G</option>
                    </select>

                    <input type='radio' name='Ter_d' value='1' checked /> 
                    <label for='1'>Insert</label>
    
                    <input type='radio' name='Ter_d' value='2' /> 
                    <label for='2'>Update</label>
    
                    <input type='radio' name='Ter_d' value='3' /> 
                    <label for='3'>Delete</label>
    
                    <input type='submit' value='Execute'>
                </form>
            </div>";

/*
                    <label for='cells_2'></label>
                    <input type='text' name='cells_2' id='cells_2' placeholder='Territory Type..'>
*/

            echo "<br><br><a href='http://localhost/SE_Project/pages/TerritorySec.php' class='button-18 button-19'>Return Back</a><br>";
    }
    else if(isset($_POST['kTerritory'])){
        $column_name = array("Territory ID","Territory Name","Number of Victim");
        $sql = "SELECT territory.ID_territory as 'Territory ID', territory.territory_name as 'Territory Name',count(vgs.ID_VGS) as 'Number of Victim' 
                From territory 
                left outer join victim on territory.id_territory=victim.id_territory 
                left outer join vgs on victim.id_victim=vgs.id_victim 
                where Territory_Type='K' 
        Group by territory.territory_name";
        Show_Table_SP ($column_name,$sql,"Territories For Killing");
        echo "</div>";
        echo "</table>";
        echo "<a href='http://localhost/SE_Project/pages/TerritorySec.php' class='button-18 button-19'>Return Back</a><br>";

    }
    else if(isset($_POST['gTerritory'])){
        $column_name = array("Territory ID","Territory Name","Number of graveyards");
        $sql = "SELECT g.ID_Territory as 'Territory ID',Territory_Name as 'Territory Name',count(ID_Sub_Graveyard) as 'Number of graveyards' 
                from graveyard g 
                left outer join territory t on g.ID_Territory=t.ID_Territory 
                left outer join sub_graveyard sg on sg.ID_Graveyard=g.ID_Graveyard 
                group by g.ID_Territory";
        Show_Table_SP ($column_name,$sql,"Burial Territories");
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