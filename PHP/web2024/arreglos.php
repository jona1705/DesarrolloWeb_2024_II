<?php

$miArreglo = array("dato1", "dato2", "dato3");
// $miArreglo = ["dato1","dato2","dato3"]; Otra notacion

echo "<b>Imprimiendo arreglo: </b>";
echo "<br><br>";
print_r($miArreglo);
echo "<br><br>";
var_dump($miArreglo);

echo "<br><br>";

$tamaño = count($miArreglo); // $tamaño contendrá 3
echo $tamaño;

echo "<br><br>";

echo sizeof($miArreglo); // imprime 3

// Ingresando un nuevo dato (al final)
array_push($miArreglo, "dato4");

echo "<br><br>";
print_r($miArreglo);

// Usando notacion de corchete (agrega al final)
$miArreglo[] = "dato5";
$miArreglo[10] = "dato10";

echo "<br><br>";
print_r($miArreglo);

echo "<br><br>";
echo $miArreglo[10];

echo "<br><br>";
$miArreglo[8] = 17;
echo $miArreglo[8];

// Agregar al inicio
array_unshift($miArreglo, "dato0");

echo "<br><br>";
print_r($miArreglo);

// Agregar en cualquier posicion
// Tercer dato son la cantidad de elementos que deseamos eliminar
array_splice($miArreglo, 1, 0, "datoNuevo");

echo "<br><br>";
print_r($miArreglo);

// Remover dato al final
array_pop($miArreglo);

echo "<br><br>";
print_r($miArreglo);

// Remover dato al principio
array_shift($miArreglo); 

echo "<br><br>";
print_r($miArreglo);

// Remover dato y posicion de cualquier elemento
// WARNING: Desaparece el indice
unset($miArreglo[1]);

echo "<br><br>";
print_r($miArreglo);

echo "<br><br>";
$miArreglo[1] = 98;
echo $miArreglo[1];

// Agregando un valor mas
$miArreglo[1] = "dato1";

echo "<br><br>";
print_r($miArreglo);

echo "<br><br>";
// Recorrer arreglo con for
$tam = count($miArreglo);
for ($i=0; $i<$tam; $i++) {
    echo $miArreglo[$i]."<br>";
}

// Usando forEach
echo "<br><br>";
foreach ($miArreglo as $elemento) {
    echo $elemento . "<br>";
}

// Imprimiendo indice-valor con forEach
echo "<br><br>";
foreach ($miArreglo as $indice => $valor) {
    echo "El elemento en el índice $indice es: $valor <br>";
}

// Generar un nuevo arreglo con los resultados de multiplicar por 2 cada elemento
$numeros = [1, 2, 3, 4, 5];
$numerosDobles = array_map(function($numero) {
    return $numero * 2;
}, $numeros);
echo "<br><br>";
print_r($numerosDobles); // Output: Array ( [0] => 2 [1] => 4 [2] => 6 [3] => 8 [4] => 10 )
// No modifica el arreglo original

// Filtrar elementos
$numerosPares = array_filter($numeros, function($numero) {
    return $numero % 2 === 0;
});
echo "<br><br>";
print_r($numerosPares);

// Aplicar una operacion usando todos los elementos del arreglo
$suma = array_reduce($numeros, function($acumulador, $numero) {
    return $acumulador + $numero;
}, 0);
echo "<br><br>";
echo $suma; // Output: 15

// Buscar elemento que cumpla una condicion
$personas = [
    ['nombre' => 'Juan', 'edad' => 20],
    ['nombre' => 'María', 'edad' => 30],
    ['nombre' => 'Pedro', 'edad' => 25]
];
$maria = null;
foreach ($personas as $persona) {
    if ($persona['nombre'] === 'María') {
        $maria = $persona;
        break;
    }
}
echo "<br><br>";
print_r($maria); // Output: Array ( [nombre] => María [edad] => 30 )

// Verificar si al menoss un elemento del arreglo cumple
// con una condicion
$tienePares = false;
foreach ($numeros as $numero) {
    if ($numero % 2 === 0) {
        $tienePares = true;
        break;
    }
}
echo "<br><br>";
var_dump($tienePares); // Output: bool(true)*/
?>