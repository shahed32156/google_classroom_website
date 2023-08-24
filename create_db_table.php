<?php
    $db = mysqli_connect("localhost","root","");
    $create_db = "CREATE DATABASE IF NOT EXISTS chat";
    mysqli_query($db,$create_db);

    $db = mysqli_connect("localhost","root","","chat");
    $sql = "CREATE TABLE IF NOT EXISTS messages (msg_id int(100) AUTO_INCREMENT, incoming_id int(100), outgoing_id int(100), message varchar(10000), time varchar(100), type varchar(100),notify varchar(10),seen varchar(10), emoji varchar(10), PRIMARY KEY(msg_id));

    CREATE TABLE IF NOT EXISTS users (uid int(100) AUTO_INCREMENT, fname varchar(100), lname varchar(100), email varchar(100), password varchar(100), img varchar(1000),status varchar(100), PRIMARY KEY(uid));

    INSERT INTO users(uid,fname,lname,email,password,img,status) VALUES(1,'Sidul','Moon','sidul@gmail.com','202cb962ac59075b964b07152d234b70','1662819775219983.png','Active Now'), (2,'John','Doe','john@gmail.com','202cb962ac59075b964b07152d234b70','1662315328download.jpg','9/11/2022, 3:00:03 PM');
    
    CREATE TABLE IF NOT EXISTS typing (typing_id int(10) AUTO_INCREMENT, type_from int(10), type_to int(10), type varchar(10), PRIMARY KEY(typing_id));
    ";
    mysqli_multi_query($db,$sql);
    while(mysqli_next_result($db)){;}
?>