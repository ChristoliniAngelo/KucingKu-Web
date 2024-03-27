<?php
$servername = "localhost";
$username = "MySQL80";
$password = "Averia12@";
$dbname = "cat_adoption_db";
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Prepare and bind the SQL statement
$stmt = $conn->prepare("INSERT INTO users (nama, umur, lokasi) VALUES (?, ?, ?)");
$stmt->bind_param("sis", $nama, $umur, $lokasi);

// Set parameters and execute the statement
$nama = $_POST['nama'];
$umur = $_POST['umur'];
$lokasi = $_POST['lokasi'];
$stmt->execute();

// Close statement and database connection
$stmt->close();
$conn->close();

// Redirect back to the form or a thank you page
header("Location: index.html");
exit();
?>
