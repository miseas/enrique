/***************************************************************************************
 * No part of this program may be photocopied reproduced or translated to another program
 * language without prior written consent of Matias E. Iseas
 **************************************************************************************/
package com.sigepro.web.service.impl;



import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sigepro.web.dao.AbonoDAO;
import com.sigepro.web.dao.impl.DAOLocator;
import com.sigepro.web.model.dto.AbonoDTO;
import com.sigepro.web.model.pojo.Abono;
import com.sigepro.web.service.AbonoService;
import com.sigepro.web.transformer.Transformer;



/**
 * TODO comment<br>
 * <br>
 * <b>Change log:</b>
 * <ul>v
 * <li>1.0 20/06/2013 - Xpost - initial version</li>
 * </ul>
 * 
 * @author Xpost
 * @version 1.0
 */
@Transactional
@Service
public class AbonoServiceImpl implements AbonoService {
	
	
	Logger LOG = LoggerFactory.getLogger(AbonoServiceImpl.class);

	@Autowired
	@Qualifier("abonoTransformer")
	Transformer<Abono, AbonoDTO> abonoTransformer;

    private AbonoDAO getAbonoDAO() {
        return DAOLocator.getInstance().lookup(AbonoDAO.class.getName());
    }

    public Integer saveAbono(AbonoDTO abonoDTO) {

        Abono abono =  new Abono();
        
        abono.setDescripcion(abonoDTO.getDescripcion());
        abono.setMaxbajada(Double.parseDouble(abonoDTO.getMaxbajada()));
        abono.setMaxsubida(Double.parseDouble(abonoDTO.getMaxsubida()));
        abono.setMinbajada(0d);
        abono.setMinsubida(0d);
        abono.setMultiTipo(abonoDTO.getMultiTipo());
        abono.setNombre(abonoDTO.getNombre());
        abono.setPrecio(Double.parseDouble(abonoDTO.getPrecio().replace(",", ".")));
        
        Integer id =getAbonoDAO().saveAbono(abono);
        return id;

    }
    
    public void saveorUpdateAbono(AbonoDTO abonoDTO) {

        //Try to load Client by Name
        Abono abono = getAbonoDAO().loadAbonoById(Integer.parseInt(abonoDTO.getIdabono()));
        if (abono == null) {
            abono = new Abono();
        }
        
        abono.setDescripcion(abonoDTO.getDescripcion());
        abono.setMaxbajada(Double.parseDouble(abonoDTO.getMaxbajada()));
        abono.setMaxsubida(Double.parseDouble(abonoDTO.getMaxsubida()));
        abono.setMinbajada(0d);
        abono.setMinsubida(0d);
        abono.setMultiTipo(abonoDTO.getMultiTipo());
        abono.setNombre(abonoDTO.getNombre());
        abono.setPrecio(Double.parseDouble(abonoDTO.getPrecio().replace(",", ".")));
        
        getAbonoDAO().saveAbono(abono);

    }

    public List<AbonoDTO> listAbonosByName(String name, String fieldOrder, String order, int maxResult) {
        List<AbonoDTO> resultList = new ArrayList<AbonoDTO>();
        try {
        	List<Abono> abonos = getAbonoDAO().getAbonosByName(name, fieldOrder,order, maxResult);
        	for (Abono abono : abonos) {
        		resultList.add(abonoTransformer.transform(abono));
			}
        } catch (Exception e) {
            e.printStackTrace();
        }

        return resultList;

    }
    
//    public List<ClienteDTO> listClientsByParameters(String name,String lastName, String cuit, String score, String fieldOrder, String order) {
//        List<ClienteDTO> resultList = new ArrayList<ClienteDTO>();
//        try {
//        	List<Cliente> clientes = getClientDAO().getClientsByParameters(name, lastName, cuit, score,fieldOrder,order);
//        	for (Cliente cliente : clientes) {
//        		resultList.add(abonoTransformer.transform(cliente));
//			}
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//
//        return resultList;
//
//    }
    
    
    public void deleteAbonoById(Integer abonoId) {
        Abono abono = new Abono();
        abono.setIdabono(abonoId);
        getAbonoDAO().deleteAbono(abono);
    }



}
