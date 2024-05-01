// Crear un objeto persona
let persona = {};
console.log(typeof persona)

persona.nombre = "Juan";
persona.edad = 12;

console.log(persona.nombre);
console.log(persona.edad)

// Crear otro objeto persona
let persona1 = {
    nombre : "Pedro",
    edad : 17,
    saludar: function(){
        console.log(`Hola soy ${this.nombre} y tengo ${this.edad} años`)
    }
}

console.log(persona1.nombre);
console.log(persona1.edad)
persona1.saludar();

// Generar diferentes instancias a partir de un objeto
function Person(nombre, edad){
    this.nombre = nombre;
    this.edad = edad;
    this.saludar =  function(){
        console.log(`Hola soy ${this.nombre} y tengo ${this.edad} años`)
    }
}

let obj1 = new Person("Jorge",56);
console.log(obj1.nombre)
console.log(obj1.edad)
obj1.saludar();
// Genera objetos
let obj2 = new Person("Maria",12);
let obj3 = new Person("Ramon",27);

console.log(Object.values(obj1))
console.log(Object.values(obj2))
console.log(Object.values(obj3))

// Los valores tambien pueden ser numericos
let objetos = {
    1: "🏈",
    2: "🏆",
    3: "🏋",
    4: "🏍"
}

console.log(objetos["1"])
console.log(objetos["2"])
console.log(objetos["3"])
console.log(objetos["4"])

let bolsa = {
    "Uno": 1,
    "Dos": "FES Acatlán",
    "Tres": [1, 2, 3],
    "Cuatro": obj2 = {
        1: "Desarrollo Web",
        2: "Ingles",
        3: "Calculo"
    }
}

console.log(typeof bolsa["Uno"])
console.log(typeof bolsa["Dos"])
console.log(typeof bolsa["Tres"])
console.log(typeof bolsa["Cuatro"])
console.log(bolsa["Cuatro"]["1"])

// Arreglo de objetos
let arreglo = [obj1, obj2, obj3];
console.log(arreglo[0].nombre);
console.log(arreglo[0].edad);
console.log(arreglo[1].nombre);
console.log(arreglo[1].edad);
console.log(arreglo[2].nombre);
console.log(arreglo[2].edad);
console.log(arreglo[2].saludar);