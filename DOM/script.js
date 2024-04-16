// console.log(document);

document.addEventListener('DOMContentLoaded', function(){
    const formulario = document.getElementById('formulario');
    // console.log(formulario);
    const respuesta = document.getElementById('respuesta');
    // evento submit
    document.addEventListener('submit', function(event){
        event.preventDefault();
        const nombre = formulario.nombre.value;
        const apePat = formulario.apePat.value;
        const apeMat = formulario.apeMat.value;
        const genero = formulario.genero.value;
        const pais = formulario.pais.value;
        const sugerencia = formulario.sugerencia.value;
        let lenguajes = [];
        const checkboxes = formulario.lenguajes;
        checkboxes.forEach(function(checkbox){
            if(checkbox.checked){
                lenguajes.push(checkbox.value);
            }
        });

        respuesta.innerHTML = `
            <p><b>Nombre(s)</b>: ${nombre}</p>
            <p><b>Apellido Paterno:</b>: ${apePat}</p>
            <p><b>Apellido Materno:</b>: ${apeMat}</p>
            <p><b>Genero</b>: ${genero}</p>
            <p><b>Lneguajes Seleccionados</b>: ${lenguajes.join(', ')}</p>
            <p><b>Pais</b>: ${pais}</p>
            <p><b>Sugerencia</b>: ${sugerencia}</p>
        `
    })

});