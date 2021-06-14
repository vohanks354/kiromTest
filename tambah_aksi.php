<?php 
// koneksi database
include 'koneksi.php';

// menangkap data yang di kirim dari form
$nama = $_POST['nama'];

$SQL = "insert into `namateman` (`id`, `nama`) values(null,'$nama')";

// menginput data ke database
mysqli_query($koneksi, $SQL);

// mengalihkan halaman kembali ke index.php
header("location:index.php");

?>