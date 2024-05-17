document.addEventListener('DOMContentLoaded', function(){
    document.getElementById('ingresar_usuario_form').addEventListener('submit', function(event){
        event.preventDefault();
        ingresar_usuario();
    })
})

function ingresar_usuario(){
    const nombre = document.getElementById('nombre').value;
    fetch('ingresar.php', {
        method: 'POST',
        headers:{
            "Content-Type": "application/x-www-form-urlencoded"
        },
        body: "nombre="+ encodeURIComponent(nombre)
    })
    .then(function(response){
        return response.text();
    })
    .then(function(info){
        alert(info);
        document.getElementById('nombre').value = "";
    })
    .catch(function(error){
        alert("Error Porcesamiento");
        //alert(error);
    })
}