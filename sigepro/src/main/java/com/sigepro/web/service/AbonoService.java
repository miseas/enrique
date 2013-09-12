package com.sigepro.web.service;

import java.util.List;

import com.sigepro.web.model.dto.AbonoDTO;
import com.sigepro.web.model.dto.ClienteAbonoDTO;

public interface AbonoService {

    Integer saveAbono(AbonoDTO abonoDTO);
    List<AbonoDTO> listAbonosByName(String name, String fieldOrder, String order, int maxResult);
    void deleteAbonoById(Integer abonoId);
    void saveorUpdateAbono(AbonoDTO abonoDTO);
    boolean asignNewAbono(ClienteAbonoDTO abonoDTO);
    boolean deleteAsignAbono(ClienteAbonoDTO abonoDTO);
    List<ClienteAbonoDTO> listClientAbonos(Integer idClient);

}
