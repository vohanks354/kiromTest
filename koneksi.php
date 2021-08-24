<?php 
$koneksi = mysqli_connect("mydb","user","pass","sampledb");

// Check connection
if (mysqli_connect_errno()){
	echo "Koneksi database gagal : " . mysqli_connect_error();
}

?>
