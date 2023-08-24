<?php
session_start();
if (!isset($_SESSION['uid'])) {
    header("location: login.php");
}
?>

<?php include_once "php/header.php"; ?>
<?php include_once 'weather.php'; ?>
<?php include_once 'theme.php'; ?>

<?php

?>
<div class="wrapper">
    <section class="chat-area">
        <header>
            <?php
            include_once "php/db.php";
            $groupId = mysqli_real_escape_string($db, $_GET['groupId']);
            $sql = mysqli_query($db, "SELECT * FROM groups WHERE id='{$groupId}'");

            if (mysqli_num_rows($sql) > 0) {
                $row = mysqli_fetch_assoc($sql);
            }

            $sql2 = mysqli_query($db, "SELECT created_by FROM groups WHERE id='{$groupId}'");
            $row2 = mysqli_fetch_assoc($sql2);
            ?>
            <a href="users.php" class="back-icon"><i class="fas fa-arrow-left"></i></a>
            <img src="group-chat.png" alt="">
            <div class="details">
                <span><?php echo $row['group_name']; ?></span>
                <p></p>
                <input type="text" name="groupId" class="groupId" value="<?php echo $groupId; ?>" hidden>
            </div>
            <div class="dropdown">
                <i class="fa-solid fa-ellipsis-vertical"></i>
                <div class="dropdown-list">
                    <div class="dropdown-item image">Image
                        <input type="file" name="image" hidden>
                    </div>
                    <div class="dropdown-item file">File
                        <input type="file" name="file" hidden>
                    </div>
                    <div class="dropdown-item members">Members
                    </div>
                    <?php if($row2['created_by'] == $_SESSION['uid']){ ?>
                    <div class="dropdown-item delete-group" onclick="deleteGroup()">Delete Group
                    </div>
                    <?php } ?>
                </div>
            </div>
            <!-- The Modal -->
            <div class="modal">
                <div class="modal-content">
                    <span class="modal-close">&times;</span>
                    <h2 class="modal-title">Group Members</h2>
                    <div class="modal-user-list group-members">
                        <div class="user-row">hello</div>
                    </div>
                </div>
            </div>
        </header>
        <div class="chat-box">
        </div>
        <div class="typing-box">
            <div class="typing">
                <span></span>
                <span></span>
                <span></span>
            </div>
        </div>
        <form action="#" class="typing-area">
        <input type="text" name="outgoing_id" class="outgoing_id" value="<?php echo $_SESSION['uid']; ?>" hidden>
        <input type="text" hidden class="groupId" name="groupId" value="<?php echo $row['id'];?>">
            <div class="emojiSet">
                <i class="fa-solid fa-face-smile-beam"></i>
                <div class="emoji-list">
                </div>
            </div>
            <input type="text" name="message" placeholder="Type a message..." class="message" autocomplete="off">
            <button class="send"><i class="fab fa-telegram-plane"></i></button>
            <button class="voice"><i class="fa-solid fa-microphone"></i></button>
        </form>
    </section>
</div>

<script src="js/weather.js"></script>
<script src="js/theme.js"></script>
<script src="js/groupChat.js"></script>
</body>

</html>