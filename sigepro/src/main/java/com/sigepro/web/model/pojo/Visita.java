package com.sigepro.web.model.pojo;

// Generated 24-jul-2013 23:20:53 by Hibernate Tools 3.4.0.CR1

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * Visita generated by hbm2java
 */
public class Visita implements java.io.Serializable {

	private Long idvisita;
	private Incidencia incidencia;
	private EstadoVis estadoVis;
	private String titulo;
	private String descripcion;
	private Date inicia;
	private Date termina;
	private String direccion;
	private Boolean diacompleto;
	private Set<HistoriaInc> historiaIncs = new HashSet<HistoriaInc>(0);
	private Set<HistoriaVis> historiaVises = new HashSet<HistoriaVis>(0);
	
	public Visita() {
	}

	public Visita(long idvisita) {
		this.idvisita = idvisita;
	}

	public Visita(long idvisita, Incidencia incidencia, String titulo,
			String descripcion, Date inicia, Date termina, Boolean diacompleto) {
		this.idvisita = idvisita;
		this.incidencia = incidencia;
		this.titulo = titulo;
		this.descripcion = descripcion;
		this.inicia = inicia;
		this.termina = termina;
		this.diacompleto = diacompleto;
	}

	public Long getIdvisita() {
		return this.idvisita;
	}

	public void setIdvisita(Long idvisita) {
		this.idvisita = idvisita;
	}


	public Incidencia getIncidencia() {
		return incidencia;
	}

	public void setIncidencia(Incidencia incidencia) {
		this.incidencia = incidencia;
	}

	public String getTitulo() {
		return this.titulo;
	}

	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}

	public String getDescripcion() {
		return this.descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}

	public Date getInicia() {
		return this.inicia;
	}

	public void setInicia(Date inicia) {
		this.inicia = inicia;
	}

	public Date getTermina() {
		return this.termina;
	}

	public void setTermina(Date termina) {
		this.termina = termina;
	}

	public Boolean getDiacompleto() {
		return this.diacompleto;
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

	public EstadoVis getEstadoVis() {
		return estadoVis;
	}

	public void setEstadoVis(EstadoVis estadoVis) {
		this.estadoVis = estadoVis;
	}

	public Set<HistoriaInc> getHistoriaIncs() {
		return historiaIncs;
	}

	public void setHistoriaIncs(Set<HistoriaInc> historiaIncs) {
		this.historiaIncs = historiaIncs;
	}

	public Set<HistoriaVis> getHistoriaVises() {
		return historiaVises;
	}

	public void setHistoriaVises(Set<HistoriaVis> historiaVises) {
		this.historiaVises = historiaVises;
	}

	
	
}
