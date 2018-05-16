<?php
include("includes/header.php");



if(isset($_POST['post'])){

	$uploadOk = 1;
	$imageName = $_FILES['fileToUpload']['name'];
	$errorMessage = "";
	$max_file_size = 1024*200; // 200kb
	$sizes = array(100 => 100, 150 => 150, 250 => 250);

	if($imageName != "") {
		$targetDir = "assets/images/posts/"; // destimation of file
		$imageName = $targetDir . uniqid() . basename($imageName);
		$imageFileType = pathinfo($imageName, PATHINFO_EXTENSION);



		if($_FILES['fileToUpload']['size'] > 10000000) {
		 	$errorMessage = "Sorry your file is too large";
		 	$uploadOk = 0;
		 }



		if(strtolower($imageFileType) != "jpeg" && strtolower($imageFileType) != "png" && strtolower($imageFileType) != "jpg") {
			$errorMessage = "Sorry, only jpeg, jpg and png files are allowed";
			$uploadOk = 0;
		}

		if($uploadOk) {
			if(move_uploaded_file($_FILES['fileToUpload']['tmp_name'], $imageName)) {
				//image uploaded okay
			}
			else {
				//image did not upload
				$uploadOk = 0;
			}
		}

	}

	if($uploadOk) {
		$post = new Post($con, $userLoggedIn);
		$post->submitPost($_POST['post_text'], 'none', $imageName);
		header("Location: index.php"); //*** wb from q and a ADD THIS LINE ***
	}
	else {
		echo "<div style='text-align:center;' class='alert alert-danger'>
		$errorMessage
		</div>";
	}

}
?>

<!-- <div class="user_details column">
<a href="<?php echo $userLoggedIn; ?>">  <img src="<?php echo $user['profile_pic']; ?>"> </a>

<div class="user_details_left_right">
<a href="<?php echo $userLoggedIn; ?>">
<?php
echo $user['first_name'] . " " . $user['last_name'];

?>
</a>
<br>
<?php echo "Posts: " . $user['num_posts']. "<br>";
echo "Likes: " . $user['num_likes'];

?>
</div>

</div> -->

<!-- <div class="main_column column" style="margin-top:80px"> -->

<!-- <div class="row" style="margin-top:80px margin-bottom:150px">
<div class="col-sm-12 blackbox"> -->

<div class="container post_form_area" style="margin-top:140px;">

	<form class="post_form" action="index.php" method="POST" enctype="multipart/form-data">
		<div class="form-row">
			<div class="col-md-12" style="padding: 0px">
				<textarea name="post_text" id="post_text" placeholder="Join the fun! Post a photo or share something!"></textarea>
			</div>
		</div>

		<div class="form-row">
			<div class="col-md-12" style="padding: 0px">
				<input type="file" style="height:40px" name="fileToUpload" id="fileToUpload"> <!-- css line 30 -->
			</div>
			</div>

<div class="form-row">
				<div class="col-md-12" style="padding: 0px">
				<input type="submit" name="post" id="post_button" value="Submit"> <!-- css line 30 -->
			</div>
		</div>

	</form>

</div> <!-- closing for form container -->


<hr>


<div class="posts_area"></div>

<!-- wb replaced the scrypt section below to make it infinite scrolling and change this div
<button id="load_more">Load More Posts</button>
<img id="loading" src="assets/images/icons/loading.gif"> -->

<script>
	 $(function(){

			 var userLoggedIn = '<?php echo $userLoggedIn; ?>';
			 var inProgress = false;

			 loadPosts(); //Load first posts

			 $(window).scroll(function() {
					 var bottomElement = $(".status_post").last();
					 var noMorePosts = $('.posts_area').find('.noMorePosts').val();

					 // isElementInViewport uses getBoundingClientRect(), which requires the HTML DOM object, not the jQuery object. The jQuery equivalent is using [0] as shown below.
					 if (isElementInView(bottomElement[0]) && noMorePosts == 'false') {
							 loadPosts();
					 }
			 });

			 function loadPosts() {
					 if(inProgress) { //If it is already in the process of loading some posts, just return
							 return;
					 }

					 inProgress = true;
					 $('#loading').show();

					 var page = $('.posts_area').find('.nextPage').val() || 1; //If .nextPage couldn't be found, it must not be on the page yet (it must be the first time loading posts), so use the value '1'

					 $.ajax({
							 url: "includes/handlers/ajax_load_posts.php",
							 type: "POST",
							 data: "page=" + page + "&userLoggedIn=" + userLoggedIn,
							 cache:false,

							 success: function(response) {
									 $('.posts_area').find('.nextPage').remove(); //Removes current .nextpage
									 $('.posts_area').find('.noMorePosts').remove(); //Removes current .nextpage
									 $('.posts_area').find('.noMorePostsText').remove(); //Removes current .nextpage

									 $('#loading').hide();
									 $(".posts_area").append(response);

									 inProgress = false;
							 }
					 });
			 }

			 //Check if the element is in view
			 function isElementInView (el) {
						 if(el == null) {
								return;
						}

					 var rect = el.getBoundingClientRect();

					 return (
							 rect.top >= 0 &&
							 rect.left >= 0 &&
							 rect.bottom <= (window.innerHeight || document.documentElement.clientHeight) && //* or $(window).height()
							 rect.right <= (window.innerWidth || document.documentElement.clientWidth) //* or $(window).width()
					 );
			 }
	 });

</script>


</div> <!-- closes wrapper starting in header.php -->
</body>
</html>
