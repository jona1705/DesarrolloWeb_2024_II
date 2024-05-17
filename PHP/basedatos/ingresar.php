<?php 
    include_once "../basedatos/config.php";

    function solicitud($bd_host, $bd_user, $bd_pass, $bd_name){
        if($_SERVER["REQUEST_METHOD"] == "POST"){
            $conn = new mysqli($bd_host, $bd_user, $bd_pass, $bd_name);

            // Comprobar error de conexion
            if($conn->connect_error){
                die("Error de conexion: ". $conn->connect_error);
            }

            // Obtenemos nombre
            $nombre = $_POST["nombre"];

            // Insertamos el dato
            $sql = "INSERT INTO usuarios(nombre) VALUES ('".$nombre."')";
            if($conn->query($sql) == TRUE){
                echo "Usuario ingresado correctamente";
            } else{
                echo "Error al ingresar datos: ".$conn->error;
            }

            $conn->close();
        }
    }

    solicitud($bd_host, $bd_user, $bd_pass, $bd_name);
?>