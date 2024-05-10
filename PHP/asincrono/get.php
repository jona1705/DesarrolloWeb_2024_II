<?php

    if($_SERVER["REQUEST_METHOD"] == "GET"){
        // Recibir los datos del cliente y verificarlos
        $nombre = $_GET["nombre"];
        $email = $_GET["email"];
        if(isset($nombre) && isset($email) ){
            echo "<b>Datos correctos</b>";
        } else{
            echo "<b>Error en los Datos</b>";
        }
    }

?>