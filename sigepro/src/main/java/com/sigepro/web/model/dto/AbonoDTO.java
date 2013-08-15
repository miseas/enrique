package com.sigepro.web.model.dto;

public class AbonoDTO {
	
	
	private String idabono;
	private String nombre;
	private String descripcion;
	private String minbajada;
	private String maxbajada;
	private String minsubida;
	private String maxsubida;
	private String precio;
	private Integer multiTipo;
	
	
	public String getIdabono() {
		return idabono;
	}
	public void setIdabono(String idabono) {
		this.idabono = idabono;
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

	public String getMinbajada() {
		return minbajada;
	}
	public void setMinbajada(String minbajada) {
		this.minbajada = minbajada;
	}
	public String getMaxbajada() {
		return maxbajada;
	}
	public void setMaxbajada(String maxbajada) {
		this.maxbajada = maxbajada;
	}
	public String getMinsubida() {
		return minsubida;
	}
	public void setMinsubida(String minsubida) {
		this.minsubida = minsubida;
	}
	public String getMaxsubida() {
		return maxsubida;
	}
	public void setMaxsubida(String maxsubida) {
		this.maxsubida = maxsubida;
	}
	public String getPrecio() {
		return precio;
	}
	public void setPrecio(String precio) {
		this.precio = precio;
	}
	public Integer getMultiTipo() {
		return multiTipo;
	}
	public void setMultiTipo(Integer multiTipo) {
		this.multiTipo = multiTipo;
	}

	

}
