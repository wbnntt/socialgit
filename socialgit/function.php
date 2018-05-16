/** Resize Function(function.php):
*Resize function is based on PHP GD library.
*/


/**
 * Image resize
 * @param int $width
 * @param int $height
 */

 <?php
function resize($width, $height){
  /* Get original image x y*/
  list($w, $h) = getimagesize($_FILES['fileToUpload']['tmp_name']);
  /* calculate new image size with ratio */
  $ratio = max($width/$w, $height/$h);
  //$h = ceil($height / $ratio);
  $x = ($w - $width / $ratio) / 2;
  //$w = ceil($width / $ratio);
  /* new file name */
  $path = 'songs/'.$width.'x'.$height.'_'.$_FILES['songs']['name'][$key];
  $path1 = $width.'x'.$height.'_'.$_FILES['songs']['name'][$key];
  /* read binary data from image file */
  $imgString = file_get_contents($_FILES['songs']['tmp_name'][$key]);
  /* create image from string */
  $image = imagecreatefromstring($imgString);
  $tmp = imagecreatetruecolor($width, $height);
  imagecopyresampled($tmp, $image,0, 0, 0, 0,$width, $height,$w, $h);
  /* Save image */
  switch ($_FILES['image']['type']) {
    case 'image/jpeg':
      imagejpeg($tmp, $path, 100);
      break;
    case 'image/png':
      imagepng($tmp, $path, 0);
      break;
    case 'image/gif':
      imagegif($tmp, $path);
      break;
    default:
      exit;
      break;
  }

  /* cleanup memory */
  imagedestroy($image);
  imagedestroy($tmp);
  return $path;
}

?>
