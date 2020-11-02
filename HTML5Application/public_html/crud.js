function crearTipoPaso() {
    alert("BIENVENIDOS AL CLIENTE JAVASCRIPT ");
    var data = {};
    console.log($("#txtNombreTipoPaso").val());
    data["nombre"] = $("#txtNombreTipoPaso").val();
    data["descripcion"] = $("#txtDescripcionTipoPaso").val();
    console.log(JSON.stringify(data));
    
    var parametros = [];
    parametros.push("entidad", JSON.stringify(data));
    $.ajax({
        type: "POST",
        dataType: "json",
        contentType: "application/json; charset=utf-8",
        url: "http://localhost:8080/parcial3server-cliente-1.0-SNAPSHOT/parcial3/TipoPaso",
        data: { entity :{"activo":true,"descripcion":"esto solo para probar","idTipoPaso":7,"nombre":"hola munndo1"}},
        error: function (xhr, status) { // error callback
            alert("error " + xhr.responseText + " " + status.responseText);
        },
        success: function (data) {
            alert("exitoso");
            alert(data[0].nombre);
        }
    });
}




function crearPaso() {
    alert("BIENVENIDOS AL CLIENTE JAVASCRIPT ");
    var data = {};
    console.log($("#txtComentarioPaso").val());
    data["comentario"] = $("#txtComentarioPaso").val();
    //data["descripcion"] = $("#txtDescripcionTipoPaso").val();
    console.log(JSON.stringify(data));
    
    var parametros = [];
    parametros.push("entidad", JSON.stringify(data));
    $.ajax({
        type: "POST",
        dataType: "json",
        contentType: "application/json; charset=utf-8",
        url: "http://localhost:8080/parcial3server-cliente-1.0-SNAPSHOT/parcial3/Paso",
        data: { entity :{"activo":true,"descripcion":"esto solo para probar","idTipoPaso":7,"nombre":"hola munndo1"}},
        error: function (xhr, status) { // error callback
            alert("error " + xhr.responseText + " " + status.responseText);
        },
        success: function (data) {
            alert("exitoso");
            alert(data[0].nombre);
        }
    });
}