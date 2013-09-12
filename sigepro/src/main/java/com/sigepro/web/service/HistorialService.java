package com.sigepro.web.service;

import com.sigepro.web.model.pojo.Cliente;
import com.sigepro.web.model.pojo.Incidencia;
import com.sigepro.web.model.pojo.Visita;



public interface HistorialService {

    
     Long saveHistorialCliente(Cliente cliente,String descripcion);
    
     Long saveHistorialVisita(Visita visita,Incidencia incidencia,String descripcion);
    
     void saveHistorialIncidencia(Incidencia incidencia, Cliente cliente, Visita visita,String descripcion);


}
