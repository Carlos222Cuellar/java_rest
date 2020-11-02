/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sv.edu.uesocc.ingenieria.prn335_2017.web.rest;

import java.io.Serializable;
import java.util.List;
import javax.annotation.PostConstruct;
import javax.inject.Named;
import javax.faces.view.ViewScoped;
import javax.ws.rs.client.Client;
import javax.ws.rs.client.ClientBuilder;
import javax.ws.rs.client.Entity;
import javax.ws.rs.core.GenericType;
import javax.ws.rs.core.MediaType;
import org.primefaces.event.SelectEvent;
import sv.edu.uesocc.ingenieria.prn335_2017.datos.definiciones.TipoPaso;

/**
 *
 * @author carlos
 */
@Named(value = "TipoPasoBean")
@ViewScoped
public class TipoPasoClient implements Serializable {

    private final Client cliente;
    private static final String BASE_URI = "http://localhost:8080/parcial3server-1.0-SNAPSHOT/parcial03/";
    List<TipoPaso> listaTipoPaso;
    TipoPaso tipopasoEntity;
    boolean btnVisible = false;

    public TipoPasoClient() {
        cliente = ClientBuilder.newClient();
    }
    
    /**
     * Este metodo sirve sirve para que se inicie todo despues de cargar los form.
     */
    @PostConstruct
    public void init() {
        this.tipopasoEntity = new TipoPaso();
        llenarTabla();

    }

    /**
     * Este metodo sirve para llenar la lista que se ocupara en la vista.
     */
    public void llenarTabla() {
        reset();
        try {
            listaTipoPaso = cliente
                    .target(BASE_URI)
                    .path("TipoPaso")
                    .request(MediaType.APPLICATION_JSON)
                    .get(new GenericType<List<TipoPaso>>() {
                    });
        } catch (Exception e) {
            System.out.println("ex: " + e);
        }
    }

    /**
     * Este metodo sirve para crear un nuevo registro. 
     * @return
     */
    public TipoPaso crearReg() {
        System.out.println("CREAR");
        if (tipopasoEntity != null && tipopasoEntity.getIdTipoPaso()== null) {
            try {
                TipoPaso salida = cliente.target(BASE_URI)
                        .path("TipoPaso")
                        .request(MediaType.APPLICATION_JSON)
                        .post(Entity.entity(tipopasoEntity, MediaType.APPLICATION_JSON), TipoPaso.class);
                if (salida != null && salida.getIdTipoPaso()!= null) {
                    llenarTabla();
                    return salida;
                }
            } catch (Exception e) {
                System.out.println("ex: " + e);
            }
        }
        return null;
    }

    /**
     * Este metodo sirve para editar un nuevo registro.
     * @return
     */
    public TipoPaso editarReg() {
        System.out.println("Editar");
        if (tipopasoEntity != null) {
            try {
                TipoPaso salida = cliente.target(BASE_URI)
                        .path("TipoPaso")
                        .request(MediaType.APPLICATION_JSON)
                        .put(Entity.entity(tipopasoEntity, MediaType.APPLICATION_JSON), TipoPaso.class);
                    llenarTabla();
                    return salida;
            } catch (Exception e) {
                System.out.println("ex: " + e);
            }
        }else{
            System.out.println("ALGO NULO");
        }
        return null;
    }

    /**
     * Este metodo sirve para eliminar un nuevo registro.
     * @return
     */
    public TipoPaso eliminarReg() {
        System.out.println("Eliminar");
        if (tipopasoEntity != null) {
            try {
                TipoPaso salida = cliente.target(BASE_URI)
                        .path("TipoPaso")
                        .path(tipopasoEntity.getIdTipoPaso().toString())
                        .request(MediaType.APPLICATION_JSON)
                        .delete(TipoPaso.class);
                    llenarTabla();
                    return salida;
            } catch (Exception e) {
                System.out.println("ex: " + e);
            }
        }else{
            System.out.println("ALGO NULO");
        }
        return null;
    }
    
    /**
     * Este metodo sirve para reiniciar la entity
     */
    public void reset() {
        System.out.println("RESET");
        tipopasoEntity = new TipoPaso();
    }

    // <editor-fold defaultstate="collapsed" desc="Getters y Setters">
    public void onRowSelect(SelectEvent event) {
        btnVisible = true;
    }

    public void btnCancelar() {
        tipopasoEntity = new TipoPaso();
        btnVisible = false;
    }

    public List<TipoPaso> getListaTipoPaso() {
        return listaTipoPaso;
    }

    public void setListaTipoPaso(List<TipoPaso> listaTipoPaso) {
        this.listaTipoPaso = listaTipoPaso;
    }

    public boolean isBtnVisible() {
        return btnVisible;
    }

    public void setBtnVisible(boolean btnVisible) {
        this.btnVisible = btnVisible;
    }

    public TipoPaso getTipoPasoEntity() {
        return tipopasoEntity;
    }

    public void setTipoPasoEntity(TipoPaso tipopasoEntity) {
        this.tipopasoEntity = tipopasoEntity;
    }
    // </editor-fold>

}
