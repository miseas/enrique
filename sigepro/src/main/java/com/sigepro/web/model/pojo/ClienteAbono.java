package com.sigepro.web.model.pojo;

// Generated 30-jun-2013 19:41:32 by Hibernate Tools 3.4.0.CR1

import java.util.Date;

/**
 * ClienteAbono generated by hbm2java
 */
public class ClienteAbono implements java.io.Serializable {

	private ClienteAbonoId id;
	private Date alta;
	private Date baja;

	public ClienteAbono() {
	}

	public ClienteAbono(ClienteAbonoId id) {
		this.id = id;
	}

	public ClienteAbono(ClienteAbonoId id, Date alta, Date baja) {
		this.id = id;
		this.alta = alta;
		this.baja = baja;
	}

	public ClienteAbonoId getId() {
		return this.id;
	}

	public void setId(ClienteAbonoId id) {
		this.id = id;
	}

	public Date getAlta() {
		return this.alta;
	}

	public void setAlta(Date alta) {
		this.alta = alta;
	}

	public Date getBaja() {
		return this.baja;
	}

	public void setBaja(Date baja) {
		this.baja = baja;
	}

}
