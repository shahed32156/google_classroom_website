<?php

$con=mysqli_connect("localhost","root","","chatapp");

 
 
     $a=$_POST['Full_name'];
     $b=$_POST['Email'];
     $c=$_POST['Password'];
     $d=$_POST['Birth_date'];

    $check="select * from registration where Email='$b'";
    $result=mysqli_query($con,$check);
    $count= mysqli_num_rows($result);

    if($count > 0) {
       
       echo "Account already exists.";
       header("location:registration.php");
    }

    else {

        $sql="insert into registration (Full_name,Email,Password,Birth_date) values ('$a','$b','$c','$d')";
        mysqli_query($con,$sql);
        echo "Successfull.";
    
    }


   
 
 ?>