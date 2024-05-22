import express from 'express';
import fs from 'fs';

const app = express();

const readData = () => {
    try{
        const data = fs.readFileSync("./bd.json");
        //console.log(data);
        //console.log(JSON.parse(data));
        return JSON.parse(data);
    } catch(error){
        console.log(error);
    }  
}

readData();


//Ejemplo basico de ejecucion del servidor
app.get("/", (req, res)=>{
    res.send("Bienvenido a mi primera API");
})

app.listen(3000, ()=>{
    console.log('Servidor escuchando en el puerto 3000');
});

/* Crear endpoints*/
app.get("/books", (req,res) => {
    const data = readData();
    res.json(data.books);
})