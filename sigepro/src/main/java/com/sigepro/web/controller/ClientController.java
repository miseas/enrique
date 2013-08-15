/***************************************************************************************
 * No part of this program may be photocopied reproduced or translated to another program
 * language without prior written consent of Matias E. Iseas
 **************************************************************************************/
package com.sigepro.web.controller;



import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sigepro.web.model.dto.ClienteDTO;
import com.sigepro.web.model.dto.PageResult;
import com.sigepro.web.service.ClienteService;

import fr.xebia.audit.Audited;

//import fr.xebia.audit.Audited;

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
@Controller
public class ClientController {

	Logger LOG = LoggerFactory.getLogger(ClientController.class);

    @Autowired
    ClienteService clientService;
//    @Autowired
//    EmailSenderService emailSenderService;

    @Audited(message = "Accion: Busqueda inical de Clientes")
    @RequestMapping(value = "/searchClientByName", method = RequestMethod.POST)
    public @ResponseBody
    Object[] searchClientByName(@RequestParam(value = "nameStartWith", required = false, defaultValue = "") String name,
            @RequestParam(value = "maxRows", required = false, defaultValue = "5") int maxRows) {
        List<ClienteDTO> listClients = new ArrayList<ClienteDTO>();
        try {
            listClients = clientService.listClientsByName(name,"","", maxRows);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return listClients.toArray();
    }
    
    
    @Audited(message = "Accion: Agregar Cliente")
    @RequestMapping(value = "/addNewClient", method = RequestMethod.POST)
    public @ResponseBody
    Integer saveNewClient(@RequestBody ClienteDTO newCliente) {
    	LOG.info("ClientController.saveNewClient()");
        Integer returnNewId = -1;
        try {
        	returnNewId = clientService.saveClient(newCliente);
        } catch (Exception e) {
            e.printStackTrace();
            return -1;
        }

        return 	returnNewId;
    }

    
    @RequestMapping(value = "/editClient", method = RequestMethod.POST)
    public @ResponseBody
    boolean editClient(@RequestBody ClienteDTO newCliente) {
    	LOG.info("ClientController.editClient()");
        try {
            clientService.saveorUpdateClient(newCliente);
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }

        return true;
    }

//    @Audited(message = "Accion: Ver historial pedidos")
//    @RequestMapping(value = "/viewRequestHistory", method = RequestMethod.GET)
//    public @ResponseBody
//    PageResult searchProductDTO() {
//        System.out.println("ClientController.searchProductDTO()");
//        List<PedidoDTO> listPedidos = new ArrayList<PedidoDTO>();
//        PageResult pageResult = new PageResult();
//
//        try {
//            listPedidos = clientService.listPedidos();
//            pageResult.setPage("1");
//            pageResult.setTotal("1");
//            pageResult.setRecords(listPedidos.size() + "");
//            pageResult.setRows(listPedidos);
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//
//        return pageResult;
//    }
    
    
    @Audited(message = "Accion: Busqueda inical de clientes en Listado")
    @RequestMapping(value = "/loadlistClients", method = RequestMethod.GET)
    public @ResponseBody
    PageResult loadlistClients(@RequestParam(value = "sidx", required = false, defaultValue = "") String fieldName,
  		  @RequestParam(value = "sord", required = false, defaultValue = "") String order) {
    	LOG.info("ClientController.listClients()");
        List<ClienteDTO> listClientes = new ArrayList<ClienteDTO>();
        PageResult pageResult = new PageResult();
        try {
            listClientes = clientService.listClientsByName("",fieldName,order,20);
            pageResult.setPage("1");
            pageResult.setTotal("1");
            pageResult.setRecords(listClientes.size() + "");
            pageResult.setRows(listClientes);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return pageResult;
    }
    
//  @Audited(message = "Accion: Ver historial pedidos")
  @RequestMapping(value = "/loadListClientsByParameter", method = RequestMethod.GET)
  public @ResponseBody
  PageResult loadlistClientsByParameters(@RequestParam(value = "name", required = false, defaultValue = "") String name,
		  @RequestParam(value = "lastName", required = false, defaultValue = "") String lastName,
		  @RequestParam(value = "cuit", required = false, defaultValue = "") String cuit,
		  @RequestParam(value = "score", required = false, defaultValue = "") String score,
		  @RequestParam(value = "sidx", required = false, defaultValue = "") String fieldName,
  		  @RequestParam(value = "sord", required = false, defaultValue = "") String order) {
	  LOG.info("ClientController.listClients()");
      List<ClienteDTO> listClientes = new ArrayList<ClienteDTO>();
      PageResult pageResult = new PageResult();
      try {
          listClientes = clientService.listClientsByParameters(name.isEmpty()?null:name.toLowerCase(), lastName.isEmpty()?null:lastName.toLowerCase(), cuit.isEmpty()?null:cuit, score.isEmpty()?null:score,fieldName,order);
          pageResult.setPage("1");
          pageResult.setTotal("1");
          pageResult.setRecords(listClientes.size() + "");
          pageResult.setRows(listClientes);
      } catch (Exception e) {
          e.printStackTrace();
      }

      return pageResult;
  }
    
   // @Audited(message = "Accion: Eliminar alertas")
    @RequestMapping(value = "/delClient", method = RequestMethod.GET)
    public @ResponseBody
    boolean deleteClient(@RequestParam(value = "idClient", required = false, defaultValue = "") Integer idClient) {
    	LOG.info("ClientController.deleteClient()");
        try {
        	clientService.deleteClientById(idClient);
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }

        return true;
    }
    
    
    // @Audited(message = "Accion: Eliminar alertas")
    @RequestMapping(value = "/loadLastClientId", method = RequestMethod.GET)
    public @ResponseBody
    Integer loadLastClientId() {
        Integer lastId = -1;
        try {
        	lastId = clientService.loadClientLastId();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return lastId;
    }
    
    
    @Audited(message = "Accion: Busqueda inical de clientes en Listado")
    @RequestMapping(value = "/loadAllCatAddClient", method = RequestMethod.GET)
    public @ResponseBody
    Map<String, Object> loadAllCat() {
    	LOG.info("ClientController.listClients()");
        Map<String, Object> catalogs = new HashMap<String, Object>();
        try {
            catalogs = clientService.loadAllAddClientCat();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return catalogs;
    }
    
//    @Audited(message = "Accion: Enviar mail")
//    @RequestMapping(value = "/sendEmailClient", method = RequestMethod.POST)
//    public @ResponseBody boolean  sendEmailClient(@RequestBody EmailDataDTO emailData) {
//        boolean state = false;
//		try {
//			LOG.info("sendEmailClient()");
//        	state = emailSenderService.sendMail("matias", emailData.getToEmail(), emailData.getSubject(),emailData.getContent());
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//
//        return state;
//    }
}
