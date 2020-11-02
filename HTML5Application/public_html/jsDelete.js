$(document).ready(function () {
    capturarInfo();
});

function capturarInfo() {
    alert("BIENVENIDOS AL CLIENTE JAVASCRIPT BORRAR");
    $.ajax({
        type: "DELETE",
        dataType: "json",
        contentType: "application/json; charset=utf-8",
        url: "id",
      data:[],
        error: function (xhr, status) { // error callback
            alert("error " + xhr.responseText + " " + status.responseText);
        },
        success: function (data) {
            var d = data;
            alert("Conexion exitosa");
        }
    });
}