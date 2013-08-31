package com.sigepro.web.model.dto;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.commons.lang3.text.WordUtils;

/***************************************************************************************
 * No part of this program may be photocopied reproduced or translated to another program
 * language without prior written consent of Matias E. Iseas
 **************************************************************************************/

/**
 * TODO comment<br>
 * <br>
 * <b>Change log:</b>
 * <ul>
 * <li>1.0 24/05/2013 - Xpost - initial version</li>
 * </ul>
 * 
 * @author Xpost
 * @version 1.0
 */
public class VisitaDTO {
	
	private String idvisita;
	private String clienteId;
	private String clienteNombre;
	private String titulo;
	private String descripcion;
	private String fechaInicia;
	private String fechaTermina;
	private String horaInicia;
	private String horaTermina;
	private String direccion;
	private Boolean diacompleto;	
	private String estadoId;
	private String tipoIncidencia;
	
	public VisitaDTO() {
		super();
	}
	
	public VisitaDTO(Long idvisita, Integer clienteId, String clienteNombre,
			String titulo, String descripcion, Date fechaInicia,
			Date fechaTermina,
			String direccion, Boolean diacompleto,Integer estado) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");		
		SimpleDateFormat timeFormat = new SimpleDateFormat("HH:mm");		
		this.idvisita = idvisita+"";
		this.clienteId = clienteId+"";
		this.clienteNombre = WordUtils.capitalize(clienteNombre);
		this.titulo = titulo;
		this.descripcion = descripcion;
		this.fechaInicia = dateFormat.format(fechaInicia);
		if (fechaTermina!=null){
			this.fechaTermina = dateFormat.format(fechaTermina);
		}
		this.horaInicia = timeFormat.format(fechaInicia);
		this.horaTermina = timeFormat.format(fechaTermina);
		this.direccion = direccion;
		this.diacompleto = diacompleto;
		this.estadoId=estado+"";
	}
	
	public VisitaDTO(Long idvisita, String clienteNombre,
			String titulo, String descripcion, Date fechaInicia,
			Date fechaTermina,String direccion, Boolean diacompleto,Integer estado) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("EEEE dd/MM/yyyy");		
		SimpleDateFormat timeFormat = new SimpleDateFormat("HH:mm");		
		this.idvisita = idvisita+"";
		this.clienteNombre = WordUtils.capitalize(clienteNombre);
		this.titulo = titulo;
		this.descripcion = descripcion;
		this.fechaInicia = dateFormat.format(fechaInicia);
		this.fechaTermina = dateFormat.format(fechaTermina);
		this.horaInicia = timeFormat.format(fechaInicia);
		this.horaTermina = timeFormat.format(fechaTermina);
		this.direccion = direccion;
		this.diacompleto = diacompleto;
		this.estadoId=estado+"";
	}
	
	
	public VisitaDTO(Long idvisita, Integer clienteId, String clienteNombre,
			String titulo, String descripcion, Date fechaInicia,
			Date fechaTermina,
			String direccion, Boolean diacompleto,Integer estado,String tipoIncidencia) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");		
		SimpleDateFormat timeFormat = new SimpleDateFormat("HH:mm");		
		this.idvisita = idvisita+"";
		this.clienteId = clienteId+"";
		this.clienteNombre = WordUtils.capitalize(clienteNombre);
		this.titulo = titulo;
		this.descripcion = descripcion;
		this.fechaInicia = dateFormat.format(fechaInicia);
		if (fechaTermina!=null){
			this.fechaTermina = dateFormat.format(fechaTermina);
		}
		this.horaInicia = timeFormat.format(fechaInicia);
		this.horaTermina = timeFormat.format(fechaTermina);
		this.direccion = direccion;
		this.diacompleto = diacompleto;
		this.estadoId=estado+"";
		this.tipoIncidencia = tipoIncidencia;
	}
	
	public String getIdvisita() {
		return idvisita;
	}
	public void setIdvisita(String idvisita) {
		this.idvisita = idvisita;
	}
	public String getClienteId() {
		return clienteId;
	}
	public void setClienteId(String clienteId) {
		this.clienteId = clienteId;
	}
	public String getTitulo() {
		return titulo;
	}
	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}
	public String getDescripcion() {
		return descripcion;
	}
	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}
	public String getFechaInicia() {
		return fechaInicia;
	}
	public void setFechaInicia(String fechaInicia) {
		this.fechaInicia = fechaInicia;
	}
	public String getFechaTermina() {
		return fechaTermina;
	}
	public void setFechaTermina(String fechaTermina) {
		this.fechaTermina = fechaTermina;
	}
	public String getHoraInicia() {
		return horaInicia;
	}
	public void setHoraInicia(String horaInicia) {
		this.horaInicia = horaInicia;
	}
	public String getHoraTermina() {
		return horaTermina;
	}
	public void setHoraTermina(String horaTermina) {
		this.horaTermina = horaTermina;
	}
	public Boolean getDiacompleto() {
		return diacompleto;
	}
	public void setDiacompleto(Boolean diacompleto) {
		this.diacompleto = diacompleto;
	}
	public String getDireccion() {
		return direccion;
	}
	public void setDireccion(String direccion) {
		this.direccion = direccion;
	}
	public String getClienteNombre() {
		return clienteNombre;
	}
	public void setClienteNombre(String clienteNombre) {
		this.clienteNombre = clienteNombre;
	}

	public String getEstadoId() {
		return estadoId;
	}

	public void setEstado(String estadoId) {
		this.estadoId = estadoId;
	}

	public String getTipoIncidencia() {
		return tipoIncidencia;
	}

	public void setTipoIncidencia(String tipoIncidencia) {
		this.tipoIncidencia = tipoIncidencia;
	}
	
	
	
	
}
