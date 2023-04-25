<?php require 'connection.php'?>
<!DOCTYPE html>
<html>
    <?php require 'head.php'?>
<body>
<?php require 'navbar.php'?> 
        <div>
            <?php
            $sql =  'select * from produit';
            $result = mysqli_query($conn, $sql);
            while ($row = mysqli_fetch_array($result)) {
                $image = $row["Image"];
                $id = $row["ID"];
                $nom = $row["Nom"];
                $prix = $row["Prix"];

                echo "<div class='proditem'>";

                $lenom = "<div class='one'>" . $nom . "</div>";
                echo "<a href='pageSpecialise.php?id=" . $id . "'>" . $lenom . "</a>";

      

                echo "<div class='two'>" . $prix . '£' . "</div>";

                $ima = "images/" . $id . ".png";
                echo "<div class='three'><img src='" . $image . "' style=\"width:150px; height:150px;\"></div>";

                echo "</div>";
            }
            ?>



</body>

</html>