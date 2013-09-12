package com.sigepro.web.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.sigepro.web.model.dto.ClienteAbonoDTO;
import com.sigepro.web.model.pojo.Abono;
import com.sigepro.web.model.pojo.ClienteAbono;


public interface AbonoDAO extends DAO {

    Integer saveAbono(Abono abono) throws DataAccessException;
    
    List<Abono> getAbonosByName(final String name, final String fieldSort, final String sort, final int maxResult) throws DataAccessException;

    Abono loadAbonoById(final Integer idAbono) throws DataAccessException;

    void deleteAbono(Abono abono) throws DataAccessException;
    
    boolean saveAsignClientAbono(ClienteAbono cliAbono) throws DataAccessException;

    void deleteAsignAbono(ClienteAbono cliAbono) throws DataAccessException;
    
    public List<ClienteAbonoDTO> getListClientAbonoDTO(final int idClient)
            throws DataAccessException;

}