<h1>Elérhető Slick Abroncsok</h1>

<?php
//a megjelenítéshez az adatbázist kell elérnünk, ezt a köv. sql utasítással kapjuk meg
$sql = "SELECT `nev`,`ar`,`kep`, `leiras` FROM `termek`";
//conn objektum query metódusát futtatjuk és true vagy false értékkel jön vissza
if($result = $conn->query($sql)){
    //-- sikeres lekérdezés feldolgozása
    //ha nem nulla sora van:
    if($result->num_rows > 0){
        //oszlop nevével hivatkozunk a fetch_assoc metódusnál
        while ($row = $result->fetch_assoc()){
            //float egymás mellett jelennek meg és margin-t is adunk hozzá....
            echo '<div class="card" style="width: 18rem; float:left; margin: 1rem">';
            if($row["kep"] != null){
                //var_dump($row["kep"]);
                //echo $row["kep"];
                //kép forrása az uploads mappában van, az adatbázis kép tulajdonsága ["kép"]:
                echo '<img src="'.$row["kep"].'" class="card-img-center" alt="'.$row["kep"].'">';
                //echo '<img src="'."uploads//".$row["kep"].'" class="card-img-center" alt="'.$row["kep"].'">';
                //$target_dir."/".$_FILES["file"]["name"].date("Ymdhis").".".$imageType
                //echo '<img src="uploads//Hankook Ventus F200.JPG" alt="C:\wamp\www\bereczildiko_webshop\uploads\Hankook Ventus F200.JPG" class="card-img-center">';
            }
            //card body-ba tesszük bele a leírást:, és a név tulajdonságot hívjuk be
            //a button-ra kattintva a value értékkel adom meg mit rendelek, és submittal elküldöm 
            echo '<div class="card-body">
                    <h5 class="card-title">'.$row["nev"].'</h5>
                <p class="card-text">'.number_format($row["ar"],0,"."," ").' Ft</p>
                <button type="submit" class="btn btn-primary" value="'.$row["nev"].'">Megrendelem</button>
              </div>
            </div>';
        }
    }
} else {
    echo 'Sikertelen lekérdezés';
}

