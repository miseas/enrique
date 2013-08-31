/***************************************************************************************
 * No part of this program may be photocopied reproduced or translated to another program
 * language without prior written consent of Matias E. Iseas
 **************************************************************************************/
package com.sigepro.web.dao.impl;



import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.dao.DataAccessException;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.sigepro.web.dao.VisitaDAO;
import com.sigepro.web.model.dto.VisitaDTO;
import com.sigepro.web.model.pojo.EstadoVis;
import com.sigepro.web.model.pojo.Visita;


/**
 * TODO comment<br>
 * <br>
 * <b>Change log:</b>
 * <ul>
 * <li>1.0 21/07/2013 - Xpost - initial version</li>
 * </ul>
 * 
 * @author Xpost
 * @version 1.0
 */
public class VisitaDAOImpl extends HibernateDaoSupport implements VisitaDAO {

	Logger LOG = LoggerFactory.getLogger(VisitaDAOImpl.class);

    public Long saveVisita(Visita visita) throws DataAccessException {
    	LOG.info("VisitaDAOImpl.saveVisita()");
        getHibernateTemplate().saveOrUpdate(visita);
        return visita.getIdvisita();
    }    
    
//    public List<Visita> getVisitasByParameters(final Date initialDate,final Date finalDate, final Integer clientID, final String direction, final String fieldSort, final String sort) throws DataAccessException {
//
//        List<Visita> listResult = new ArrayList<Visita>();
//        HibernateCallback callback = new HibernateCallback() {
//
//            public Object doInHibernate(Session session) throws HibernateException, SQLException {
//
//            	Criteria criteria = session.createCriteria(Visita.class);
//            	if (clientID!=null){
//            		criteria.add( Restrictions.eq("cliente.idcliente",clientID) );
//            	}          	
//				if (initialDate!=null){
//					criteria.add( Restrictions.ge( "inicia", initialDate ));
//				}
//				if (finalDate!=null){
//					criteria.add( Restrictions.lt( "termina", finalDate ));					
//            	}
//				if (!direction.isEmpty()){
//            		criteria.add( Restrictions.like("direccion", "%"+direction+"%") );					
//            	}
//				if (!fieldSort.isEmpty()){
//					if (sort.contains("asc")){
//						criteria.addOrder(Order.asc(fieldSort));
//					}						
//					else{
//						criteria.addOrder(Order.desc(fieldSort));
//					}
//				}
//				return criteria.list();
//            }
//        };
//
//        listResult = (List<Visita>) this.getHibernateTemplate().execute(callback);
//        LOG.info("Cantidad:"+listResult.size());
//        return listResult;
//    }
    
  public List<VisitaDTO> getVisitasByParameters(final Date initialDate,final Date finalDate, final Integer clientID, final String direction, final String fieldSort, final String sort) throws DataAccessException {

				
		        List<VisitaDTO> listResult = new ArrayList<VisitaDTO>();
		        HibernateCallback callback = new HibernateCallback() {

		            public Object doInHibernate(Session session) throws HibernateException, SQLException {
		            	
		            	 String finalQuery="";
		
		    	  		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		              	if (clientID!=null){
		              		finalQuery = " and V.cliente.idcliente="+clientID;
		              	}          	
		    			if (initialDate!=null){
		    				finalQuery = finalQuery+" and V.inicia>='"+dateFormat.format(initialDate)+"'" ;
		    				}
		    			if (finalDate!=null){
		    				finalQuery = finalQuery+" and V.termina<='"+dateFormat.format(finalDate)+"'";					
		              	}
		    			if (!direction.isEmpty()){
		    				finalQuery = finalQuery+" and direccion like '%"+direction+"%'";					
		              	}
		    			if (!fieldSort.isEmpty()){
//		    					if (sort.contains("asc")){
//		    						criteria.addOrder(Order.asc(fieldSort));
//		    					}						
//		    					else{
//		    						criteria.addOrder(Order.desc(fieldSort));
//		    					}
		    			}

		                Query query = session.createQuery(
		                        "select new com.sigepro.web.model.dto.VisitaDTO(V.idvisita,C.idcliente,C.nombre,V.titulo,V.descripcion,V.inicia,V.termina,V.direccion,V.diacompleto,V.estadoVis.idestadovis,T.descripcion) "
		                                + " FROM Visita as V, Incidencia I, TipoInc T, Cliente as C" + " WHERE V.incidencia=I.idincidencia and I.tipoInc=T.idtipoincidencia and V.incidencia.cliente.idcliente=C.idcliente "+finalQuery+" order by C.idcliente");

		                List result = query.list();
		                return result;
		            }
		        };
		 

      listResult = (List<VisitaDTO>) this.getHibernateTemplate().execute(callback);
      LOG.info("Cantidad:"+listResult.size());
      return listResult;
  }
    
