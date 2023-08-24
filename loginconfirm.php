<?php

$con=mysqli_connect("localhost","root","","chatapp");

 
     $b=$_POST['Email'];
     $c=$_POST['Password'];

    $check="select * from registration where Email='$b' and Password='$c'";
    $result=mysqli_query($con,$check);
    $count= mysqli_num_rows($result);

    if($count > 0) {
       
       echo "Login Sucessfully.";
       
    }

    else {

      echo "Account not exists.";
    
    }


   
 
 ?>