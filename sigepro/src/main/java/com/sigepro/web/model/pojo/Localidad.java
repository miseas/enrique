package com.sigepro.web.model.pojo;

// Generated 02/06/2013 23:23:40 by Hibernate Tools 3.4.0.CR1

import java.util.HashSet;
import java.util.Set;

/**
 * Localidad generated by hbm2java
 */
public class Localidad implements java.io.Serializable {

	private Integer idlocalidad;
	private String descripcion;
	private Set<Cliente> clientes = new HashSet<Cliente>(0);

	public Localidad() {
	}

	public Localidad(Integer idlocalidad, String descripcion) {
		this.idlocalidad = idlocalidad;
		this.descripcion = descripcion;
	}

	public Localidad(Integer idlocalidad, String descripcion, Set<Cliente> clientes) {
		this.idlocalidad = idlocalidad;
		this.descripcion = descripcion;
		this.clientes = clientes;
	}

	public Integer getIdlocalidad() {
		return this.idlocalidad;
	}

	public void setIdlocalidad(Integer idlocalidad) {
		this.idlocalidad = idlocalidad;
	}

	public String getDescripcion() {
		return this.descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}

	public Set<Cliente> getClientes() {
		return this.clientes;
	}

	public void setClientes(Set<Cliente> clientes) {
		this.clientes = clientes;
	}

}
