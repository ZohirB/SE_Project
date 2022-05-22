<?php

    $conn = mysqli_connect("localhost", "root", "", "se_project");
    if ($GLOBALS['conn']-> connect_error) {
        die("Connection failed:". $GLOBALS['conn']-> connect_error);
    }

    if (isset($_POST['Ter_d'])) {
        session_start();
        $dataFromPage1 = $_SESSION['Ter_d'] = $_POST['Ter_d'];
        $cells_0 =  $_REQUEST['cells_0'];
        $cells_1 =  $_REQUEST['cells_1'];
        $cells_2 =  $_REQUEST['cells_2'];

        if ($dataFromPage1 == 1){
            $sql = "INSERT INTO Territory (Territory_Name,Territory_Type) VALUES ('".$cells_1."','".$cells_2."');";
            $result = $GLOBALS['conn'] -> query($sql);
            $GLOBALS['conn']-> close();
            echo "New row affected (Inserted) At Territory table";
        }
        else if ($dataFromPage1 == 2){
            $sql = "UPDATE Territory SET Territory_Name = '".$cells_1."' , Territory_Type = '".$cells_2."' WHERE ID_Territory = '".$cells_0."' ";
            $result = $GLOBALS['conn'] -> query($sql);
            $GLOBALS['conn']-> close();
            echo "One row affected (Updated) At Territory table";
        }
        else if ($dataFromPage1 == 3){
            $sql = "DELETE FROM Territory WHERE ID_Territory = '".$cells_0."' ";
            $result = $GLOBALS['conn'] -> query($sql);
            $GLOBALS['conn']-> close();
            echo "One row affected (Deleted) At Territory table";
        }
    }
    else if (isset($_POST['GM_d'])) {
        session_start();
        $dataFromPage1 = $_SESSION['GM_d'] = $_POST['GM_d'];
        $cells_0 =  $_REQUEST['cells_0'];
        $cells_1 =  $_REQUEST['cells_1'];
        $cells_2 =  $_REQUEST['cells_2'];
        $cells_3 =  $_REQUEST['cells_3'];

        if ($dataFromPage1 == 1){
            $sql = "INSERT INTO Gang_Member (GM_name,Job,Leader) VALUES  ('".$cells_1."','".$cells_2."','".$cells_3."');";
            $result = $GLOBALS['conn'] -> query($sql);
            $GLOBALS['conn']-> close();
            echo "New row affected (Inserted) At Gang Member table";
        }
        else if ($dataFromPage1 == 2){
            $sql = "UPDATE Gang_Member SET GM_name = '".$cells_1."' , Job = '".$cells_2."' , Leader = '".$cells_3."' WHERE ID_GM = '".$cells_0."' ";
            $result = $GLOBALS['conn'] -> query($sql);
            $GLOBALS['conn']-> close();
            echo "One row affected (Updated) At Gang Member table";
        }
        else if ($dataFromPage1 == 3){
            $sql = "DELETE FROM Gang_Member WHERE ID_GM = '".$cells_0."' ";
            $result = $GLOBALS['conn'] -> query($sql);
            $GLOBALS['conn']-> close();
            echo "One row affected (Deleted) At Gang Member table";
        }  
    }

    else if (isset($_POST['Vi_d'])) {
        session_start();
        $dataFromPage1 = $_SESSION['Vi_d'] = $_POST['Vi_d'];
        $cells_0 =  $_REQUEST['cells_0'];
        $cells_1 =  $_REQUEST['cells_1'];
        $cells_2 =  $_REQUEST['cells_2'];
        $cells_3 =  $_REQUEST['cells_3'];
        $cells_4 =  $_REQUEST['cells_4'];
        $cells_5 =  $_REQUEST['cells_5'];
        $cells_6 =  $_REQUEST['cells_6'];

        if ($dataFromPage1 == 1){
            $sql = "INSERT INTO victim (Age,Blood_Type,Id_Sub_Graveyard,Id_Doctor_1,Id_Doctor_2,Id_Territory) VALUES ('".$cells_1."','".$cells_2."','".$cells_3."','".$cells_4."','".$cells_5."','".$cells_6."');";
            $result = $GLOBALS['conn'] -> query($sql);
            $GLOBALS['conn']-> close();
            echo "New row affected (Inserted) At Victim table";
        }
        else if ($dataFromPage1 == 2){
            $sql = "DELETE FROM Victim WHERE Id_victim = '".$cells_0."' ";
            $result = $GLOBALS['conn'] -> query($sql);
            $GLOBALS['conn']-> close();
            echo "One row affected (Deleted) At Victim table";
        }  
    }
?>