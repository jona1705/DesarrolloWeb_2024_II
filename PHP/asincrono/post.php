<?php
    if($_SERVER["REQUEST_METHOD"] == "POST"){
        // Recibir los datos del cliente y verificarlos
        $nombre = $_POST["nombre"];
        $email = $_POST["email"];
        if(isset($nombre) && isset($email) ){
            // echo "<b>Datos correctos</b>";
            header("Location: post.html");
            exit();
        } else{
            echo "<b>Error en los Datos</b>";
        }
    }

?>