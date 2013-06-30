/***************************************************************************************
 * No part of this program may be photocopied reproduced or translated to another program
 * language without prior written consent of Matias E. Iseas
 **************************************************************************************/
package com.sigepro.web.controller;

import java.util.ArrayList;
import java.util.List;

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
import com.sigepro.web.service.ClienteService;

import fr.xebia.audit.Audited;

/**
 * TODO comment<br>
 * <br>
 * <b>Change log:</b>
 * <ul>
 * <li>1.0 14/06/2013 - Xpost - initial version</li>
 * </ul>
 * 
 * @author Xpost
 * @version 1.0
 */
@Controller
public class AbonoController {

	Logger LOG = LoggerFactory.getLogger(AbonoController.class);

    @Autowired
    ClienteService clientService;
//    @Autowired
//    EmailSenderService emailSenderService;

    @Audited(message = "Accion: Busqueda inical de Abonos")
    @RequestMapping(value = "/searchAbono", method = RequestMethod.POST)
    public @ResponseBody
    Object[] searchAbono(@RequestParam(value = "nameStartWith", required = false, defaultValue = "") String name,
            @RequestParam(value = "maxRows", required = false, defaultValue = "5") int maxRows) {
        List<ClienteDTO> listClients = new ArrayList<ClienteDTO>();
        try {
            listClients = clientService.listClientsByName(name,"","", maxRows);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return listClients.toArray();
    }
    
    
    @Audited(message = "Accion: Agregar Abono")
    @RequestMapping(value = "/addNewAbono", method = RequestMethod.POST)
    public @ResponseBody
    Integer saveNewAbono(@RequestBody ClienteDTO newCliente) {
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
}
