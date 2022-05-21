<!DOCTYPE html>
<html>
<head>
	<title> تسجيل الدخول </title>
	<link rel="stylesheet" type="text/css" href="index.css">
</head>
<body>
     <form action="login.php" method="post">
     	<h2>تسجيل الدخول</h2>
     	<?php if (isset($_GET['error'])) { ?>
     		<p class="error"><?php echo $_GET['error']; ?></p>
     	<?php } ?>
     	<label>اسم المستخدم</label>
     	<input type="text" name="uname"><br>

     	<label>كلمة السر</label>
     	<input type="password" name="password"><br>

     	<button type="submit">تسجيل الدخول</button>
          <a href="signup.php" class="ca">انشاء لحساب</a>
     </form>
</body>
</html>