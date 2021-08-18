<?php 
$koneksi = mysqli_connect("kirom-test","root","","metrocom");
// $koneksi = mysqli_connect("10.100.131.187","root","root","metrocom");

// Check connection
if (mysqli_connect_errno()){
	echo "Koneksi database gagal : " . mysqli_connect_error();
}

?>
