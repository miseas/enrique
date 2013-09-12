package com.sigepro.web.dao;

import org.springframework.dao.DataAccessException;

import com.sigepro.web.model.pojo.HistoriaCli;
import com.sigepro.web.model.pojo.HistoriaInc;
import com.sigepro.web.model.pojo.HistoriaVis;



public interface HistorialDAO extends DAO {
	
	
	    Long saveHistorialClient(HistoriaCli historia) throws DataAccessException;
	    
	    Long saveHistorialVisit(HistoriaVis historia) throws DataAccessException;
	    
	    void saveHistorialIncidencia(HistoriaInc historia) throws DataAccessException;
}
