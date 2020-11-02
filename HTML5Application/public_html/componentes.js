$(document).ready(function() {
    inicializar();
    llenarTipoPaso();
    llenarPaso();
});

function inicializar() {
    
    $('#btnBotton1paso').puibutton({
        click: crearTipoPaso
    });
    $('#btnBotton2paso').puibutton();
    $('#btnBotton3paso').puibutton();
    $('#btnBotton4paso').puibutton();
    
    $('#btnBotton5tpaso').puibutton();
    $('#btnBotton6tpaso').puibutton();
    $('#btnBotton7tpaso').puibutton();
    $('#btnBotton8tpaso').puibutton();
    
     
    $('#txtIdPaso').puiinputtext();
    $('#txtNombrePaso').puiinputtext();
    $('#txtDescripcionPaso').puiinputtextarea();
  
    $('#txtNombreTipoPaso').puiinputtext(); 
    $('#txtIdTipoPaso').puiinputtext();
    $('#chkActivoTipoPaso').puicheckbox();
    $('#txtDescripcionTipoPaso').puiinputtextarea();
    $('#single').puiselectbutton({
    
});
}

function actualizarTabla() {
    llenarTabla();
}

function llenarTipoPaso() {
    $('#tblTipoPaso').puidatatable({
        columns: [
            {field: 'idTipoPaso', headerText: 'ID' },
            {field: 'nombre', headerText: 'Nombre' },
            {field: 'activo', headerText: 'Activo' },
            {field: 'descripcion', headerText: 'Descripción' }
        ],
        
        datasource: function(callback) {
            $.ajax({
                type: 'GET',
                url: 'http://localhost:8080/parcial3server-cliente-1.0-SNAPSHOT/parcial3/TipoPaso',
                dataType: 'json',
                context: this,
                success: function(response) {
                    callback.call(this, response);
                }
            });
        }
    });
}


function actualizarTabla() {
    llenarTabla();
   
}
function llenarPaso() {
    $('#tblPaso').puidatatable({
        columns: [
            {field: 'idPaso', headerText: 'ID' },
            {field: 'nombre', headerText: 'Nombre' },
          
            {field: 'descripcion', headerText: 'Descripción' }
            
        ],
        
        datasource: function(callback) {
            $.ajax({
                type: 'GET',
                url: 'http://localhost:8080/parcial3server-cliente-1.0-SNAPSHOT/parcial3/TipoPaso',
                dataType: 'json',
                context: this,
                success: function(response) {
                    callback.call(this, response);
                }
            });
        }
    });
}
