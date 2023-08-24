<?php 
    session_start();
    if(!isset($_SESSION['uid'])){
        header("location: login.php");
    }
?>

<?php include_once "php/header.php"; ?>
    <?php include_once 'weather.php'; ?>
    <?php include_once 'theme.php'; ?>
    <div class="wrapper">
        <section class="users">
            <header>
            <?php
                include_once "php/db.php";
                $sql = mysqli_query($db,"SELECT * FROM users WHERE uid='{$_SESSION['uid']}'");
                if(mysqli_num_rows($sql) > 0){
                    $row = mysqli_fetch_assoc($sql);
                }
            ?>
                <div class="content">
                    <img src="php/images/<?php echo $row['img']; ?>" alt="">
                    <div class="details">
                        <span><?php echo $row['fname']." ".$row['lname']; ?></span>
                        <p><?php echo $row['status']; ?></p>
                    </div>
                </div>
                <div class="btn-grp">
                    <a href="php/logout.php" class="logout">Logout</a>
                    <button class="create_group">Create Group</button>
                </div>
                <!-- The Modal -->
                <div class="modal">
                    <div class="modal-content">
                        <span class="modal-close">&times;</span>
                        <h2 class="modal-title">User List</h2>
                        <div class="error-text">This is an error message.</div>
                        <input type="text" placeholder="Group name" class="modal-group-name" name="group_name">
                        <div class="modal-user-list">
                            <div class="user-row">hello</div>
                        </div>
                        <button class="modal-submit">Create</button>
                    </div>
                </div>
            </header>
            <div class="search">
                <span class="text">Select an user to start chat</span>
                <input type="text" placeholder="Search Name">
                <button><i class="fas fa-search"></i></button>
            </div>
            <input type="text" name="update" class="update" hidden>
            <div class="users-list">
                
            </div>
        </section>
    </div>

    <!-- External JS -->
    <script src="js/weather.js"></script>
    <script src="js/theme.js"></script>
    <script src="js/users.js"></script>
</body>
</html>