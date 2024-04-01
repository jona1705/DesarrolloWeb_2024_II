// console.log(document);

document.addEventListener('DOMContentLoaded', function(){
    const formulario = document.getElementById('formulario');
    // console.log(formulario);
    const respuesta = document.getElementById('respuesta');
    // evento submit
    document.addEventListener('submit', function(event){
        event.preventDefault();
        const usuario = formulario.usuario.value;
        // console.log(usuario);
        const password = formulario.pass.value;
        // console.log(password);
        const sugerencia = formulario.sugerencia.value;
        // Genero
        const genero = formulario.genero.value;
        respuesta.innerHTML = `
            <p><b>Usuario</b>: ${usuario}</p>
            <p><b>Password</b>: ${password}</p>
            <p><b>Genero</b>: ${genero}</p>
            <p><b>Motivo de queja</b>: ${sugerencia}</p>
        `
    })

});