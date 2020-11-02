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
import sv.edu.uesocc.ingenieria.prn335_2017.datos.definiciones.Paso;

/**
 *
 * @author carlos
 */
@Named(value = "PasoBean")
@ViewScoped
public class PasoClient implements Serializable {

    private final Client cliente;
    private static final String BASE_URI = "http://localhost:8080/parcial3server-1.0-SNAPSHOT/parcial03/";
    List<Paso> listaPaso;
    Paso pasoEntity;
    boolean btnVisible = false;

    public PasoClient() {
        cliente = ClientBuilder.newClient();
    }
    
    /**
     * Este metodo sirve sirve para que se inicie todo despues de cargar los form.
     */
    @PostConstruct
    public void init() {
        this.pasoEntity = new Paso();
        llenarTabla();

    }

    /**
     * Este metodo sirve para llenar la lista que se ocupara en la vista.
     */
    public void llenarTabla() {
        reset();
        try {
            listaPaso = cliente
                    .target(BASE_URI)
                    .path("Paso")
                    .request(MediaType.APPLICATION_JSON)
                    .get(new GenericType<List<Paso>>() {
                    });
        } catch (Exception e) {
            System.out.println("ex: " + e);
        }
    }

    /**
     * Este metodo sirve para crear un nuevo registro. 
     * @return
     */
    public Paso crearReg() {
        System.out.println("CREAR");
        if (pasoEntity != null && pasoEntity.getIdPaso()== null) {
            try {
                Paso salida = cliente.target(BASE_URI)
                        .path("Paso")
                        .request(MediaType.APPLICATION_JSON)
                        .post(Entity.entity(pasoEntity, MediaType.APPLICATION_JSON), Paso.class);
                if (salida != null && salida.getIdPaso()!= null) {
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
    public Paso editarReg() {
        System.out.println("Editar");
        if (pasoEntity != null) {
            try {
                Paso salida = cliente.target(BASE_URI)
                        .path("Paso")
                        .request(MediaType.APPLICATION_JSON)
                        .put(Entity.entity(pasoEntity, MediaType.APPLICATION_JSON), Paso.class);
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
    public Paso eliminarReg() {
        System.out.println("Eliminar");
        if (pasoEntity != null) {
            try {
                Paso salida = cliente.target(BASE_URI)
                        .path("Paso")
                        .path(pasoEntity.getIdPaso().toString())
                        .request(MediaType.APPLICATION_JSON)
                        .delete(Paso.class);
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
        pasoEntity = new Paso();
    }

    // <editor-fold defaultstate="collapsed" desc="Getters y Setters">
    public void onRowSelect(SelectEvent event) {
        btnVisible = true;
    }

    public void btnCancelar() {
        pasoEntity = new Paso();
        btnVisible = false;
    }

    public List<Paso> getListaPaso() {
        return listaPaso;
    }

    public void setListaPaso(List<Paso> listaPaso) {
        this.listaPaso = listaPaso;
    }

    public boolean isBtnVisible() {
        return btnVisible;
    }

    public void setBtnVisible(boolean btnVisible) {
        this.btnVisible = btnVisible;
    }

    public Paso getPasoEntity() {
        return pasoEntity;
    }

    public void setPasoEntity(Paso pasoEntity) {
        this.pasoEntity = pasoEntity;
    }
    // </editor-fold>

}
