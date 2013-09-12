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

import com.sigepro.web.dao.AbonoDAO;
import com.sigepro.web.model.dto.ClienteAbonoDTO;
import com.sigepro.web.model.pojo.Abono;
import com.sigepro.web.model.pojo.ClienteAbono;


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
public class AbonoDAOImpl extends HibernateDaoSupport implements AbonoDAO {

	Logger LOG = LoggerFactory.getLogger(AbonoDAOImpl.class);

    public Integer saveAbono(Abono abono) throws DataAccessException {
    	LOG.info("AbonoDAOImpl.saveAbono()");
        getHibernateTemplate().saveOrUpdate(abono);
        return abono.getIdabono();
    }
    
    public boolean saveAsignClientAbono(ClienteAbono cliAbono) throws DataAccessException {
    	LOG.info("AbonoDAOImpl.saveAsignClientAbono()");
        getHibernateTemplate().saveOrUpdate(cliAbono);
        return true;
    }

    public List<Abono> getAbonosByName(final String name, final String fieldSort, final String sort, final int maxResult) throws DataAccessException {

        List<Abono> listResult = new ArrayList<Abono>();
        HibernateCallback callback = new HibernateCallback() {

            public Object doInHibernate(Session session) throws HibernateException, SQLException {

            	String orderBy = "A.nombre";
            	if (!fieldSort.contentEquals("")){
            		orderBy = "A."+fieldSort;
            	}
                Query query = session.createQuery(
                        "select A "
                                + " FROM Abono as A" + " WHERE LOWER(A.nombre) LIKE '%" + name.toLowerCase()
                                + "%' order by "+orderBy+" "+sort).setMaxResults(maxResult);

                List result = query.list();
                return result;

            }
        };

        listResult = (List<Abono>) this.getHibernateTemplate().execute(callback);
        LOG.info("Cantidad:"+listResult.size());
        return listResult;
    }
    
    
    public List<Abono> getAbonosByParameters(final String name,final String lastName, final String cuit, final String score,final String fieldSort, final String sort) throws DataAccessException {

        List<Abono> listResult = new ArrayList<Abono>();
        HibernateCallback callback = new HibernateCallback() {

            public Object doInHibernate(Session session) throws HibernateException, SQLException {

            	Criteria criteria = session.createCriteria(Abono.class);
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

        listResult = (List<Abono>) this.getHibernateTemplate().execute(callback);
        LOG.info("Cantidad:"+listResult.size());
        return listResult;
    }


//    @SuppressWarnings("unchecked")
//    public Cliente loadClientByName(final String name) throws DataAccessException {
//
//        List<Cliente> lstCliente = getHibernateTemplate().find(
//                "select C from Cliente as C where C.nombre='" + name + "'");
//
//        if (lstCliente.isEmpty()) {
//            return null;
//        } else
//            return lstCliente.get(0);
//    }
//    
    
    @SuppressWarnings("unchecked")
    public Abono loadAbonoById(final Integer idAbono) throws DataAccessException {
    	LOG.info("AbonoDAOImpl.loadAbonoById()");
        List<Abono> lstResult = getHibernateTemplate().find(
                "select A from Abono as A where A.idabono=" + idAbono);

        if (lstResult.isEmpty()) {
            return null;
        } else
            return lstResult.get(0);
    }
        
    public List<ClienteAbonoDTO> getListClientAbonoDTO(final int idClient)
            throws DataAccessException {
        List<ClienteAbonoDTO> listResult = new ArrayList<ClienteAbonoDTO>();
        HibernateCallback callback = new HibernateCallback() {

            public Object doInHibernate(Session session) throws HibernateException, SQLException {

                Query query = session.createQuery(
                        "select new com.sigepro.web.model.dto.ClienteAbonoDTO(A.idabono,C.idcliente,A.nombre,CA.alta,CA.baja,CA.descripcion) "
                                + " FROM Cliente as C, Abono A, ClienteAbono CA" + " WHERE C.idcliente="+idClient+" and CA.id.idcliente=C.idcliente and CA.id.idabono=A.idabono");
                List result = query.list();
                return result;
            }
        };
        listResult = (List<ClienteAbonoDTO>) this.getHibernateTemplate().execute(callback);
        return listResult;
    }
    
    
     
    public void deleteAbono(Abono abono) throws DataAccessException {
    	LOG.info("AbonoDAOImpl.deleteAbono()");
        getHibernateTemplate().delete(abono);
    }
    
    public void deleteAsignAbono(ClienteAbono cliAbono) throws DataAccessException {
    	LOG.info("AbonoDAOImpl.deleteAsignAbono()");
        getHibernateTemplate().delete(cliAbono);
    }
}
