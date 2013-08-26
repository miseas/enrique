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

import com.sigepro.web.model.dto.IncidenciaDTO;
import com.sigepro.web.model.dto.IncidenciaData;
import com.sigepro.web.model.dto.PageResult;
import com.sigepro.web.model.dto.VisitaDTO;
import com.sigepro.web.service.IncidenciaService;

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
public class IncidenciaController {

	Logger LOG = LoggerFactory.getLogger(IncidenciaController.class);

    @Autowired
    IncidenciaService incidenciaService;

//    @Audited(message = "Accion: Busqueda inical de Abono en Listado")
//    @RequestMapping(value = "/loadlistAbonos", method = RequestMethod.GET)
//    public @ResponseBody
//    PageResult loadlistClients(@RequestParam(value = "sidx", required = false, defaultValue = "") String fieldName,
//  		  @RequestParam(value = "sord", required = false, defaultValue = "") String order) {
//    	LOG.info("ClientController.listClients()");
//        List<AbonoDTO> listAbonos = new ArrayList<AbonoDTO>();
//        PageResult pageResult = new PageResult();
//        try {
//            listAbonos = abonoService.listAbonosByName("",fieldName,order,20);
//            pageResult.setPage("1");
//            pageResult.setTotal("1");
//            pageResult.setRecords(listAbonos.size() + "");
//            pageResult.setRows(listAbonos);
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//
//        return pageResult;
//    }
    
    @Audited(message = "Accion: Agregar Incidencia")
    @RequestMapping(value = "/addNewIncidencia", method = RequestMethod.POST)
    public @ResponseBody
    Long saveNewIncidencia(@RequestBody IncidenciaData data) {
    	LOG.info("IncidenciaController.saveNewIncidencia()");
        Long returnNewId = -1l;
        try {
        	returnNewId = incidenciaService.saveIncidencia(data);
        } catch (Exception e) {
            e.printStackTrace();
            return -1l;
        }

        return 	returnNewId;
    }
    
    @Audited(message = "Accion: Editar Incidencia")
    @RequestMapping(value = "/updateIncidencia", method = RequestMethod.POST)
    public @ResponseBody
    Long updateIncidencia(@RequestBody IncidenciaData data) {
    	LOG.info("IncidenciaController.updateIncidencia()");
        Long returnNewId = -1l;
        try {
        	returnNewId = incidenciaService.updateIncidencia(data);
        } catch (Exception e) {
            e.printStackTrace();
            return -1l;
        }

        return 	returnNewId;
    }
    

    @Audited(message = "Accion: Busqueda de Incidencia")
    @RequestMapping(value = "/searchIncidenciaList", method = RequestMethod.GET)
    public @ResponseBody
    PageResult searchIncidenciaList(@RequestParam(value = "cId", required = false, defaultValue = "") String cId,
            @RequestParam(value = "iniD", required = false, defaultValue = "") String iniD,
            @RequestParam(value = "tipoI", required = false, defaultValue = "") Integer tipoI,
            @RequestParam(value = "estadoI", required = false, defaultValue = "") Integer estadoI,
          @RequestParam(value = "sidx", required = false, defaultValue = "") String fieldSort,
          @RequestParam(value = "sord", required = false, defaultValue = "") String sortOrder) {
    	
        List<IncidenciaDTO> listResult = new ArrayList<IncidenciaDTO>();
        PageResult pageResult = new PageResult();
        try {
        	listResult = incidenciaService.listIncidenciasByParameters(cId, iniD, tipoI, estadoI, fieldSort, sortOrder);
            pageResult.setPage("1");
          pageResult.setTotal("1");
          pageResult.setRecords(listResult.size() + "");
          pageResult.setRows(listResult);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return pageResult;
    }
    
     @Audited(message = "Accion: Eliminar incidencia")
    @RequestMapping(value = "/delIncidencia", method = RequestMethod.GET)
    public @ResponseBody
    boolean deleteIncidencia(@RequestParam(value = "idInc", required = false, defaultValue = "") Long idIncidencia) {
    	LOG.info("IncidenciaController.deleteIncidencia()");
        try {
        	incidenciaService.deleteIncidencia(idIncidencia);
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }

        return true;
    }
     
     @RequestMapping(value = "/loadAllCatAddIncidencia", method = RequestMethod.GET)
     public @ResponseBody
     Map<String, Object> loadAllCat() {
     	LOG.info("IncidenciaController.loadAllCat()");
         Map<String, Object> catalogs = new HashMap<String, Object>();
         try {
             catalogs = incidenciaService.loadAllAddIncidenciaCat();
         } catch (Exception e) {
             e.printStackTrace();
         }

         return catalogs;
     }
    
     @Audited(message = "Accion: Cargar una Visita de Incidencia")
     @RequestMapping(value = "/loadVisitByIncId", method = RequestMethod.GET)
     public @ResponseBody
     VisitaDTO loadVisit(@RequestParam(value = "iId", required = false, defaultValue = "-1") Long idincidencia) {
     	
         VisitaDTO visitaDTO = null;
         try {
         	visitaDTO = incidenciaService.loadVisitDTOByIncidencia(idincidencia);
         } catch (Exception e) {
             e.printStackTrace();
         }

         return visitaDTO;
     }
    
//    @RequestMapping(value = "/editAbono", method = RequestMethod.POST)
//    public @ResponseBody
//    boolean editAbono(@RequestBody AbonoDTO abono) {
//    	LOG.info("ClientController.editClient()");
//        try {
//            abonoService.saveorUpdateAbono(abono);
//        } catch (Exception e) {
//            e.printStackTrace();
//            return false;
//        }
//
//        return true;
//    }
}
