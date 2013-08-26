/***************************************************************************************
 * No part of this program may be photocopied reproduced or translated to another program
 * language without prior written consent of Matias E. Iseas
 **************************************************************************************/
package com.sigepro.web.service;

import java.util.List;

import com.sigepro.web.model.dto.VisitaDTO;


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
public interface VisitaService {
	
	
    Long saveVisit(VisitaDTO visitaDTO);
    
    List<VisitaDTO> listAllVisits(int maxResults);

    void deleteVisitaById(Long visitaId);
    
    Long updateVisita(VisitaDTO visitaDTO);

    Long updateDateTime(VisitaDTO visitaDTO);

    List<VisitaDTO> loadVisitsForReport(String listVisitId);
    
    List<VisitaDTO> listClientsByParameters(String clientId, String fechaIni, String timeIni, String fechaTer, String timeTer, String direction);

}
