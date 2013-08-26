package com.sigepro.web.dao;

import java.util.Date;
import java.util.List;

import org.springframework.dao.DataAccessException;

import com.sigepro.web.model.dto.IncidenciaDTO;
import com.sigepro.web.model.pojo.EstadoInc;
import com.sigepro.web.model.pojo.Incidencia;
import com.sigepro.web.model.pojo.TipoInc;

public interface IncidenciaDAO extends DAO{

    Long saveIncidencia(Incidencia incidencia) throws DataAccessException;

    List<IncidenciaDTO> getIncidenciasByParameters(final Date initialDate, final Integer clientID, final Integer typeIncidencia,final Integer stateIncidencia, final String fieldSort, final String sort) throws DataAccessException;

    Incidencia loadIncidenciaById(final Long idIncidencia) throws DataAccessException;

    void deleteIncidencia(Incidencia incidencia) throws DataAccessException;

    List<TipoInc> loadAllTipoIncidencia() throws DataAccessException;

    List<EstadoInc> loadAllEstadoIncidencia() throws DataAccessException;

}
