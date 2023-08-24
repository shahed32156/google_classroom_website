<?php
    session_start();
    if(isset($_SESSION['uid'])){
        include_once "db.php";
        $groupId = mysqli_real_escape_string($db, $_POST['groupId']);
        $userId = mysqli_real_escape_string($db, $_POST['userId']);
        mysqli_query($db, "INSERT INTO group_members(group_id, user_id) VALUES('{$groupId}', '{$userId}')") or die();

        echo "success";
    }
?>