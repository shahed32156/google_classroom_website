<?php
    session_start();
    if(isset($_SESSION['uid'])){
        include_once "db.php";
        $groupName = mysqli_real_escape_string($db, $_POST['groupName']);
        if(!empty($groupName)){
            mysqli_query($db, "INSERT INTO groups(group_name, created_by) VALUES('{$groupName}', '{$_SESSION['uid']}')") or die();

            $groupId = mysqli_insert_id($db);

            mysqli_query($db, "INSERT INTO group_members(group_id, user_id) VALUES('{$groupId}', '{$_SESSION['uid']}')") or die();
            echo $groupId;
        }else{
            echo "fill_group_name";
        }
    }
?>