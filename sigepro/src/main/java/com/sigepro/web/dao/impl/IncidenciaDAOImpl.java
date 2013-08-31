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

import com.sigepro.web.dao.IncidenciaDAO;
import com.sigepro.web.model.dto.IncidenciaDTO;
import com.sigepro.web.model.dto.VisitaDTO;
import com.sigepro.web.model.pojo.EstadoInc;
import com.sigepro.web.model.pojo.Incidencia;
import com.sigepro.web.model.pojo.TipoInc;


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
public class IncidenciaDAOImpl extends HibernateDaoSupport implements IncidenciaDAO {

	Logger LOG = LoggerFactory.getLogger(IncidenciaDAOImpl.class);

    public Long saveIncidencia(Incidencia incidencia) throws DataAccessException {
    	LOG.info("IncidenciaDAOImpl.saveIncidencia()");
        getHibernateTemplate().saveOrUpdate(incidencia);
        return incidencia.getIdincidencia();
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
    
  public List<IncidenciaDTO> getIncidenciasByParameters(final Date initialDate, final Integer clientID, final Integer typeIncidencia,final Integer stateIncidencia, final String fieldSort, final String sort) throws DataAccessException {

				
		        List<IncidenciaDTO> listResult = new ArrayList<IncidenciaDTO>();
		        HibernateCallback callback = new HibernateCallback() {

		            public Object doInHibernate(Session session) throws HibernateException, SQLException {
		            	
		            	 String finalQuery="";
		
		    	  		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		              	if (clientID!=null){
		              		finalQuery = " and I.cliente.idcliente="+clientID;
		              	}          	
		    			if (initialDate!=null){
		    				finalQuery = finalQuery+" and I.fechaInicio>='"+dateFormat.format(initialDate)+"'" ;
		    				}
//		    			if (finalDate!=null){
//		    				finalQuery = finalQuery+" and V.termina>='"+dateFormat.format(finalDate)+"'";					
//		              	}
		    			if (typeIncidencia!=null){
		    				finalQuery = finalQuery+" and I.tipoInc.idtipoincidencia="+typeIncidencia;					
		              	}
		    			if (stateIncidencia!=null){
		    				finalQuery = finalQuery+" and I.estadoInc.idestadoinc="+stateIncidencia;					
		              	}
		    			if (!fieldSort.isEmpty()){
		    				if(fieldSort.contentEquals("clienteNombre")){
			    				finalQuery = finalQuery+" order by I.cliente.nombre";
		    				}
		    				else if(fieldSort.contentEquals("descripcionEstadoIncidencia")){
			    				finalQuery = finalQuery+" order by I.estadoInc.descripcion";
		    				}
		    				else if(fieldSort.contentEquals("descripcionTipoIncidencia")){
			    				finalQuery = finalQuery+" order by I.tipoInc.descripcion";
		    				}
		    				else{
		    					finalQuery = finalQuery+" order by I."+fieldSort;
		    				}
		    				if (sort.contains("desc")){
				    				finalQuery = finalQuery+" "+sort;
		    				}						
		    			}
		    			else{
		    				finalQuery = finalQuery+" order by C.idcliente";
		    			}

		                Query query = session.createQuery(
		                        "select new com.sigepro.web.model.dto.IncidenciaDTO(I.idincidencia,I.tipoInc.idtipoincidencia, I.tipoInc.descripcion, I.estadoInc.idestadoinc,I.estadoInc.descripcion, C.idcliente,C.nombre,I.fechaInicio,I.fechaCierre,I.descripcion,I.titulo) "
		                                + " FROM Incidencia as I, Cliente as C" + " WHERE I.cliente.idcliente=C.idcliente "+finalQuery);

		                List result = query.list();
		                return result;
		            }
		        };
		 

      listResult = (List<IncidenciaDTO>) this.getHibernateTemplate().execute(callback);
      LOG.info("Cantidad:"+listResult.size());
      return listResult;
  }
    
    public List<VisitaDTO> getFullListVisitDTO(final int maxResult)
            throws DataAccessException {
        List<VisitaDTO> listResult = new ArrayList<VisitaDTO>();
        HibernateCallback callback = new HibernateCallback() {

            public Object doInHibernate(Session session) throws HibernateException, SQLException {

                Query query = session.createQuery(
                        "select new com.decorart.web.model.dto.VisitaDTO(V.idvisita,C.idcliente,C.nombre,V.titulo,V.descripcion,V.inicia,V.termina,V.direccion,V.diacompleto,V.estadovis.idestadovis) "
                                + " FROM Visita as V, Cliente as C" + " WHERE V.cliente.idcliente=C.idcliente order by C.idcliente").setMaxResults(
                        maxResult);

                List result = query.list();
                return result;
            }
        };
        listResult = (List<VisitaDTO>) this.getHibernateTemplate().execute(callback);
        return listResult;
    }
    
    @SuppressWarnings("unchecked")
    public Incidencia loadIncidenciaById(final Long idIncidencia) throws DataAccessException {
    	LOG.info("loadIncidenciaById() con id:"+idIncidencia);
        List<Incidencia> results = getHibernateTemplate().find(
                "select I from Incidencia as I where I.idincidencia=" + idIncidencia);

        if (results.isEmpty()) {
            return null;
        } else
            return results.get(0);
    }
    
    
    
    public void deleteIncidencia(Incidencia incidencia) throws DataAccessException {
    	LOG.info("deleteIncidencia()");
        getHibernateTemplate().delete(incidencia);
    }
    
    
    @SuppressWarnings("unchecked")
    public List<TipoInc> loadAllTipoIncidencia() throws DataAccessException {

        List<TipoInc> lstResults = getHibernateTemplate().find(
                "select T from TipoInc as T");

        if (lstResults.isEmpty()) {
            return null;
        } else
            return lstResults;
    }
    
    @SuppressWarnings("unchecked")
    public List<EstadoInc> loadAllEstadoIncidencia() throws DataAccessException {

        List<EstadoInc> lstResults = getHibernateTemplate().find(
                "select T from EstadoInc as T");

        if (lstResults.isEmpty()) {
            return null;
        } else
            return lstResults;
    }
}
