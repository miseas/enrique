package com.sigepro.web.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.sigepro.web.model.pojo.Cliente;
import com.sigepro.web.model.pojo.EstadoCli;
import com.sigepro.web.model.pojo.Localidad;


public interface ClientDAO extends DAO {

    Integer saveClient(Cliente cliente) throws DataAccessException;

    List<Cliente> getClientsByName(final String name, final String fieldSort, final String sort, final int maxResult) throws DataAccessException;

    Cliente loadClientByName(final String name) throws DataAccessException;
    
    void deleteClient(Cliente cliente) throws DataAccessException;
    
    Cliente loadClientById(final Integer idClient) throws DataAccessException;

    List<Cliente> getClientsByParameters(final String name,final String lastName, final String cuit, final String score,final String fieldSort, final String sort) throws DataAccessException;

    Integer loadLastClientId() throws DataAccessException;
    
    EstadoCli loadEstadoClientById(final Integer idEstadoClient) throws DataAccessException;
    
    Localidad loadLocalidadById(final Integer idLocalidad) throws DataAccessException;


 	
}
