package com.sigepro.web.service;


import java.util.List;

import com.sigepro.web.model.dto.ClienteDTO;

public interface ClienteService {

    Integer saveClient(ClienteDTO clientDTO);

     List<ClienteDTO> listClientsByName(String name, String fieldOrder, String order, int maxResult);

    void deleteClientById(Integer clientId);
    
    void saveorUpdateClient(ClienteDTO clientDTO);

    List<ClienteDTO> listClientsByParameters(String name, String lastName, String cuit, String score, String fieldOrder, String order);

	Integer loadClientLastId();

}
