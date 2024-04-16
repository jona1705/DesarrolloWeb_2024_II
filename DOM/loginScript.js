// console.log(document);

document.addEventListener('DOMContentLoaded', function(){
    const formulario = document.getElementById('formulario');
    const respuesta = document.getElementById('respuesta');
    document.addEventListener('submit', function(event){
        event.preventDefault();
        const usuario = formulario.usuario.value;
        // console.log(usuario);
        const password = formulario.pass.value;
        // console.log(password);
        if(usuario === "jona" && password === "12345"){
            respuesta.innerHTML = "Bienvenido";
        } else{
            respuesta.innerHTML = "Usuario o Password Inválidos";
        }
    })
});