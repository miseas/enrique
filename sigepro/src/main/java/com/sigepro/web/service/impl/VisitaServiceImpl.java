/***************************************************************************************
 * No part of this program may be photocopied reproduced or translated to another program
 * language without prior written consent of Matias E. Iseas
 **************************************************************************************/
package com.sigepro.web.service.impl;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.jfree.util.Log;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sigepro.web.dao.VisitaDAO;
import com.sigepro.web.dao.impl.DAOLocator;
import com.sigepro.web.model.dto.VisitaDTO;
import com.sigepro.web.model.pojo.Visita;
import com.sigepro.web.service.VisitaService;



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
@Transactional
@Service
public class VisitaServiceImpl implements VisitaService {
	
	Logger LOG = LoggerFactory.getLogger(VisitaServiceImpl.class);

//	@Autowired
//	@Qualifier("visitaTransformer")
//	Transformer<Visita, VisitaDTO> visitaTransformer;

    private VisitaDAO getVisitaDAO() {
        return DAOLocator.getInstance().lookup(VisitaDAO.class.getName());
    }

    public Long saveVisit(VisitaDTO visitaDTO) {

        Visita visita =  new Visita();
        
        DateFormat df = new SimpleDateFormat("dd/MM/yyyy HH:mm");
        //Date today = Calendar.getInstance().getTime();        
        //String reportDate = df.format(today);
        Date inicialTime = null;
		try {
			inicialTime = df.parse(visitaDTO.getFechaInicia()+" "+visitaDTO.getHoraInicia());
		
        if (!visitaDTO.getDiacompleto()){
	        Date endTime = df.parse(visitaDTO.getFechaTermina()+" "+visitaDTO.getHoraTermina());
	        visita.setTermina(endTime);
        }
        
		} catch (ParseException e) {
			Log.error(e.getMessage());
		}
        visita.setDescripcion(visitaDTO.getDescripcion());
        visita.setDiacompleto(visitaDTO.getDiacompleto());
        visita.setInicia(inicialTime);
        visita.setTitulo(visitaDTO.getTitulo());
  
		visita.setDireccion(visitaDTO.getDireccion());
		visita.setEstado(Integer.parseInt(visitaDTO.getEstado()));
        return getVisitaDAO().saveVisita(visita);

    }
    
    public List<VisitaDTO> listAllVisits(int maxResults){
    	Log.info("listAllVisits()");
    	List<VisitaDTO> retult = getVisitaDAO().getFullListVisitDTO(maxResults);
    	return retult;
    }
    
    public Long updateVisita(VisitaDTO visitaDTO) {
        Visita visita = getVisitaDAO().loadVisitaById(Long.parseLong(visitaDTO.getIdvisita()));
        if (visita == null) {
        	visita = new Visita();
        }
        DateFormat df = new SimpleDateFormat("dd/MM/yyyy HH:mm");
        Date inicialTime = null;
		try {
			inicialTime = df.parse(visitaDTO.getFechaInicia()+" "+visitaDTO.getHoraInicia());
		
        if (!visitaDTO.getDiacompleto()){
	        Date endTime = df.parse(visitaDTO.getFechaTermina()+" "+visitaDTO.getHoraTermina());
	        visita.setTermina(endTime);
        }
        
		} catch (ParseException e) {
			Log.error(e.getMessage());
		}
        visita.setDescripcion(visitaDTO.getDescripcion());
        visita.setDiacompleto(visitaDTO.getDiacompleto());
        visita.setInicia(inicialTime);
        visita.setTitulo(visitaDTO.getTitulo());
		visita.setDireccion(visitaDTO.getDireccion());
		visita.setEstado(Integer.parseInt(visitaDTO.getEstado()));
        return getVisitaDAO().saveVisita(visita);

    }
    
    public Long updateDateTime(VisitaDTO visitaDTO) {
        Visita visita = getVisitaDAO().loadVisitaById(Long.parseLong(visitaDTO.getIdvisita()));
        DateFormat df = new SimpleDateFormat("dd/MM/yyyy HH:mm");
		try {
			Date inicialTime = df.parse(visitaDTO.getFechaInicia()+" "+visitaDTO.getHoraInicia());
	        Date endTime = df.parse(visitaDTO.getFechaTermina()+" "+visitaDTO.getHoraTermina());
	        visita.setInicia(inicialTime);
	        visita.setTermina(endTime);    
		} catch (ParseException e) {
			Log.error(e.getMessage());
		}

        return getVisitaDAO().saveVisita(visita);

    }
    
    public List<VisitaDTO> loadVisitsForReport(String listVisitId) {
        List<VisitaDTO> listVisitas = getVisitaDAO().loadVisitListById(listVisitId);
        return listVisitas;

    }
    
    
  public List<VisitaDTO> listClientsByParameters(String clientId, String fechaIni, String timeIni, String fechaTer, String timeTer, String direction) {
  List<VisitaDTO> resultList = new ArrayList<VisitaDTO>();
  try {
      DateFormat df = new SimpleDateFormat("dd/MM/yyyy HH:mm");

      Date inicialTime = null;
      Date endTime = null;
      Integer clientIdNum = null;
		try {
			inicialTime = df.parse(fechaIni+" "+timeIni);
	        endTime = df.parse(fechaTer+" "+timeTer);      
		} catch (ParseException e) {
			Log.error(e.getMessage());
		}
		if (clientId!=null && !clientId.isEmpty()){
			 clientIdNum = Integer.parseInt(clientId);
		}
  	List<VisitaDTO> listvisits = getVisitaDAO().getVisitasByParameters(inicialTime, endTime, clientIdNum, direction, "", "");
//  	for (Visita visita : listvisits) {
//  		resultList.add(visitaTransformer.transform(visita));
//		}
  	resultList= listvisits;
  } catch (Exception e) {
      e.printStackTrace();
  }

  return resultList;

}
    
    

    public void deleteVisitaById(Long visitaId) {
    	Log.info("VisitaService.deleteVisitaById()");
        Visita visita = new Visita();
        visita.setIdvisita(visitaId);
        getVisitaDAO().deleteVisita(visita);

    }

}
