/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sv.edu.uesocc.ingenieria.prn335_2017.datos.acceso;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import sv.edu.uesocc.ingenieria.prn335_2017.datos.definiciones.Paso;
/**
 *
 * @author carlos
 */
@Stateless
public class PasoFacade extends AbstractFacade<Paso> implements PasoFacadeLocal {

    @PersistenceContext(unitName = "sv.edu.uesocc.ingenieria.prn335_2017_parcial3server-cliente_war_1.0-SNAPSHOTPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public PasoFacade() {
        super(Paso.class);
    }

}
