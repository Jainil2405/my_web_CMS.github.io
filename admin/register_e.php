<?php


define('DB_SERVER','localhost');
define('DB_USER','root');
define('DB_PASS' ,'');
define('DB_NAME', 'cms');
$con=mysqli_connect(DB_SERVER,DB_USER,DB_PASS,DB_NAME);
// Check connection
if (mysqli_connect_errno())
{
 echo "Failed to connect to MySQL: " . mysqli_connect_error();
}
error_reporting(0);
if(isset($_POST['submit']))
{
	$fullName=$_POST['fullName'];
	$empEmail=$_POST['empEmail'];
	$password=md5($_POST['password']);
	$contactNo=$_POST['contactNo'];
	$city=$_POST['city'];
	$area_of_exp=($_POST['area_of_exp']);
	$query=mysqli_query($con,"insert into employee (fullName,empEmail,contactNo,area_of_exp,city,password) values ('$fullName','$empEmail','$contactNo','$area_of_exp','$city','$password')");
	$msg="Registration successfull. !";
}
?>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="Dashboard">
    <meta name="keyword" content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">

    <title>CMS | Employee Registration</title>
    <link href="assets1/css/bootstrap.css" rel="stylesheet">
    <link href="assets1/font-awesome/css/font-awesome.css" rel="stylesheet" />
    <link href="assets1/css/style.css" rel="stylesheet">
    <link href="assets1/css/style-responsive.css" rel="stylesheet">
    	<script>
function userAvailability() {
$("#loaderIcon").show();
jQuery.ajax({
url: "check_availability.php",
data:'email='+$("#email").val(),
type: "POST",
success:function(data){
$("#user-availability-status1").html(data);
$("#loaderIcon").hide();
},
error:function (){}
});
}
</script>
  </head>

  <body>
	  <div id="login-page">
	  	<div class="container">
	  	
		      <form class="form-login" method="post">
		        <h2 class="form-login-heading">Employee Registration</h2>
		        <p style="padding-left: 1%; color: green">
		        	<?php if($msg){
echo htmlentities($msg);
		        		}?>


		        </p>
		        <div class="login-wrap">
		         <input type="text" class="form-control" placeholder="Full Name" name="fullName" required="required" autofocus>
		          <br>


		            <input type="email" class="form-control" placeholder="Employee ID" id="empEmail" onBlur="userAvailability()" name="empEmail" required="required">
		            <br>
		               <input type="text" class="form-control" maxlength="10" name="contactNo" placeholder="Contact no" required="required" autofocus>
		            <br>

		             <input type="text" class="form-control" placeholder="Area of Expertise" name="area_of_exp" required="required" autofocus>
		             <br>
		             <input type="text" class="form-control" placeholder="City" name="city" required="required" autofocus>
		
		     
		             <span id="user-availability-status1" style="font-size:12px;"></span>
		            <br>
		            <input type="password" class="form-control" placeholder="Password" required="required" name="password"><br>
		            
		            <button class="btn btn-theme btn-block"  type="submit" name="submit" id="submit"><i class="fa fa-user"></i> Register</button>
		            <hr>
		            
		 		
		        </div>
		
		      
		
		      </form>	  	
	  	
	  	</div>
	  </div>

    <!-- js placed at the end of the document so the pages load faster -->
    <script src="assets1/js/jquery.js"></script>
    <script src="assets1/js/bootstrap.min.js"></script>

    <!--BACKSTRETCH-->
    <!-- You can use an image of whatever size. This script will stretch to fit in any screen size.-->
    <script type="text/javascript" src="assets1/js/jquery.backstretch.min.js"></script>
    <script>
        $.backstretch("assets1/img/login-bg.jpg", {speed: 500});
    </script>


  </body>
</html>
