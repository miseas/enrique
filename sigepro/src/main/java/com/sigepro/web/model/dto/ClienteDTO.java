package com.sigepro.web.model.dto;

public class ClienteDTO {
	
	private Integer idcliente;
	private String nombre;
	private String apellido;
	private String direccion;
	private Integer localidadId;
	private String localidad;
	private String email;
	private String telefono;
	private String telefono2;
	private String telefono3;
	private String notas;
	private String ccNro;
	private String puntuacion;
	private String fechaAgregado;
	private String cuit;
	private String estadoCliId;
	private String estadoCli;

	
	public Integer getIdcliente() {
		return idcliente;
	}
	public void setIdcliente(Integer idcliente) {
		this.idcliente = idcliente;
	}
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	
	public String getApellido() {
		return apellido;
	}
	public void setApellido(String apellido) {
		this.apellido = apellido;
	}
	public String getDireccion() {
		return direccion;
	}
	public void setDireccion(String direccion) {
		this.direccion = direccion;
	}
	public String getLocalidad() {
		return localidad;
	}
	public void setLocalidad(String localidad) {
		this.localidad = localidad;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getTelefono() {
		return telefono;
	}
	public void setTelefono(String telefono) {
		this.telefono = telefono;
	}
	public String getNotas() {
		return notas;
	}
	public void setNotas(String notas) {
		this.notas = notas;
	}
	public String getCcNro() {
		return ccNro;
	}
	public void setCcNro(String ccNro) {
		this.ccNro = ccNro;
	}
	public String getPuntuacion() {
		return puntuacion;
	}
	public void setPuntuacion(String puntuacion) {
		this.puntuacion = puntuacion;
	}
	public String getFechaAgregado() {
		return fechaAgregado;
	}
	public void setFechaAgregado(String fechaAgregado) {
		this.fechaAgregado = fechaAgregado;
	}
	public String getCuit() {
		return cuit;
	}
	public void setCuit(String cuit) {
		this.cuit = cuit;
	}
	public Integer getLocalidadId() {
		return localidadId;
	}
	public void setLocalidadId(Integer localidadId) {
		this.localidadId = localidadId;
	}
	public String getEstadoCliId() {
		return estadoCliId;
	}
	public void setEstadoCliId(String estadoCliId) {
		this.estadoCliId = estadoCliId;
	}
	public String getEstadoCli() {
		return estadoCli;
	}
	public void setEstadoCli(String estadoCli) {
		this.estadoCli = estadoCli;
	}
	public String getTelefono2() {
		return telefono2;
	}
	public void setTelefono2(String telefono2) {
		this.telefono2 = telefono2;
	}
	public String getTelefono3() {
		return telefono3;
	}
	public void setTelefono3(String telefono3) {
		this.telefono3 = telefono3;
	}
	
	
}
