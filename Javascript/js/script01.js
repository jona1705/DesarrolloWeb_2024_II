/* alert("HOLA MUNDO"); */
console.log("HOLA MUNDO");

/* Declaracion de variables */

/* var vs let */
console.log(x); /*undefined*/
var x = 5;
console.log(x);
/* Alternativamente */
let y = "FES Acatlan";
console.log(y);

/* Ambito de bloque: Var */
function prueba(){
    if(true){
        var x = 10;
        console.log(x);
    }
    console.log(x);
}

prueba();

function prueba2(){
    if(true){
        let val = 20;
        console.log(val);
    }
    // console.log(val);
}

prueba2();

/* Tipos de datos */
let v1 = 23;
let v2 = 23.45;
let v3 = "Hola";
let v4 = true; /* o false */
console.log(typeof v1); // Number
console.log(typeof v2); // Number
console.log(typeof v3); // String
console.log(typeof v4); // Boolean

v4 = 356.78; // Reasignando valor y tipo

console.log(typeof v4);

// Sentencias condicionales
let num = 25;
if(num<10){
    console.log("Menor a 10");
} else if(num<20){
    console.log("Menor a 20");
} else{
    console.log("Mayor que 20");
}

// switch-case
let sabor = "Mango";
switch(sabor){
    case "Mango": console.log("El sabor es mango");
                     break;
    case "Manzana": console.log("El sabor es manzana");
                    break;
    default: console.log("El sabor es sandia");
}

// Sentencias repetitiva
let i;
for(i=1; i<=10; i++){
    console.log(i);
}

// while
i = 0;
while(i<5){
    console.log("FES");
    i++;
}

// do-while
i=0;
do{
    console.log("Acatlan");
    i++;
} while(i<6);

/* Cadenas */
let escuela = "FES Acatlan";
let dependencia = "UNAM"

// Concatenar
console.log(escuela + " " + dependencia);

// Plantillas Literales
console.log(`${escuela} ${dependencia}`);

// Las cadenas son inmutables
escuela[0] = 'M';
console.log(escuela); 

escuela = "FES Iztacala";
console.log(escuela); 

// Arreglos
let arr = [1, 2, 3, 4, 5];
console.log(arr);
console.log(arr.length);

// Los arreglo son mutables
arr[3] = "Koala";
console.log(arr);

let biarray = [arr, [34, true, "Juan"]];
console.log(biarray.length);

// Acceder a un elemento de un arreglo bidimensial
console.log(biarray[1][2]);