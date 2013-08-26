package com.sigepro.web.dao;

import java.util.Date;
import java.util.List;

import org.springframework.dao.DataAccessException;

import com.sigepro.web.model.dto.VisitaDTO;
import com.sigepro.web.model.pojo.EstadoVis;
import com.sigepro.web.model.pojo.Visita;



public interface VisitaDAO extends DAO{

     Long saveVisita(Visita visita) throws DataAccessException;
     
     List<VisitaDTO> getVisitasByParameters(final Date initialDate,final Date finalDate, final Integer clientID, final String direction,final String fieldSort, final String sort) throws DataAccessException;
     
     Visita loadVisitaById(final Long idVisita) throws DataAccessException;
     
     void deleteVisita(Visita visita) throws DataAccessException;
     
     List<VisitaDTO> getFullListVisitDTO(final int maxResult);

     List<VisitaDTO> loadVisitListById(String listIdVisita) throws DataAccessException;

     public List<EstadoVis> loadAllEstadoVisita() throws DataAccessException;


}
