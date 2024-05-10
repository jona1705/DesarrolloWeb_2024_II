<?php

$persona = array(
    "nombre" => "Juan",
    "edad" => 30,
    "ciudad" => "Madrid"
);

echo $persona["nombre"]; // Output: Juan
echo "<br><br>";
echo $persona["edad"]; // Output: 30
echo "<br><br>";
echo $persona["ciudad"]; // Output: Madrid
echo "<br><br>";

// Agregar elementos
$persona["profesion"] = "Ingeniero";
echo "<br><br>";
print_r($persona);

// Modificar elementos
$persona["edad"] = 35;
echo "<br><br>";
print_r($persona);

// Eliminar Elementos
unset($persona["ciudad"]);
echo "<br><br>";
print_r($persona);

// Métodos asociados a los arreglos asociativos

// Devolver todas las claves de un arreglo asociativo como un arreglo
echo "<br><br>";
print_r(array_keys($persona));

// Devolver todos los valores de un arreglo asociativo como un arreglo
echo "<br><br>";
print_r(array_values($persona));

// Verificar si una clave existe en un arreglo asociativo
echo "<br><br>";
if (array_key_exists("nombre", $persona)) {
    echo "La clave 'nombre' existe en el arreglo.";
} else {
    echo "La clave 'nombre' no existe en el arreglo.";
}

// Verificar si una clave está definida en un arreglo asociativo
echo "<br><br>";
if (isset($persona["edad"])) {
    echo "La clave 'edad' está definida en el arreglo.";
} else {
    echo "La clave 'edad' no está definida en el arreglo.";
}

// Recorrer un arreglo asociativo con foreach
$persona01 = array(
    "nombre" => "Juan",
    "edad" => 30,
    "ciudad" => "Madrid",
    "profesion" => "Ingeniero"
);

echo "<br><br>";
foreach ($persona01 as $clave => $valor) {
    echo "La clave '$clave' tiene el valor '$valor'.<br>";
}

// Obtener el número de elementos en un arreglo asociativo
$numeroElementos = count($persona);
echo "<br>";
echo "El arreglo asociativo tiene $numeroElementos elementos.";

// Comprobar si un valor existe en un arreglo asociativo
echo "<br><br>";
if (in_array("Juan", $persona)) {
    echo "El valor 'Juan' existe en el arreglo asociativo.";
} else {
    echo "El valor 'Juan' no existe en el arreglo asociativo.";
}

// Obtener todas las claves o todos los valores de un arreglo asociativo
$claves = array_keys($persona);
$valores = array_values($persona);
echo "<br><br>";
echo "Las claves son: " . implode(", ", $claves) . "<br>";
echo "Los valores son: " . implode(", ", $valores);

// Ordenar un arreglo asociativo por sus claves
ksort($persona);
echo "<br><br>";
foreach ($persona as $clave => $valor) {
    echo "La clave '$clave' tiene el valor '$valor'.<br>";
}

// Ordenar un arreglo asociativo por sus valores
asort($persona);
echo "<br>";
foreach ($persona as $clave => $valor) {
    echo "La clave '$clave' tiene el valor '$valor'.<br>";
}

// Convertir un arreglo asociativo a JSON
echo "<br>";
$json = json_encode($persona);
echo $json;

// Creación de un arreglo de arreglos asociativos
$personas = [
    [
        "nombre" => "Juan",
        "edad" => 30,
        "ciudad" => "Madrid"
    ],
    [
        "nombre" => "María",
        "edad" => 25,
        "ciudad" => "Barcelona"
    ],
    [
        "nombre" => "Pedro",
        "edad" => 35,
        "ciudad" => "Sevilla"
    ]
];

// Acceso a elementos y actualización
echo "<br><br>";
echo "Nombre: " . $personas[0]["nombre"]; // Acceder a un valor
$personas[1]["edad"] = 26; // Actualizar un valor

// Agregar nuevos elementos
$nuevaPersona = [
    "nombre" => "Ana",
    "edad" => 28,
    "ciudad" => "Valencia"
];
$personas[] = $nuevaPersona;
echo "<br><br>";
print_r($personas);

// Eliminar elementos
//unset($personas[2]);
//echo "<br><br>";
//print_r($personas);

$indiceAEliminar = 1; // Índice del elemento que deseas eliminar
// Eliminar el elemento del arreglo usando array_splice()
array_splice($personas, $indiceAEliminar, 1);
echo "<br><br>";
print_r($personas);

// Recorrer y mostrar elementos
echo "<br><br>";
foreach ($personas as $persona) {
    echo "Nombre: " . $persona["nombre"] . ", Edad: " . $persona["edad"] . ", Ciudad: " . $persona["ciudad"] . "<br>";
}

// Obtener el número de elementos en el arreglo
$numeroElementos = count($personas);
echo "<br>";
echo $numeroElementos;

// Convertir un arreglo de arreglos asociativos a JSON
$json = json_encode($personas);
echo "<br><br>";
echo $json;
?>