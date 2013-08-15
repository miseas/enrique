package com.sigepro.web.transformer;

import java.text.SimpleDateFormat;

import org.apache.commons.lang3.text.WordUtils;
import org.springframework.stereotype.Component;

import com.sigepro.web.model.dto.ClienteDTO;
import com.sigepro.web.model.pojo.Cliente;


@Component
public class ClienteTransformer implements Transformer<Cliente,ClienteDTO> {

	public ClienteDTO transform(Cliente target) {
		ClienteDTO clienteDTO = new ClienteDTO();
		clienteDTO.setNombre(WordUtils.capitalize(target.getNombre()));
		clienteDTO.setApellido(WordUtils.capitalize(target.getApellido()));
		SimpleDateFormat df = new SimpleDateFormat("dd/MM/yyyy");		
		clienteDTO.setFechaAgregado(df.format(target.getFechaAgregado()));
		if (target.getCuit()!=null){
		clienteDTO.setCuit(target.getCuit().toString());
		}
		clienteDTO.setDireccion(target.getDireccion());
		clienteDTO.setEmail(target.getEmail());
		clienteDTO.setIdcliente(target.getIdcliente());
		clienteDTO.setLocalidad(target.getLocalidad().getDescripcion());
		clienteDTO.setLocalidadId(target.getLocalidad().getIdlocalidad());
		clienteDTO.setNotas(target.getNotas());
		clienteDTO.setPuntuacion(target.getPuntuacion().toString());
		clienteDTO.setTelefono(target.getTelefono());
		clienteDTO.setTelefono2(target.getTelefono2());
		clienteDTO.setTelefono3(target.getTelefono3());
		clienteDTO.setCcNro(target.getCcNro());
		clienteDTO.setEstadoCli(target.getEstadoCli().getDescripcion());
		clienteDTO.setEstadoCliId(target.getEstadoCli().getIdestadocli()+"");
		clienteDTO.setNumerocli(target.getNumerocli());
		clienteDTO.setIddnitipo(target.getCatDnitipo().getIddnitipo());
		return clienteDTO;		
	}



}
