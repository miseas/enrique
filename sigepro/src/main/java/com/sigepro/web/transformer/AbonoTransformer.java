package com.sigepro.web.transformer;

import org.springframework.stereotype.Component;

import com.sigepro.web.model.dto.AbonoDTO;
import com.sigepro.web.model.pojo.Abono;


@Component
public class AbonoTransformer implements Transformer<Abono,AbonoDTO> {

	public AbonoDTO transform(Abono target) {
	AbonoDTO abonoDTO = new AbonoDTO();
	abonoDTO.setIdabono(target.getIdabono().toString());
	abonoDTO.setDescripcion(target.getDescripcion());
	abonoDTO.setMaxbajada(target.getMaxbajada().toString());
	abonoDTO.setMaxsubida(target.getMaxsubida().toString());
	abonoDTO.setMinbajada(target.getMinbajada().toString());
	abonoDTO.setMinsubida(target.getMinsubida().toString());
	abonoDTO.setMultiTipo(target.getMultiTipo());
	abonoDTO.setNombre(target.getNombre());
	abonoDTO.setPrecio(target.getPrecio().toString());
	return abonoDTO;
	}



}
