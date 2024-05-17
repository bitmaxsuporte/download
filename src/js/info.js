window.onload = function() {
    var xhr = new XMLHttpRequest();
    xhr.onreadystatechange = function() {
        if (xhr.readyState === 4 && xhr.status === 200) {
            var texto = xhr.responseText;
            exibirPopup(texto);
        }
    };
    xhr.open("GET", "./changelog.txt", true);
    xhr.send();
};

function exibirPopup(texto) {
    alert(texto);
}
