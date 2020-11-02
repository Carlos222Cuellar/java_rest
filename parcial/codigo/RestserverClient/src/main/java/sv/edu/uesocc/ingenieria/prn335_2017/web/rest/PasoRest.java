/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sv.edu.uesocc.ingenieria.prn335_2017.web.rest;

import java.io.Serializable;
import java.util.Collections;
import java.util.List;
import javax.ejb.EJB;
import javax.ws.rs.Consumes;
import javax.ws.rs.DELETE;
import javax.ws.rs.DefaultValue;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.PUT;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import sv.edu.uesocc.ingenieria.prn335_2017.datos.acceso.PasoFacadeLocal;
import sv.edu.uesocc.ingenieria.prn335_2017.datos.definiciones.Paso;

/**
 *
 * @author carlos
 */
@Path("Paso")
public class PasoRest implements Serializable{
    
     @EJB
    PasoFacadeLocal pasoFacade;

    @GET
    @Produces(MediaType.APPLICATION_JSON)
    public List<Paso> findAll() {
        try {
            if (pasoFacade != null) {
                return pasoFacade.findAll();
            }
        } catch (Exception e) {
            System.out.println("ex: " + e);
        }

        return Collections.EMPTY_LIST;
    }

    @GET
    @Path("{inicio}/{tamanio}")
    @Produces(MediaType.APPLICATION_JSON)
    public List<Paso> findRange(
            @PathParam("inicio") @DefaultValue("0") int inicio,
            @PathParam("tamanio") @DefaultValue("10") int tamanio) {
        try {
            if (pasoFacade != null) {
                return pasoFacade.findRange(inicio, tamanio);
            }
        } catch (Exception e) {
            System.out.println("ex: " + e);
        }
        return Collections.EMPTY_LIST;
    }

    @GET
    @Path("{id}")
    @Produces(MediaType.APPLICATION_JSON)
    public Paso findById(
            @PathParam("id") int id) {
        try {
            if (pasoFacade != null) {
                return pasoFacade.find(id);
            }
        } catch (Exception e) {
            System.out.println("ex: " + e);
        }
        return new Paso();
    }
    
    @POST
    @Produces(MediaType.APPLICATION_JSON)
    @Consumes(MediaType.APPLICATION_JSON)
    public Paso crear(Paso reg){
        if(reg != null && reg.getIdPaso()== null){
            try {
                if (pasoFacade != null) {
                    Paso p = pasoFacade.crear(reg);
                    if(p!=null){
                        return p;
                    }
                }
            } catch (Exception e) {
                System.out.println("ex: "+e);
            }
        }
        return new Paso();
    }
    
    @PUT
    @Produces(MediaType.APPLICATION_JSON)
    @Consumes(MediaType.APPLICATION_JSON)
    public Paso editar(Paso reg){
        if(reg != null){
            try {
                if (pasoFacade != null) {
                    Paso p = pasoFacade.editar(reg);
                    if(p!=null){
                        return p;
                    }
                }
            } catch (Exception e) {
                System.out.println("ex: "+e);
            }
        }
        return new Paso();
    }
    
    @DELETE
    @Path("{id}")
    @Produces(MediaType.APPLICATION_JSON)
    @Consumes(MediaType.APPLICATION_JSON)
    public Paso eliminar(@PathParam("id") int id){
        if(id > 0){
            try {
                if (pasoFacade != null) {
                    Paso p = pasoFacade.remover(pasoFacade.find(id));
                    if(p!=null){
                        return p;
                    }
                }
            } catch (Exception e) {
                System.out.println("ex: "+e);
            }
        }
        return new Paso();
    }

}


    

