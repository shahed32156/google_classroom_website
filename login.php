<?php include_once "php/header.php"; ?>
<?php include_once "theme.php"; ?>
    <!-- Sign Up Form -->
    <?php
        session_start();
        if(isset($_SESSION['uid'])){
            header("location: users.php");
        }
    ?>
    <div class="wrapper">
        <section class="form signup">
            <header>Chat Application</header>
            <form action="#">
                <div class="error-text">This is an error message.</div>
                <div class="field input">
                    <label>Email</label>
                    <input type="email" placeholder="Email" name="email" required>
                </div>
                <div class="field input">
                    <label>Password</label>
                    <input type="password" placeholder="Password" name="password" required>
                    <i class="fas fa-eye"></i>
                </div>
                <div class="field submit">
                    <input type="submit" value="Login">
                </div>
            </form>
            <div class="link">Don't have an account? <a href="index.php">Register</a></div>
        </section>
    </div>

    <!-- External JS -->
    <script src="js/password.js"></script>
    <script src="js/theme.js"></script>
    <script src="js/login.js"></script>
</body>
</html>