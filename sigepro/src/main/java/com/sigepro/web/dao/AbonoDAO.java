package com.sigepro.web.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.sigepro.web.model.pojo.Abono;


public interface AbonoDAO extends DAO {

    Integer saveAbono(Abono abono) throws DataAccessException;
    
    List<Abono> getAbonosByName(final String name, final String fieldSort, final String sort, final int maxResult) throws DataAccessException;

    Abono loadAbonoById(final Integer idAbono) throws DataAccessException;

    void deleteAbono(Abono abono) throws DataAccessException;

}