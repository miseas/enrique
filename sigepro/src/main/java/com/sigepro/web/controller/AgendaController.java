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

import com.sigepro.web.model.dto.VisitaDTO;
import com.sigepro.web.service.ReportGeneratorService;
import com.sigepro.web.service.VisitaService;

import fr.xebia.audit.Audited;

/**
 * TODO comment<br>
 * <br>
 * <b>Change log:</b>
 * <ul>
 * <li>1.0 24/05/2013 - Xpost - initial version</li>
 * </ul>
 * 
 * @author Xpost
 * @version 1.0
 */
@Controller
public class AgendaController {
	
	Logger LOG = LoggerFactory.getLogger(AgendaController.class);

    @Autowired
    VisitaService visitaService;
    @Autowired
    ReportGeneratorService reportGeneratorService;
    
    
    @Audited(message = "Accion: Agregar Visita")
    @RequestMapping(value = "/addNewVisit", method = RequestMethod.POST)
    public @ResponseBody
    Long addNewVisit(@RequestBody VisitaDTO visitaDTO) {
    	LOG.info("VisitaController.addNewVisit()");
        Long returnNewId = -1l;
        try {
        	returnNewId = visitaService.saveVisit(visitaDTO);
        } catch (Exception e) {
            e.printStackTrace();
            return returnNewId;
        }

        return 	returnNewId;
    }

    
  @Audited(message = "Accion: Cargar todas las visitas")
  @RequestMapping(value = "/loadAllVisit", method = RequestMethod.GET)
  public @ResponseBody
  List<VisitaDTO> loadAllVisit(@RequestParam(value = "maxresults", required = false, defaultValue = "-1") int maxresults) {
  	LOG.info("VisitaController.loadAllVisit()");
      List<VisitaDTO> listVisitas = new ArrayList<VisitaDTO>();
      try {
          listVisitas = visitaService.listAllVisits(maxresults);
      } catch (Exception e) {
          e.printStackTrace();
      }

      return listVisitas;
  }
    
    @RequestMapping(value = "/editVisit", method = RequestMethod.POST)
    public @ResponseBody
    Long editVisit(@RequestBody VisitaDTO visitaDTO) {
    	LOG.info("VisitaController.editVisit()");
    	Long visitId = -1l;
        try {
        	visitId = visitaService.updateVisita(visitaDTO);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return visitId;
    }
    
    @RequestMapping(value = "/updateVisitDateTime", method = RequestMethod.POST)
    public @ResponseBody
    Long updateVisitDateTime(@RequestBody VisitaDTO visitaDTO) {
    	LOG.info("VisitaController.updateVisitDateTime()");
    	Long visitId = -1l;
        try {
        	visitId = visitaService.updateDateTime(visitaDTO);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return visitId;
    }
    
    
//    @Audited(message = "Accion: Generar reporte visitas")
//    @RequestMapping(value = "/generateVisiReport", method = RequestMethod.GET)
//    public ModelAndView generateVisiReport(@RequestParam(value = "visitId", required = false, defaultValue = "") String visitIdList,
//    		HttpServletRequest request, HttpServletResponse response) throws IOException {
//    	
//    	List<VisitaDTO> listVisitDTOs = visitaService.loadVisitsForReport(visitIdList);
//    	ReportData<VisitaDTO > reportData = new ReportData<VisitaDTO>();
//    	reportData.setItems(listVisitDTOs);
//        if (listVisitDTOs != null) {
//    		String reportName = "Visitas_seleccionadas";
//            ByteArrayOutputStream baos = reportGeneratorService.generateReport(reportData,ReportType.VISITAS);
//		    response.setHeader("Content-Disposition", "attachment; filename=\"" + reportName + ".pdf\"");
//		    //response.setContentType("application/pdf");
//		    response.setContentLength(baos.size());
//		    ServletOutputStream out1 = response.getOutputStream();
//		    baos.writeTo(out1);
//		    out1.flush();
//        }
//
//        return null;
//    	
//    }
    
    @Audited(message = "Accion: Busqueda de Visitas")
    @RequestMapping(value = "/searchVisitList", method = RequestMethod.GET)
    public @ResponseBody
    Object[] searchVisitList(@RequestParam(value = "cId", required = false, defaultValue = "") String cId,
            @RequestParam(value = "iniD", required = false, defaultValue = "") String iniD,
            @RequestParam(value = "iniT", required = false, defaultValue = "") String iniT,
            @RequestParam(value = "endD", required = false, defaultValue = "") String endD,
            @RequestParam(value = "endT", required = false, defaultValue = "") String endT,
            @RequestParam(value = "dir", required = false, defaultValue = "") String dir) {
    	
        List<VisitaDTO> listVisits = new ArrayList<VisitaDTO>();
        try {
        	listVisits = visitaService.listClientsByParameters(cId, iniD, iniT, endD, endT, dir);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return listVisits.toArray();
    }
    
//  @Audited(message = "Accion: Ver historial pedidos")
//  @RequestMapping(value = "/loadListClientsByParameter", method = RequestMethod.GET)
//  public @ResponseBody
//  PageResult loadlistClientsByParameters(@RequestParam(value = "name", required = false, defaultValue = "") String name,
//		  @RequestParam(value = "lastName", required = false, defaultValue = "") String lastName,
//		  @RequestParam(value = "cuit", required = false, defaultValue = "") String cuit,
//		  @RequestParam(value = "score", required = false, defaultValue = "") String score,
//		  @RequestParam(value = "sidx", required = false, defaultValue = "") String fieldName,
//  		  @RequestParam(value = "sord", required = false, defaultValue = "") String order) {
//	  LOG.info("ClientController.listClients()");
//      List<ClienteDTO> listClientes = new ArrayList<ClienteDTO>();
//      PageResult pageResult = new PageResult();
//      try {
//          listClientes = clientService.listClientsByParameters(name.isEmpty()?null:name.toLowerCase(), lastName.isEmpty()?null:lastName.toLowerCase(), cuit.isEmpty()?null:cuit, score.isEmpty()?null:score,fieldName,order);
//          pageResult.setPage("1");
//          pageResult.setTotal("1");
//          pageResult.setRecords(listClientes.size() + "");
//          pageResult.setRows(listClientes);
//      } catch (Exception e) {
//          e.printStackTrace();
//      }
//
//      return pageResult;
//  }
//    
    @Audited(message = "Accion: Eliminar visita")
    @RequestMapping(value = "/delVisit", method = RequestMethod.GET)
    public @ResponseBody
    boolean delVisit(@RequestParam(value = "idVisita", required = false, defaultValue = "") Long idVisita) {
    	LOG.info("VisitaController.delVisit()");
        try {
        	visitaService.deleteVisitaById(idVisita);
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }

        return true;
    }


}
