let arr = [1, 2, 3, 4, 5]
console.log(arr)

// Agregar un nuevo elemento al arreglo
arr[arr.length] = 6;
console.log(arr)

// Insertar valores al final
arr.push(7)
console.log(arr)

// Insertar valores al principio
arr.unshift(0)
console.log(arr)

// Borrar valores al final
arr.pop()
console.log(arr)

// Borrar valores al principio
arr.shift()
console.log(arr)

// Si yo deseo insertar un elemento en cualquier posicion
arr.splice(3, 0, 0)
console.log(arr)

arr.splice(3, 10, 0)
console.log(arr)
console.log(arr.length)

// Pasar como parametro funciones dentro de funciones (Callback)
function fn(func, nombre){
    func(nombre)
}

function saludar(nombre){
    console.log("Hola " + nombre)
}

fn(saludar, "Jonathan")

// Procesar los elementos de un arreglo
// Forma mas basica es con un bucle
for(i=0; i<arr.length; i++){
    console.log(arr[i])
}

// Otros métodos para procesar los elementos
arr.forEach(function(elemento, index){
    console.log(index + ":"+ elemento)
})

arr.forEach(function(elemento, index){
    arr[index] = elemento * 3
})

console.log(arr)

// Generar un nuevo arreglo con los resultados de multiplicar por 2 cada elemento
let dobles = arr.map(function(elemento){
    return elemento * 2
})
console.log(dobles)

// Filtrar elementos
let pares = arr.filter(function(elemento){
    return elemento % 2 == 0
})

console.log(pares)

// Operador Ternario
let x = 5 > 2 ? console.log("Verdadera"): console.log("Falsa")
console.log(5 > 2 ? console.log("Verdadera"): console.log("Falsa"))

// Aplicar una operacion usando todos los elementos del arreglo
let suma = arr.reduce(function(acumulador, elemento){
    return acumulador += elemento
}, 0)

console.log(suma)

// Buscar elemento que cumpla una condicion
let buscado = arr.find(function(elemento){
    return elemento > 7
})

console.log(buscado)

// Verificar si al menoss un elemento del arreglo cumple
// con una condicion
let resultado = arr.some(function(elemento){
    return elemento > 7
})

console.log(resultado)

// Desestructuracion
let arr2 = [1, 3, 4, 6, 8, 9, 10, 12];
let arr3 = [15, 18, 20, 23];
[a, b, c, d, ...e] = arr2
console.log(a)
console.log(b)
console.log(c)
console.log(d)
console.log(e)

// Funcionar dos arreglos
let nuevoArr = [...arr2, ...arr3]
console.log(nuevoArr)

// Pasar argumentos a funciones
function sumar(a,b,c,d){
    return a+b+c+d
}

console.log(sumar(...arr3))

// Concatenar
let cadena1 = "FES Acatlan"
let cadena2 = "UNAM"
console.log(cadena1 + " " + cadena2)

// Tipos de Datos
let var1 = 1;
let var2 = "1";
console.log(var1 == var2)
console.log(var1 === var2) // Operador estricto

// Mostrar el tipo
console.log(typeof var1)
console.log(typeof var2)
console.log(typeof arr)

// Declarar constantes
const VALOR = 89;
console.log(VALOR);
VALOR += 9;
console.log(VALOR);