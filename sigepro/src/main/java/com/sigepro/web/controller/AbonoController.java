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

import com.sigepro.web.model.dto.AbonoDTO;
import com.sigepro.web.model.dto.PageResult;
import com.sigepro.web.service.AbonoService;

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
    AbonoService abonoService;

    @Audited(message = "Accion: Busqueda inical de Abono en Listado")
    @RequestMapping(value = "/loadlistAbonos", method = RequestMethod.GET)
    public @ResponseBody
    PageResult loadlistClients(@RequestParam(value = "sidx", required = false, defaultValue = "") String fieldName,
  		  @RequestParam(value = "sord", required = false, defaultValue = "") String order) {
    	LOG.info("ClientController.listClients()");
        List<AbonoDTO> listAbonos = new ArrayList<AbonoDTO>();
        PageResult pageResult = new PageResult();
        try {
            listAbonos = abonoService.listAbonosByName("",fieldName,order,20);
            pageResult.setPage("1");
            pageResult.setTotal("1");
            pageResult.setRecords(listAbonos.size() + "");
            pageResult.setRows(listAbonos);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return pageResult;
    }
    
    @Audited(message = "Accion: Agregar Abono")
    @RequestMapping(value = "/addNewAbono", method = RequestMethod.POST)
    public @ResponseBody
    Integer saveNewAbono(@RequestBody AbonoDTO abonoDTO) {
    	LOG.info("AbonoController.saveNewAbono()");
        Integer returnNewId = -1;
        try {
        	returnNewId = abonoService.saveAbono(abonoDTO);
        } catch (Exception e) {
            e.printStackTrace();
            return -1;
        }

        return 	returnNewId;
    }

    // @Audited(message = "Accion: Eliminar alertas")
    @RequestMapping(value = "/delAbono", method = RequestMethod.GET)
    public @ResponseBody
    boolean deleteAbono(@RequestParam(value = "idAbono", required = false, defaultValue = "") Integer idAbono) {
    	LOG.info("AbonoController.deleteClient()");
        try {
        	abonoService.deleteAbonoById(idAbono);
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }

        return true;
    }
    
    
    @RequestMapping(value = "/editAbono", method = RequestMethod.POST)
    public @ResponseBody
    boolean editAbono(@RequestBody AbonoDTO abono) {
    	LOG.info("ClientController.editClient()");
        try {
            abonoService.saveorUpdateAbono(abono);
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }

        return true;
    }
}
