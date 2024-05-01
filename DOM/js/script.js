document.addEventListener('DOMContentLoaded', function () {
    const form = document.getElementById('myForm');
    const textoInput = document.getElementById('texto');
    const numeroInput = document.getElementById('numero');
    const textoError = document.getElementById('textoError');
    const numeroError = document.getElementById('numeroError');

    form.addEventListener('submit', function (event) {
        event.preventDefault(); // Evita que el formulario se envíe

        // Lógica de validación aquí

        if (textoInput.value.trim() === '') {
            showErrorMessage(textoError, 'Por favor, ingresa un texto.');
        } else if(/\d/.test(textoInput.value)) {
            showErrorMessage(textoError, 'El texto no debe contener números.');
        } else {
            textoError.textContent = '';
        }

        const numeroValue = parseInt(numeroInput.value);
        if (isNaN(numeroValue) || numeroValue < 1 || numeroValue > 100) {
            showErrorMessage(numeroError, 'Por favor, ingresa un número válido entre 1 y 100.');
        } else {
            numeroError.textContent = '';
        }

        if (textoError.textContent === '' && numeroError.textContent === '') {
            alert('Los datos han sido enviados correctamente.');
            // Aquí podría añadirse el código para enviar los datos a través de AJAX, etc.
        }
    });

    // Validar en tiempo real mientras el usuario escribe
    textoInput.addEventListener('input', function () {
        if (textoInput.value.trim() === '') {
            showErrorMessage(textoError, 'Por favor, ingresa un texto.');
        } else if(/\d/.test(textoInput.value)) {
            showErrorMessage(textoError, 'El texto no debe contener números.');
        } else {
            textoError.textContent = '';
        }
    });

    numeroInput.addEventListener('input', function () {
        const numeroValue = parseInt(numeroInput.value);
        if (isNaN(numeroValue) || numeroValue < 1 || numeroValue > 100) {
            showErrorMessage(numeroError, 'Por favor, ingresa un número válido entre 1 y 100.');
        } else {
            numeroError.textContent = '';
        }
    });

    // Función para mostrar mensajes de error por un tiempo limitado
    function showErrorMessage(element, message) {
        element.textContent = message;
        setTimeout(function () {
            element.textContent = '';
        }, 5000); // 5000 milisegundos = 5 segundos
    }

    // Cambiar el fondo cuando el campo está enfocado
    textoInput.addEventListener('focus', function () {
        textoInput.style.backgroundColor = 'lightblue';
    });

    numeroInput.addEventListener('focus', function () {
        numeroInput.style.backgroundColor = 'lightblue';
    });

    // Restaurar el fondo cuando el campo pierde el enfoque
    textoInput.addEventListener('blur', function () {
        textoInput.style.backgroundColor = 'white';
    });

    numeroInput.addEventListener('blur', function () {
        numeroInput.style.backgroundColor = 'white';
    });
});