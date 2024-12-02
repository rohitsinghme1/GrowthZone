    <?php
    $localhost = "localhost";
    $user ="root";
    $pass = "";
    $dbname = "practice1";

$conn = mysqli_connect($localhost, $user, $pass, $dbname);
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
  }
  echo "Connected successfully";

  if(isset($_POST["submit"])){
    $uname = $_POST["uname"];
    $rollno = $_POST["rollno"];
    $phone = $_POST["phone"];
    $email =$_POST["email"];

    if(empty($uname) || empty($rollno) || empty($phone) || empty($email)){
        echo "Please enter all the fields";
    }

    $sql = "INSERT into Student(UName, rollno, Phone, Email) values('$uname', '$rollno', '$phone', '$email')";
    $result = $conn->query($sql);
  }
    ?>


    <!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <h1>Form</h1>
    <form method="post">
        <label for="name">name</label><br>
        <input type="text" id="uname" class="name" name= "uname"><br><br>

        <label for="roll">Roll NO:</label><br></br>
        <input type="number" id="roll" class="roll" name= "rollno"><br>

        <label for="phone">Phone</label><br>
        <input type="number" id="phn" name="phone"><br></br>

        <label for="email">Email</label><br>
        <input type="email" class="email" id="emial" name="email"><br>

        <button type="submit" name="submit">Submits</button>

    </form>

    <?php
    $sql = "select * from Student";
    $result = $conn->query($sql);
    if($result->num_rows >0){
        while($row = $result->fetch_array()){
            echo $row['UName']." ".$row['rollno']." ".$row['Phone']." ".$row['Email']. "<br>";
        }
    }
    ?>
</body>
</html>