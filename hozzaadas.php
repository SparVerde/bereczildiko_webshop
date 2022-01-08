
<?php
require_once './connect.php';
        if(filter_input(INPUT_POST,"hozzaadas", FILTER_VALIDATE_BOOLEAN)){
            //echo("hozzaadas is valid");
           $nev = filter_input(INPUT_POST,"nev", FILTER_SANITIZE_STRING, FILTER_NULL_ON_FAILURE);
           var_dump($nev);
            $ar = filter_input(INPUT_POST,"ar", FILTTER_SANITIZE_INT, FILTER_NULL_ON_FAILURE);
            if (is_null($ar)) {
                $err = true;
                $err_message = "Az árnak számnak kell lennie";
            } else if ($ar < 0){
                $err = true;
                $err_message = "Az ár nem lehet negatív";
            }
        }
        else{
            //echo("hozzaadas nem valid"); //csak tesztelésre
        }
            
?>

<h1>Termékek hozzáadása</h1>

<form method ="POST" action="index.php?menu=hozzaadas" enctype="multipart/form-data">
<div class="form-group">
<label for ="nev">Adja meg a termék nevét!</label><br>
<input type="text" id="nev" name="nev" maxlength="100" value="<?php echo isset($nev)?$nev:""; ?>" required></input>
</div>
<div class="form-group">
<label for ="ar">Adja meg a termék eladási árát!</label><br>
<input type="number" id="ar" name="ar" min = "1" required value="<?php echo isset($ar)?$ar:""; ?>"></input>
</div>
<div class="form-group">
<label for ="file">Válassza ki a feltöltendő képet!</label><br>
<input type="file" id="file" name="file" accept="image/*" required value="<?php echo isset($file)?$file:""; ?>" ></input>
</div>
<div class="form-group">
<label for ="leiras">Adja meg a termék leírását!</label><br>
<textarea type="text" id="leiras" name="leiras" value="<?php echo isset($leiras)?$leiras:""; ?>"></textarea>
</div>
<button type="submit" name="submit" value="true">Feltöltés</button>
</form>

<div>

   <div>
        <!--A cél hogy a filok beírása adatbázisba történjen-->
        <?php
        //if (isset($_POST) && !empty($_POST) ){
        if(filter_input(INPUT_POST,"submit",FILTER_VALIDATE_BOOLEAN, FILTER_NULL_ON_FAILURE)) {
        $target_dir = "uploads/"; //--- megadja azt a könyvtárat, ahová a fájlt elhelyezni kívánja, létező mappa a megfelelő jogosultsággal!
        $target_file = $_FILES["file"]["tmp_name"];
        $imageType = strtolower(pathinfo($_FILES["file"]["name"],PATHINFO_EXTENSION));
        //file neve+ dátum megadása és típus, sajnos nem tökéletes:
        move_uploaded_file($target_file, $target_dir."/".$_FILES["file"]["name"].date("Ymdhis").".".$imageType);
//var_dump($_FILES);
        //adatbázisba írás: létre kell hozni egy mysqli objektumot, először connection mysql objektum (localhost,root, jelszó, adatbázis név)
        $conn = new mysqli("localhost","root","","slick abroncs");
        //ha valami baj van, akkor, errno
        if($conn->errno){
            die("Adatbázis nem elérhető");}
        else{
            //echo 'Sikeres nyitás!';
            $nev = filter_input(INPUT_POST, "nev");
            //var_dump($nev);//működik OK: 'Yokohama Advan 320/650 R19' 
            $ar = filter_input(INPUT_POST, "ar");
            //var_dump($ar); //OK
            $kep = $target_dir."/".$_FILES["file"]["name"].date("Ymdhis").".".$imageType; //OK 'uploads//Yokohama Advan.JPG20211229021607.jpg'
            //$kep = filter_input(INPUT_POST, "kep"); //KO null érték
            //var_dump($kep); 
            $leiras = filter_input(INPUT_POST, "leiras");
            //var_dump($leiras); //OK
            $sql = "INSERT INTO `termek` (`nev`, `ar`, `kep`, `leiras`) VALUES (?, ?, ?, ?)";
            $stmt = $conn->prepare($sql);
            //var_dump($stmt);
            $stmt->bind_param("sssb", $nev, $ar, $kep, $leiras);
            //var_dump($stmt);
            //majd a statement-et lefuttatjuk execute() metódussal, ami logikia értéket ad vissza, ha true Sikeres feltöltés...
            if($stmt->execute()){
                echo '<div class="alert alert-succes">
                <strong>Sikeres Feltöltés!</strong>
                </div>';
                
            } else {
                //echo 'Feltöltés sikertelen!?';
                echo '<div class="alert alert-succes">
          <strong>Feltöltés sikertelen!</strong>
          </div>';
            }

            header("Location: index.php?menu=home");
        }

     


        //header("Location: index.php?menu=home");
    
        // Check if image file is a actual image or fake image
       
           /* $check = getimagesize($_FILES["file"]["tmp_name"]);
            if($check !== false) {
                echo "File is an image - " . $check["mime"] . ".";
                echo '<div class="alert alert-succes">
          <strong>Sikeres hozzáadás!</strong>
          </div>';
                $uploadOK = 1;
                $tmp_name = $_FILES["file"]["tmp_name"]; //-- azonosító az átmeneti tárolóban
                var_dump($tmp_name);
                $name = $_FILES["file"]["name"].date("Ymdhi");
                move_uploaded_file($tmp_name, "$target_dir/$name");
            } else {
                echo "File is not an image.";
                $uploadOK = 0;
            }*/
            
          
        //}
    }

        /*var_dump($_FILES);
        //adatbázisba írás: létre kell hozni egy mysqli objektumot, először connection mysql objektum (localhost,root, jelszó, adatbázis név)
        $conn = new mysqli("localhost","root","","slick abroncs");
        //ha valami baj van, akkor, errno
        if($conn->errno){
            die("Adatbázis nem elérhető");}
        else{

        }*/
        ?>
    </div>
