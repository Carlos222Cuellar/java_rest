/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sv.edu.uesocc.ingenieria.prn335_2017.web.rest;

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
import sv.edu.uesocc.ingenieria.prn335_2017.datos.acceso.TipoPasoFacadeLocal;
import sv.edu.uesocc.ingenieria.prn335_2017.datos.definiciones.TipoPaso;

/**
 *
 * @author carlos
 */
@Path("TipoPaso")
public class TipoPasoRest {
     @EJB
    TipoPasoFacadeLocal tipopasoFacade;

    @GET
    @Produces(MediaType.APPLICATION_JSON)
    public List<TipoPaso> findAll() {
        try {
            if (tipopasoFacade != null) {
                return tipopasoFacade.findAll();
            }
        } catch (Exception e) {
            System.out.println("ex: " + e);
        }

        return Collections.EMPTY_LIST;
    }

    @GET
    @Path("{inicio}/{tamanio}")
    @Produces(MediaType.APPLICATION_JSON)
    public List<TipoPaso> findRange(
            @PathParam("inicio") @DefaultValue("0") int inicio,
            @PathParam("tamanio") @DefaultValue("10") int tamanio) {
        try {
            if (tipopasoFacade != null) {
                return tipopasoFacade.findRange(inicio, tamanio);
            }
        } catch (Exception e) {
            System.out.println("ex: " + e);
        }
        return Collections.EMPTY_LIST;
    }

    @GET
    @Path("{id}")
    @Produces(MediaType.APPLICATION_JSON)
    public TipoPaso findById(
            @PathParam("id") int id) {
        try {
            if (tipopasoFacade != null) {
                return tipopasoFacade.find(id);
            }
        } catch (Exception e) {
            System.out.println("ex: " + e);
        }
        return new TipoPaso();
    }
    
    @POST
    @Produces(MediaType.APPLICATION_JSON)
    @Consumes(MediaType.APPLICATION_JSON)
    public TipoPaso crear(TipoPaso reg){
        if(reg != null && reg.getIdTipoPaso()== null){
            try {
                if (tipopasoFacade != null) {
                    TipoPaso tp = tipopasoFacade.crear(reg);
                    if(tp!=null){
                        return tp;
                    }
                }
            } catch (Exception e) {
                System.out.println("ex: "+e);
            }
        }
        return new TipoPaso();
    }
    
    @PUT
    @Produces(MediaType.APPLICATION_JSON)
    @Consumes(MediaType.APPLICATION_JSON)
    public TipoPaso editar(TipoPaso reg){
        if(reg != null){
            try {
                if (tipopasoFacade != null) {
                    TipoPaso tp = tipopasoFacade.editar(reg);
                    if(tp!=null){
                        return tp;
                    }
                }
            } catch (Exception e) {
                System.out.println("ex: "+e);
            }
        }
        return new TipoPaso();
    }
    
    @DELETE
    @Path("{id}")
    @Produces(MediaType.APPLICATION_JSON)
    @Consumes(MediaType.APPLICATION_JSON)
    public TipoPaso eliminar(@PathParam("id") int id){
        if(id > 0){
            try {
                if (tipopasoFacade != null) {
                    TipoPaso tp = tipopasoFacade.remover(tipopasoFacade.find(id));
                    if(tp!=null){
                        return tp;
                    }
                }
            } catch (Exception e) {
                System.out.println("ex: "+e);
            }
        }
        return new TipoPaso();
    }
    
}