    public List<VisitaDTO> getFullListVisitDTO(final int maxResult)
            throws DataAccessException {
        List<VisitaDTO> listResult = new ArrayList<VisitaDTO>();
        HibernateCallback callback = new HibernateCallback() {

            public Object doInHibernate(Session session) throws HibernateException, SQLException {

                Query query = session.createQuery(
                        "select new com.sigepro.web.model.dto.VisitaDTO(V.idvisita,C.idcliente,C.nombre,V.titulo,V.descripcion,V.inicia,V.termina,V.direccion,V.diacompleto,V.estadoVis.idestadovis) "
                                + " FROM Visita as V, Cliente as C, Incidencia as I" + " WHERE I.cliente.idcliente=C.idcliente and I.idincidencia=V.incidencia.idincidencia order by C.idcliente");
                if (maxResult!=-1){
                	query.setMaxResults(
                            maxResult);
                }
                List result = query.list();
                return result;
            }
        };
        listResult = (List<VisitaDTO>) this.getHibernateTemplate().execute(callback);
        return listResult;
    }
    
    @SuppressWarnings("unchecked")
    public Visita loadVisitaById(final Long idVisita) throws DataAccessException {
    	LOG.info("loadVisitaById() con id:"+idVisita);
        List<Visita> results = getHibernateTemplate().find(
                "select V from Visita as V where V.idvisita=" + idVisita);

        if (results.isEmpty()) {
            return null;
        } else
            return results.get(0);
    }
    
    @SuppressWarnings("unchecked")
    public List<VisitaDTO> loadVisitListById( final String listIdVisita) throws DataAccessException {
    	LOG.info("loadVisitListById()");
        List<VisitaDTO> listResult = new ArrayList<VisitaDTO>();

        HibernateCallback callback = new HibernateCallback() {

            public Object doInHibernate(Session session) throws HibernateException, SQLException {

                Query query = session.createQuery(
                        "select new com.decorart.web.model.dto.VisitaDTO(V.idvisita,C.nombre,C.apellido,V.titulo,V.descripcion,V.inicia,V.termina,V.direccion,V.diacompleto,V.estadoVis.idestadovis) "
                                + " FROM Visita as V, Cliente as C" + " WHERE V.cliente.idcliente=C.idcliente and V.idvisita in ("+listIdVisita+") order by C.idcliente");
                

                List result = query.list();
                return result;
            }
        };

        listResult = (List<VisitaDTO>) this.getHibernateTemplate().execute(callback);

        if (listResult.isEmpty()) {
            return null;
        } else
            return listResult;
    }
    
    
    @SuppressWarnings("unchecked")
    public List<EstadoVis> loadAllEstadoVisita() throws DataAccessException {

        List<EstadoVis> lstResults = getHibernateTemplate().find(
                "select T from EstadoVis as T");

        if (lstResults.isEmpty()) {
            return null;
        } else
            return lstResults;
    }
    
    
    public void deleteVisita(Visita visita) throws DataAccessException {
    	LOG.info("deleteVisita()");
        getHibernateTemplate().delete(visita);
    }
}
