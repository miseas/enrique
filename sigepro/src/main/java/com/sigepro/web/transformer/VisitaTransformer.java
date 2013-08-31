/***************************************************************************************
 * No part of this program may be photocopied reproduced or translated to another program
 * language without prior written consent of Matias E. Iseas
 **************************************************************************************/
package com.sigepro.web.transformer;

import java.text.DateFormat;
import java.text.SimpleDateFormat;

import org.springframework.stereotype.Component;

import com.sigepro.web.model.dto.VisitaDTO;
import com.sigepro.web.model.pojo.Visita;


@Component
public class VisitaTransformer implements Transformer<Visita,VisitaDTO> {

	public VisitaDTO transform(Visita target) {
		VisitaDTO visitaDTO = new VisitaDTO();
		DateFormat df = new SimpleDateFormat("dd/MM/yyyy");
		DateFormat tf = new SimpleDateFormat("HH:mm");
		visitaDTO.setDescripcion(target.getDescripcion());
		visitaDTO.setDiacompleto(target.getDiacompleto());
		visitaDTO.setDireccion(target.getDireccion());
		visitaDTO.setEstado(target.getEstadoVis().getIdestadovis().toString());
		visitaDTO.setFechaInicia(df.format(target.getInicia()));
		visitaDTO.setFechaTermina(df.format(target.getTermina()));
		visitaDTO.setHoraInicia(tf.format(target.getInicia()));
		visitaDTO.setHoraTermina(tf.format(target.getInicia()));
		visitaDTO.setIdvisita(target.getIdvisita().toString());
		visitaDTO.setTitulo(target.getTitulo());
		return visitaDTO;
	}





}
