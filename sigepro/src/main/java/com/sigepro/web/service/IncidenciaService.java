package com.sigepro.web.service;

import java.text.ParseException;
import java.util.List;
import java.util.Map;

import com.sigepro.web.model.dto.IncidenciaDTO;
import com.sigepro.web.model.dto.IncidenciaData;
import com.sigepro.web.model.dto.VisitaDTO;

public interface IncidenciaService {
	
     Long saveIncidencia(IncidenciaData incidenciaData) throws ParseException;

     List<IncidenciaDTO> listIncidenciasByParameters(String clientId, String fechaIni, Integer typeIncidencia, Integer stateIncidencia, String fieldSort, String sort);

     void deleteIncidencia(Long incidenciaId);

 	 Map<String,Object> loadAllAddIncidenciaCat();

  	 VisitaDTO loadVisitDTOByIncidencia(Long idincidencia);

     Long updateIncidencia(IncidenciaData incidenciaData) throws ParseException;

}
