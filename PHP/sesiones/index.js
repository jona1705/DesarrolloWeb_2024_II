document.getElementById('loginForma').addEventListener('submit', async function(event){
    event.preventDefault();

    const forma = new FormData(this); 
    const response = await fetch('login.php', {
        method: 'POST',
        body: forma
    });

    const data = await response.json();

    if(data.success){
        // alert("YEI");
        window.location.href = 'dashboard.php';
    } else{
        alert(data.mensaje);
    }
});