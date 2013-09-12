package com.sigepro.web.model.pojo;

// Generated 30-jun-2013 19:41:32 by Hibernate Tools 3.4.0.CR1

import java.util.HashSet;
import java.util.Set;

import org.codehaus.jackson.annotate.JsonIgnore;

/**
 * EstadoCli generated by hbm2java
 */
public class EstadoCli implements java.io.Serializable {

	private Integer idestadocli;
	private String descripcion;
	private String notas;
	@JsonIgnore
	private Set<Cliente> clientes = new HashSet<Cliente>(0);
	@JsonIgnore
	private Set<HistoriaCli> historiaClis = new HashSet<HistoriaCli>(0);

	public EstadoCli() {
	}

	public EstadoCli(int idestadocli, String descripcion) {
		this.idestadocli = idestadocli;
		this.descripcion = descripcion;
	}

	public EstadoCli(Integer idestadocli, String descripcion, String notas,
			Set<Cliente> clientes) {
		this.idestadocli = idestadocli;
		this.descripcion = descripcion;
		this.notas = notas;
		this.clientes = clientes;
	}

	public Integer getIdestadocli() {
		return this.idestadocli;
	}

	public void setIdestadocli(Integer idestadocli) {
		this.idestadocli = idestadocli;
	}

	public String getDescripcion() {
		return this.descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}

	public String getNotas() {
		return this.notas;
	}

	public void setNotas(String notas) {
		this.notas = notas;
	}

	public Set<Cliente> getClientes() {
		return this.clientes;
	}

	public void setClientes(Set<Cliente> clientes) {
		this.clientes = clientes;
	}

	public Set<HistoriaCli> getHistoriaClis() {
		return historiaClis;
	}

	public void setHistoriaClis(Set<HistoriaCli> historiaClis) {
		this.historiaClis = historiaClis;
	}

	
}
