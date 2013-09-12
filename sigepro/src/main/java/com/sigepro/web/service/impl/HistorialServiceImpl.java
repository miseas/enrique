/***************************************************************************************
 * No part of this program may be photocopied reproduced or translated to another program
 * language without prior written consent of Matias E. Iseas
 **************************************************************************************/
package com.sigepro.web.service.impl;



import org.joda.time.DateTime;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sigepro.web.dao.HistorialDAO;
import com.sigepro.web.dao.impl.DAOLocator;
import com.sigepro.web.model.dto.ClienteDTO;
import com.sigepro.web.model.pojo.Cliente;
import com.sigepro.web.model.pojo.HistoriaCli;
import com.sigepro.web.model.pojo.HistoriaInc;
import com.sigepro.web.model.pojo.HistoriaVis;
import com.sigepro.web.model.pojo.Incidencia;
import com.sigepro.web.model.pojo.Visita;
import com.sigepro.web.service.HistorialService;
import com.sigepro.web.transformer.Transformer;



/**
 * TODO comment<br>
 * <br>
 * <b>Change log:</b>
 * <ul>v
 * <li>1.0 20/02/2013 - Xpost - initial version</li>
 * </ul>
 * 
 * @author Xpost
 * @version 1.0
 */
@Transactional
@Service
public class HistorialServiceImpl implements HistorialService {
	
	
	Logger LOG = LoggerFactory.getLogger(HistorialServiceImpl.class);

	@Autowired
	@Qualifier("clientTransformer")
	Transformer<Cliente, ClienteDTO> clientTransformer;

    private HistorialDAO getHistorialDAO() {
        return DAOLocator.getInstance().lookup(HistorialDAO.class.getName());
    }

    public Long saveHistorialCliente(Cliente cliente, String descripcion) {
    	LOG.info("Guardando historia de Cliente...");
    	HistoriaCli historiaCli = new HistoriaCli();
        historiaCli.setCliente(cliente);
        historiaCli.setDescripcion(descripcion);
        historiaCli.setEstadoCli(cliente.getEstadoCli());
        historiaCli.setTimestamp(DateTime.now().toDate());
        //TODO set the user
        historiaCli.setUserid(1);
    	
        return getHistorialDAO().saveHistorialClient(historiaCli);

    }
    
    public Long saveHistorialVisita(Visita visita,Incidencia incidencia,String descripcion) {
    	LOG.info("Guardando historia de Visita...");
    	HistoriaVis historiaVis = new HistoriaVis();
    	historiaVis.setVisita(visita);
    	historiaVis.setDescripcion(descripcion);
    	historiaVis.setEstadoVis(visita.getEstadoVis());
    	historiaVis.setIncidencia(incidencia);
    	historiaVis.setTimestamp(DateTime.now().toDate());
        //TODO set the user
    	historiaVis.setUserid(1);
    	
        return getHistorialDAO().saveHistorialVisit(historiaVis);

    }
    
    
    public void saveHistorialIncidencia(Incidencia incidencia, Cliente cliente, Visita visita,String descripcion) {
    	LOG.info("Guardando historia de Incidencia...");
    	HistoriaInc historiaInc = new HistoriaInc();
    	historiaInc.setIncidencia(incidencia);
    	historiaInc.setTimestamp(DateTime.now().toDate());
    	historiaInc.setDescripcion(descripcion);
    	historiaInc.setCliente(cliente);
    	historiaInc.setEstadoInc(incidencia.getEstadoInc());
    	if (visita!=null){
    		historiaInc.setVisita(visita);
    	}    	
        //TODO set the user
    	historiaInc.setUserid(1);
    	
         getHistorialDAO().saveHistorialIncidencia(historiaInc);

    }

  /*  public List<ClienteDTO> listClientsByName(String name, String fieldOrder, String order, int maxResult) {
        List<ClienteDTO> resultList = new ArrayList<ClienteDTO>();
        try {
        	List<Cliente> clientes = getClientDAO().getClientsByName(name, fieldOrder,order, maxResult);
        	for (Cliente cliente : clientes) {
        		resultList.add(clientTransformer.transform(cliente));
			}
        } catch (Exception e) {
            e.printStackTrace();
        }

        return resultList;

    }
    
    public List<ClienteDTO> listClientsByParameters(String name,String lastName, String cuit, String score, String fieldOrder, String order) {
        List<ClienteDTO> resultList = new ArrayList<ClienteDTO>();
        try {
        	List<Cliente> clientes = getClientDAO().getClientsByParameters(name, lastName, cuit, score,fieldOrder,order);
        	for (Cliente cliente : clientes) {
        		resultList.add(clientTransformer.transform(cliente));
			}
        } catch (Exception e) {
            e.printStackTrace();
        }

        return resultList;

    }
    
    
    public void deleteClientById(Integer clientId) {
        Cliente cliente = new Cliente();
        cliente.setIdcliente(clientId);
        getClientDAO().deleteClient(cliente);

    }
    
    
    public ClienteDTO loadClientById(Integer clientId) {
		LOG.info("loadClientById");
        Cliente client = getClientDAO().loadClientById(clientId);        
        return clientTransformer.transform(client);
    }

	public String loadClientLastNum(){
		String lastId= "-1";
        try {
        	lastId = getClientDAO().loadLastClientNum();
			 
        } catch (Exception e) {
            e.printStackTrace();
        }

        return lastId;

	}
	
	public Map<String,Object> loadAllAddClientCat(){
		LOG.info("loadAllAddClientCat");
		Map<String,Object> mapElements = new HashMap<String, Object>();
        try {
        	List<Localidad> localidades = getClientDAO().loadAllLocalidades();
        	List<CatDnitipo> typeDni = getClientDAO().loadAllTypeDni();
        	List<EstadoCli> clientState = getClientDAO().loadAllClientState();
        	mapElements.put("localidades", localidades);
        	mapElements.put("typeID", typeDni);
        	mapElements.put("estadoCli", clientState);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return mapElements;

	}
	
	public ReportData loadCPForReport(Integer ocId){
        ReportData reportData = null;
		try {
			Cliente client = getClientDAO().loadClientById(ocId);
        	reportData = createReportData(client);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return reportData;
	}*/
	


}
