<!DOCTYPE html>
<html>
<head>
	<title>انشاء حساب</title>
	<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
     <form action="signup-check.php" method="post">
     	<h2>انشاء حساب</h2>
     	<?php if (isset($_GET['error'])) { ?>
     		<p class="error"><?php echo $_GET['error']; ?></p>
     	<?php } ?>

          <?php if (isset($_GET['success'])) { ?>
               <p class="success"><?php echo $_GET['success']; ?></p>
          <?php } ?>

          <label>الاسم</label>
          <?php if (isset($_GET['name'])) { ?>
               <input type="text" 
                      name="name" 
                      
                      value="<?php echo $_GET['name']; ?>"><br>
          <?php }else{ ?>
               <input type="text" 
                      name="name" 
                      ><br>
          <?php }?>

          <label>الاسم الشخصي</label>
          <?php if (isset($_GET['uname'])) { ?>
               <input type="text" 
                      name="uname" 
                     
                      value="<?php echo $_GET['uname']; ?>"><br>
          <?php }else{ ?>
               <input type="text" 
                      name="uname" 
                      ><br>
          <?php }?>


     	<label>كلمة السر</label>
     	<input type="password" 
                 name="password" 
                ><br>

          <label>تاكيد كلمة السر</label>
          <input type="password" 
                 name="re_password" 
                ><br>

     	<button type="submit">تسجيل الدخول</button>
          <a href="index.php" class="ca">هل لديك حساب مسبقا؟</a>
     </form>
</body>
</html>