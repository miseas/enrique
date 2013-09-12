package com.sigepro.web.model.dto;

import java.text.SimpleDateFormat;
import java.util.Date;

public class ClienteAbonoDTO {
	
	
	private String idabono;
	private String idcliente;
	private String nombre;
	private String descripcion;
	private String precio;
	private String fechaAlta;
	private String fechaBaja;
	private Integer multiTipo;
	
	
	public ClienteAbonoDTO() {
		super();
	}

	public ClienteAbonoDTO(Integer idabono, Integer idcliente, String nombre,
			Date fechaAlta,
			Date fechaBaja, String descripcion) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");		
		this.idabono = idabono.toString();
		this.idcliente = idcliente.toString();
		this.nombre = nombre;
		this.descripcion = descripcion;
		this.fechaAlta = dateFormat.format(fechaAlta);
		if (fechaBaja!=null)
		this.fechaBaja = dateFormat.format(fechaBaja);
	}
	
	public String getIdabono() {
		return idabono;
	}
	public void setIdabono(String idabono) {
		this.idabono = idabono;
	}
	public String getIdcliente() {
		return idcliente;
	}
	public void setIdcliente(String idcliente) {
		this.idcliente = idcliente;
	}
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public String getDescripcion() {
		return descripcion;
	}
	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}
	public String getPrecio() {
		return precio;
	}
	public void setPrecio(String precio) {
		this.precio = precio;
	}
	public String getFechaAlta() {
		return fechaAlta;
	}
	public void setFechaAlta(String fechaAlta) {
		this.fechaAlta = fechaAlta;
	}
	public String getFechaBaja() {
		return fechaBaja;
	}
	public void setFechaBaja(String fechaBaja) {
		this.fechaBaja = fechaBaja;
	}
	public Integer getMultiTipo() {
		return multiTipo;
	}
	public void setMultiTipo(Integer multiTipo) {
		this.multiTipo = multiTipo;
	}
	
	
}
