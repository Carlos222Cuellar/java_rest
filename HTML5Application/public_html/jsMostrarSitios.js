$(document).ready(function () {
    capturarInfo();
    capturarInfo2();
});

function capturarInfo() {
    alert("BIENVENIDOS AL CLIENTE JAVASCRIPT ");
    $.ajax({
        type: "GET",
        dataType: "json",
        contentType: "application/json; charset=utf-8",
        url: "http://localhost:8080/parcial3server-cliente-1.0-SNAPSHOT/parcial3/TipoPaso",
        error: function (xhr, status) { // error callback
            alert("error " + xhr.responseText + " " + status.responseText);
        },
        success: function (data) {
            alert("exitoso");
            alert(data[0].nombre);
        }
    });
}



function capturarInfo2() {
    alert("BIENVENIDOS AL CLIENTE JAVASCRIPT ");
    $.ajax({
        type: "GET",
        dataType: "json",
        contentType: "application/json; charset=utf-8",
        url: "http://localhost:8080/parcial3server-cliente-1.0-SNAPSHOT/parcial3/Paso",
        error: function (xhr, status) { // error callback
            alert("error " + xhr.responseText + " " + status.responseText);
        },
        success: function (data) {
            alert("exitoso");
            alert(data[0].nombre);
        }
    });
}