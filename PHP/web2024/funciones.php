<?php
// Definir una función
function saludar() {
    echo "¡Hola mundo!";
}

// Llamar a la función
saludar();


// Definir una función con parámetros
function sumar($a, $b) {
    return $a + $b;
}

// Llamar a la función y mostrar el resultado
echo "<br><br>";
echo "La suma de 3 y 4 es: " . sumar(3, 4);

// Definir una función con un parámetro por defecto
function calcularCuadrado($numero = 5) {
    return $numero * $numero;
}

// Llamar a la función sin pasar ningún parámetro
echo "<br><br>";
echo "El cuadrado del número por defecto es: " . calcularCuadrado();

// Llamar a la función y pasar un parámetro
echo "<br>El cuadrado de 8 es: " . calcularCuadrado(8);

// Definir una función que devuelve un array
function obtenerColores() {
    return array("rojo", "verde", "azul");
}

// Llamar a la función y mostrar el contenido del array
$colores = obtenerColores();
echo "<br><br>";
echo "Colores disponibles: " . implode(", ", $colores);

// Definir una función recursiva para calcular el factorial de un número
function factorial($n) {
    if ($n <= 1) {
        return 1;
    } else {
        return $n * factorial($n - 1);
    }
}

// Llamar a la función y mostrar el resultado
echo "<br><br>";
echo "El factorial de 5 es: " . factorial(5);

// PHP permite el paso de funciones como parametros (callbakc)
// Definir una función que toma una función de devolución de llamada como argumento
function operacion($a, $b, $callback) {
    return $callback($a, $b);
}

// Llamar a la función operacion() y pasar la función de devolución de llamada sumar()
$resultado = operacion(3, 4, 'sumar');
echo "<br><br>";
echo "El resultado de la operación es: " . $resultado;

// Arreglos en PHP

// Arreglo vacio
$array_vacio = array();

// a partir de PHP 5.4, puedes usar la sintaxis de corchetes
//$array_vacio = [];

// Declaración de array con elementos
$colores = array("rojo", "verde", "azul");

// Declaración de array asociativo (con claves y valores)
$persona = array(
    "nombre" => "Juan",
    "edad" => 30,
    "ciudad" => "Madrid"
);

// Acceder a elementos del array
echo "<br><br>";
echo $colores[0]; // Muestra "rojo"
echo $persona["nombre"]; // Muestra "Juan"
?>