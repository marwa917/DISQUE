<?php
$conn = mysqli_connect("localhost", "root", "", "dsq", 3307);
mysqli_set_charset($conn, "utf8");
?>

<!DOCTYPE html>
<html>

<head>
    <title>supervent</title>
    <meta charset="utf-8">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
</head>

<body>

    </div>

    <nav class="navbar navbar-expand-sm navbar-dark bg-dark">
        <div class="container-fluid">
            <a class="navbar-brand" href="javascript:void(0)"></a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#mynavbar">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="mynavbar">
                <ul class="navbar-nav me-auto">
                    <li class="nav-item">
                    <i class="fa-solid fa-user"></i>
                     <a class="text-danger" href="index.html">connexion</a>
                        <a class="text-danger" href="inscription.html"></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="javascript:void(0)">panier</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="javascript:void(0)"><i class="fa-brands fa-facebook"></i></a>
                    </li>


                </ul>
                <form class="d-flex">
                    <input class="form-control mxp-5" type="text" placeholder="Search">
                    <button class="btn btn-primary" type="button">Search</button>
                </form>
            </div>
        </div>
    </nav>

    <div class="container-fluid mt-3">


    </div>
    <div>

        <?php
        $sql = 'select * from produit';
        $result = mysqli_query($conn, $sql);
        while ($row = mysqli_fetch_array($result)) {
            $image = $row["Image"];
            $id = $row["ID"];
            $lenom = $row["Nom"];
            $leprix = $row["Prix"];
            $description = $row["Description"];
           
            echo "<div class='proditem'>";

            $lenom = "<div class='one'>" . $lenom . "</div>";
            echo "<a href='pageSpecialise.php?id=" . $id . "'>" . $lenom . "</a>";

            echo "<div class='description'>" . $description . "</div>";

            echo "<div class='two'>" . $leprix . '£' . "</div>";

            $ima = "images/" . $id . ".png";
            echo "<div class='three'><img src='" . $image . "' style=\"width:150px; height:150px;\"></div>";

            echo "</div>";
        }

        ?>
         


</body>

</html>