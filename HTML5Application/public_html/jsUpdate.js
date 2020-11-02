$(document).ready(function () {
    capturarInfo();
    capturarInfo2();
});

function capturarInfo() {
    alert("BIENVENIDOS AL CLIENTE JAVASCRIPT ACTUALIZAR");
    $.ajax({
        type: "UPDATE",
        dataType: "json",
        contentType: "application/json; charset=utf-8",
        url: "http://localhost:8080/parcial3server-cliente-1.0-SNAPSHOT/parcial3/TipoPaso",
        data:  [],
        error: function (xhr, status) { // error callback
            alert("error " + xhr.responseText + " " + status.responseText);
        },
        success: function (data) {
            var d = data;
            alert("Conexion exitosa");
        }
    });
}


function capturarInfo2() {
    alert("BIENVENIDOS AL CLIENTE JAVASCRIPT ACTUALIZAR");
    $.ajax({
        type: "UPDATE",
        dataType: "json",
        contentType: "application/json; charset=utf-8",
        url: "http://localhost:8080/parcial3server-cliente-1.0-SNAPSHOT/parcial3/Paso",
        data:  [],
        error: function (xhr, status) { // error callback
            alert("error " + xhr.responseText + " " + status.responseText);
        },
        success: function (data) {
            var d = data;
            alert("Conexion exitosa");
        }
    });
}