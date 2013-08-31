/***************************************************************************************
 * No part of this program may be photocopied reproduced or translated to another program
 * language without prior written consent of Matias E. Iseas
 **************************************************************************************/
package com.sigepro.web.service.impl;



import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sigepro.web.dao.ClientDAO;
import com.sigepro.web.dao.impl.DAOLocator;
import com.sigepro.web.model.dto.ClienteDTO;
import com.sigepro.web.model.dto.ReportData;
import com.sigepro.web.model.pojo.CatDnitipo;
import com.sigepro.web.model.pojo.Cliente;
import com.sigepro.web.model.pojo.EstadoCli;
import com.sigepro.web.model.pojo.Localidad;
import com.sigepro.web.service.ClienteService;
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
public class ClienteServiceImpl implements ClienteService {
	
	
	Logger LOG = LoggerFactory.getLogger(ClienteServiceImpl.class);

	@Autowired
	@Qualifier("clientTransformer")
	Transformer<Cliente, ClienteDTO> clientTransformer;

    private ClientDAO getClientDAO() {
        return DAOLocator.getInstance().lookup(ClientDAO.class.getName());
    }

    public Integer saveClient(ClienteDTO clientDTO) {

        Cliente cliente =  new Cliente();
        cliente.setNumerocli(clientDTO.getNumerocli());
        cliente.setNombre(clientDTO.getNombre().toLowerCase());
        cliente.setCcNro(clientDTO.getCcNro());
        cliente.setCuit(clientDTO.getCuit());
        cliente.setDireccion(clientDTO.getDireccion());
        cliente.setEmail(clientDTO.getEmail());
        cliente.setFechaAgregado(Calendar.getInstance().getTime());
        CatDnitipo catDnitipo = new CatDnitipo();
        catDnitipo.setIddnitipo(clientDTO.getIddnitipo());
		cliente.setCatDnitipo(catDnitipo);
        Localidad localidad = new Localidad();
        localidad.setIdlocalidad(clientDTO.getLocalidadId());
        
        cliente.setLocalidad(localidad);
        cliente.setNotas(clientDTO.getNotas());
        if (!clientDTO.getPuntuacion().isEmpty()){
        cliente.setPuntuacion(Integer.parseInt(clientDTO.getPuntuacion()));
        }
        else{
            cliente.setPuntuacion(0);
        }
        String[] numbers = clientDTO.getTelefono().split("@@");
        cliente.setTelefono(numbers[0]);
        cliente.setTelefono2(numbers[1]);
        cliente.setTelefono3(numbers[2]);

        EstadoCli estadoCli = new EstadoCli();
        estadoCli.setIdestadocli(Integer.parseInt(clientDTO.getEstadoCliId()));
        cliente.setEstadoCli(estadoCli);
        Integer id =getClientDAO().saveClient(cliente);
        return id;

    }
    
    public void saveorUpdateClient(ClienteDTO clientDTO) {

        //Try to load Client by Name
        Cliente cliente = getClientDAO().loadClientById(clientDTO.getIdcliente());
        if (cliente == null) {
            cliente = new Cliente();
        }
        cliente.setNumerocli(clientDTO.getNumerocli());
        cliente.setNombre(clientDTO.getNombre().toLowerCase());
        cliente.setCcNro(clientDTO.getCcNro());
        if (clientDTO.getCuit()!=null && !clientDTO.getCuit().isEmpty()){
        cliente.setCuit(clientDTO.getCuit());
        }else{
        cliente.setCuit(null);	
        }
        cliente.setDireccion(clientDTO.getDireccion());
        cliente.setEmail(clientDTO.getEmail());
        cliente.setFechaAgregado(Calendar.getInstance().getTime());
        CatDnitipo catDnitipo = new CatDnitipo();
        catDnitipo.setIddnitipo(clientDTO.getIddnitipo());
		cliente.setCatDnitipo(catDnitipo);
        Localidad localidad = new Localidad();
        localidad.setIdlocalidad(clientDTO.getLocalidadId());
        cliente.setLocalidad(localidad);
        cliente.setNotas(clientDTO.getNotas());
        if (!clientDTO.getPuntuacion().isEmpty()){
            cliente.setPuntuacion(Integer.parseInt(clientDTO.getPuntuacion()));
        }else{
            cliente.setPuntuacion(0);	
        }
        String[] numbers = clientDTO.getTelefono().split("@@");
        cliente.setTelefono(numbers[0]);
        cliente.setTelefono2(numbers[1]);
        cliente.setTelefono3(numbers[2]);
        
        EstadoCli estadoCli = new EstadoCli();
        estadoCli.setIdestadocli(Integer.parseInt(clientDTO.getEstadoCliId()));
        cliente.setEstadoCli(estadoCli);
        
        getClientDAO().saveClient(cliente);

    }

    public List<ClienteDTO> listClientsByName(String name, String fieldOrder, String order, int maxResult) {
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

	public Integer loadClientLastId(){
		Integer lastId= -1;
        try {
        	lastId = getClientDAO().loadLastClientId();
			
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
	}
	
	private ReportData createReportData(Cliente client) {
		ReportData reportData = new ReportData();
		ClienteDTO clientDTO = clientTransformer.transform(client);
		reportData.setClient(clientDTO);
//		if (presup.getFechaentrega()!=null){
//		reportData.setDateDelivery(dateFormatter.format(presup.getFechaentrega()));
//		}
//		reportData.setDateReport(dateFormatter.format(presup.getFechacompra()));
//		reportData.setPayCondition(presup.getCondcompra());
//		DecimalFormat df = new DecimalFormat("##.00");
//		reportData.setTotalPriceOrder(df.format(presup.getPreciototal()));
//		reportData.setNumPresupuesto(presup.getNrocompra().toString());
		
//		List<ProductReportDTO> productReportDTOs = new ArrayList<ProductReportDTO>();
//		for (ProductoOc product : presup.getProductoOcs()){
//			productReportDTOs.add(productOCTransformer.transform(product));
//		}
//		reportData.setItems(productReportDTOs);
		return reportData;
	}


}
