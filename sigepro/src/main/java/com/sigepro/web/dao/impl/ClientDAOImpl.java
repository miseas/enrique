/***************************************************************************************
 * No part of this program may be photocopied reproduced or translated to another program
 * language without prior written consent of Matias E. Iseas
 **************************************************************************************/
package com.sigepro.web.dao.impl;



import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.dao.DataAccessException;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.sigepro.web.dao.ClientDAO;
import com.sigepro.web.model.pojo.CatDnitipo;
import com.sigepro.web.model.pojo.Cliente;
import com.sigepro.web.model.pojo.EstadoCli;
import com.sigepro.web.model.pojo.Localidad;


/**
 * TODO comment<br>
 * <br>
 * <b>Change log:</b>
 * <ul>
 * <li>1.0 20/02/2013 - Xpost - initial version</li>
 * </ul>
 * 
 * @author Xpost
 * @version 1.0
 */
public class ClientDAOImpl extends HibernateDaoSupport implements ClientDAO {

	Logger LOG = LoggerFactory.getLogger(ClientDAOImpl.class);

    public Integer saveClient(Cliente cliente) throws DataAccessException {
    	LOG.info("ClientDAOImpl.saveClient()");
        getHibernateTemplate().saveOrUpdate(cliente);
        return cliente.getIdcliente();
    }

    public List<Cliente> getClientsByName(final String name, final String fieldSort, final String sort, final int maxResult) throws DataAccessException {

        List<Cliente> listResult = new ArrayList<Cliente>();
        HibernateCallback callback = new HibernateCallback() {

            public Object doInHibernate(Session session) throws HibernateException, SQLException {

            	String orderBy = "C.nombre";
            	if (!fieldSort.contentEquals("")){
            		orderBy = "C."+fieldSort;
            	}
                Query query = session.createQuery(
                        "select C "
                                + " FROM Cliente as C" + " WHERE LOWER(C.nombre) LIKE '%" + name.toLowerCase()
                                + "%'" + " or LOWER(C.apellido) LIKE '%" + name.toLowerCase()+ "%' order by "+orderBy+" "+sort).setMaxResults(maxResult);

                List result = query.list();
                return result;

            }
        };

        listResult = (List<Cliente>) this.getHibernateTemplate().execute(callback);
        LOG.info("Cantidad:"+listResult.size());
        return listResult;
    }
    
    
    public List<Cliente> getClientsByParameters(final String name,final String lastName, final String cuit, final String score,final String fieldSort, final String sort) throws DataAccessException {

        List<Cliente> listResult = new ArrayList<Cliente>();
        HibernateCallback callback = new HibernateCallback() {

            public Object doInHibernate(Session session) throws HibernateException, SQLException {

            	Criteria criteria = session.createCriteria(Cliente.class);
            	if (name!=null){
            		criteria.add( Restrictions.like("nombre", name+"%") );
            	}          	
				if (lastName!=null){
            		criteria.add( Restrictions.like("apellido", lastName+"%") );
            	}
				if (cuit!=null){
            		criteria.add( Restrictions.eq( "cuit", cuit ));
            	}
				if (score!=null){
            		criteria.add( Restrictions.eq( "puntuacion", new Integer(score) ));
            	}

				if (!fieldSort.isEmpty()){
					if (sort.contains("asc")){
						criteria.addOrder(Order.asc(fieldSort));
					}						
					else{
						criteria.addOrder(Order.desc(fieldSort));
					}
				}
				return criteria.list();
            }
        };

        listResult = (List<Cliente>) this.getHibernateTemplate().execute(callback);
        LOG.info("Cantidad:"+listResult.size());
        return listResult;
    }


    @SuppressWarnings("unchecked")
    public Cliente loadClientByName(final String name) throws DataAccessException {

        List<Cliente> lstCliente = getHibernateTemplate().find(
                "select C from Cliente as C where C.nombre='" + name + "'");

        if (lstCliente.isEmpty()) {
            return null;
        } else
            return lstCliente.get(0);
    }
    
    
    @SuppressWarnings("unchecked")
    public Cliente loadClientById(final Integer idClient) throws DataAccessException {

        List<Cliente> lstCliente = getHibernateTemplate().find(
                "select C from Cliente as C where C.idcliente=" + idClient);

        if (lstCliente.isEmpty()) {
            return null;
        } else
            return lstCliente.get(0);
    }
    
    @SuppressWarnings("unchecked")
    public EstadoCli loadEstadoClientById(final Integer idEstadoClient) throws DataAccessException {

        List<EstadoCli> lstCliente = getHibernateTemplate().find(
                "select C from EstadoCli as C where C.idestadocli=" + idEstadoClient);

        if (lstCliente.isEmpty()) {
            return null;
        } else
            return lstCliente.get(0);
    }
    
    @SuppressWarnings("unchecked")
    public Localidad loadLocalidadById(final Integer idLocalidad) throws DataAccessException {

        List<Localidad> lstResults = getHibernateTemplate().find(
                "select C from Localidad as C where C.idlocalidad=" + idLocalidad);

        if (lstResults.isEmpty()) {
            return null;
        } else
            return lstResults.get(0);
    }
    
    @SuppressWarnings("unchecked")
    public List<Localidad> loadAllLocalidades() throws DataAccessException {

        List<Localidad> lstResults = getHibernateTemplate().find(
                "select C from Localidad as C");

        if (lstResults.isEmpty()) {
            return null;
        } else
            return lstResults;
    }
    @SuppressWarnings("unchecked")
    public List<CatDnitipo> loadAllTypeDni() throws DataAccessException {

        List<CatDnitipo> lstResults = getHibernateTemplate().find(
                "select T from CatDnitipo as T");

        if (lstResults.isEmpty()) {
            return null;
        } else
            return lstResults;
    }

    @SuppressWarnings("unchecked")
    public List<EstadoCli> loadAllClientState() throws DataAccessException {

        List<EstadoCli> lstResults = getHibernateTemplate().find(
                "select E from EstadoCli as E");

        if (lstResults.isEmpty()) {
            return null;
        } else
            return lstResults;
    }
    
    @SuppressWarnings("unchecked")
    public Integer loadLastClientId() throws DataAccessException {

        List<Integer> lstCliente = getHibernateTemplate().find(
                "select max(idcliente) FROM Cliente");

        if (lstCliente.isEmpty()) {
            return null;
        } else
            return lstCliente.get(0);
    }
    
    
    
    
    public void deleteClient(Cliente cliente) throws DataAccessException {
    	LOG.info("deleteClient()");
        getHibernateTemplate().delete(cliente);
    }
}
