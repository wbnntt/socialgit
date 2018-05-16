<?php
require 'config/config.php';
include("includes/classes/User.php");
include("includes/classes/Post.php");
include("includes/classes/Message.php");
include("includes/classes/Notification.php");


if (isset($_SESSION['username'])) {
	$userLoggedIn = $_SESSION['username'];
	$user_details_query = mysqli_query($con, "SELECT * FROM users WHERE username='$userLoggedIn'");
	$user = mysqli_fetch_array($user_details_query);
}
else {
	header("Location: register.php");
}

?>
<!doctype html>
<html>
<head>
	<title>Live Posts</title>
  <link rel = "icon" href = "./images/phoenix.png">

	<meta charset="utf-8">
	<meta name = "viewport" content = "width=device-width, initial-scale=1">

	<!-- Javascript -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4" crossorigin="anonymous"></script>

	<script src="assets/js/bootstrap.js"></script>
	<script src="assets/js/bootbox.min.js"></script>
	<script src="assets/js/demo.js"></script>
	<script src="assets/js/jquery.jcrop.js"></script>
	<script src="assets/js/jcrop_bits.js"></script>


	<!-- CSS -->
	<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="assets/css/bootstrap.css">
	<!-- <link rel="stylesheet" type="text/css" href="assets/css/style.css"> social site css link-->
	<link rel="stylesheet" type="text/css" href="assets/css/style-ew.css"> <!-- link to event-webapp site css -->
	<link rel="stylesheet" href="assets/css/jquery.Jcrop.css" type="text/css" />
</head>
<body>
	<!-- facebook -->
	<script>
	  window.fbAsyncInit = function() {
	    FB.init({
	      appId      : '{218090698758619}',
	      cookie     : true,
	      xfbml      : true,
	      version    : '{v2.12}'
	    });

	    FB.AppEvents.logPageView();

	  };

	  (function(d, s, id){
	     var js, fjs = d.getElementsByTagName(s)[0];
	     if (d.getElementById(id)) {return;}
	     js = d.createElement(s); js.id = id;
	     js.src = "https://connect.facebook.net/en_US/sdk.js";
	     fjs.parentNode.insertBefore(js, fjs);
	   }(document, 'script', 'facebook-jssdk'));
	</script>

	<!-- <div class="search">
	<form action="search.php" method="GET" name="search_form">
	<input type="text" onkeyup="getLiveSearchUsers(this.value, '<?php echo $userLoggedIn; ?>')" name="q" placeholder="Search..." autocomplete="off" id="search_text_input">

	<div class="button_holder">
	<img src="assets/images/icons/magnifying_glass.png">
</div>
</form>
<div class="search_results">
</div>
<div class="search_results_footer_empty">
</div>
</div> -->

<?php
//Unread messages
$messages = new Message($con, $userLoggedIn);
$num_messages = $messages->getUnreadNumber();

//Unread notifications
$notifications = new Notification($con, $userLoggedIn);
$num_notifications = $notifications->getUnreadNumber();

//Unread notifications
$user_obj = new User($con, $userLoggedIn);
$num_requests = $user_obj->getNumberOfFriendRequests();
?>

<!-- <a href="<?php echo $userLoggedIn; ?>">
<?php echo $user['first_name']; ?>
</a> -->

<div class="container-fluid" style="margin-bottom:20px;"> <!-- closes in footer.php -->

<nav class="navbar navbar-inverse navbar-fixed-top">
	<div class="navbar-header">
		<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
		</button>
		<a href=""><h3 class="center">Live Posts</h3></a>
	</div>


	<div class="collapse navbar-collapse" id="myNavbar">
		<ul class="nav navbar-nav" style="float:right">
			<li><a href="settings.php">settings</a></li>
			<li><a href="includes/handlers/logout.php">logout</a></li>
			</ul>
	</div>
	<!-- </div> without this you lose the map weird -->
</nav>

<br>
<!-- end nav -->



<script>
var userLoggedIn = '<?php echo $userLoggedIn; ?>';

$(document).ready(function() {

	$('.dropdown_data_window').scroll(function() {
		var inner_height = $('.dropdown_data_window').innerHeight(); //Div containing data
		var scroll_top = $('.dropdown_data_window').scrollTop();
		var page = $('.dropdown_data_window').find('.nextPageDropdownData').val();
		var noMoreData = $('.dropdown_data_window').find('.noMoreDropdownData').val();

		if ((scroll_top + inner_height >= $('.dropdown_data_window')[0].scrollHeight) && noMoreData == 'false') {

			var pageName; //Holds name of page to send ajax request to
			var type = $('#dropdown_data_type').val();


			if(type == 'notification')
			pageName = "ajax_load_notifications.php";
			else if(type == 'message')
			pageName = "ajax_load_messages.php"


			var ajaxReq = $.ajax({
				url: "includes/handlers/" + pageName,
				type: "POST",
				data: "page=" + page + "&userLoggedIn=" + userLoggedIn,
				cache:false,

				success: function(response) {
					$('.dropdown_data_window').find('.nextPageDropdownData').remove(); //Removes current .nextpage
					$('.dropdown_data_window').find('.noMoreDropdownData').remove(); //Removes current .nextpage


					$('.dropdown_data_window').append(response);
				}
			});

		} //End if

		return false;

	}); //End (window).scroll(function())


});

</script>
