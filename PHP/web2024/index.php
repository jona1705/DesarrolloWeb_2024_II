<?php

    // Comentario una linea
    
    /* 
        Comentario en 
        multiple lineas
    */
    echo "Hola Mundo";
    print("<br>FES Acatlán");

    // Variables
    $nombre = "Jonathan";
    echo "<br>".$nombre;
    echo "<br>".gettype($nombre);

    echo "<br><br>";

    $edad = 23;
    $calificacion = 7.2;
    $esFake = True;
    $arreglo = [1, 2, 3, 4];
    $val = null;
    $objeto = [
        "nombre" => "Jonathan",
        "edad" => 40
    ];
    echo "<br>".$edad;
    echo "<br>".gettype($edad);
    echo "<br>".$calificacion;
    echo "<br>".gettype($calificacion);
    echo "<br>".$esFake;
    echo "<br>".gettype($esFake)."<br>";
    print_r($arreglo);
    echo "<br>".gettype($arreglo);
    echo "<br>".$val;
    echo "<br>".gettype($val)."<br>";
    print_r($objeto);
    echo "<br>".gettype($objeto);

    // Estructuras de control

    echo "<br><br>";

    //IF-ELSE
    $temperatura = 27;
    if($temperatura < 15){
        echo "<br>Temperatura es Fria";
    } else if($temperatura>15 && $temperatura<30){
        echo "<br>Clima templado";
    } else{
        echo "<br>Clima caluroso";
    }

    echo "<br><br>";

    // SWITCH-CASE
    $dia = "martes";
    switch($dia){
        case "lunes": 
            echo "<br>Es Lunes";
            break;
        case "martes": 
            echo "<br>Es Martes";
            break;
        case "miercoles": 
            echo "<br>Es Miercoles";
            break;
        case "viernes": 
            echo "<br>Es Viernes";
            break;
        default: 
            echo "<br>Es fin de semana";
    }

    echo "<br><br>";

    // FOR 
    for($i=0; $i<10; $i++){
        echo $i." ";
    }

    echo "<br><br>";

    // WHILE
    $i=0;
    while($i<10){
        echo $i." ";
        $i++;
    }

    echo "<br><br>";

    // DO-WHILE
    $i=0;
    do{
        echo $i." ";
        $i++;
    } while($i<10);

    echo "<br><br>";

    // Podemos usar forEach para leer arreglos
    $arr = [24, 56, 78, 12];
    foreach($arr as $valor){
        echo $valor." ";
    }
?>