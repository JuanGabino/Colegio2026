package Beans;

import java.io.InputStream;

public class Sesion_Aprendizaje {
	
	private String idsesion;
	private String titulo;
	private String nivelacion;
	private String seccion;
	private String curso;
	private String docente;
	private InputStream archivo;
	private byte[] archivo2;
	private String fechaCreacion;
	private String estado;
	
	
	public String getIdsesion() {
		return idsesion;
	}
	public void setIdsesion(String idsesion) {
		this.idsesion = idsesion;
	}
	public String getTitulo() {
		return titulo;
	}
	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}
	public String getNivelacion() {
		return nivelacion;
	}
	public void setNivelacion(String nivelacion) {
		this.nivelacion = nivelacion;
	}
	public String getSeccion() {
		return seccion;
	}
	public void setSeccion(String seccion) {
		this.seccion = seccion;
	}
	public String getCurso() {
		return curso;
	}
	public void setCurso(String curso) {
		this.curso = curso;
	}
	public String getDocente() {
		return docente;
	}
	public void setDocente(String docente) {
		this.docente = docente;
	}
	public String getFechaCreacion() {
		return fechaCreacion;
	}
	public void setFechaCreacion(String fechaCreacion) {
		this.fechaCreacion = fechaCreacion;
	}
	public InputStream getArchivo() {
		return archivo;
	}
	public void setArchivo(InputStream archivo) {
		this.archivo = archivo;
	}
	public byte[] getArchivo2() {
		return archivo2;
	}
	public void setArchivo2(byte[] archivo2) {
		this.archivo2 = archivo2;
	}
	public String getEstado() {
		return estado;
	}
	public void setEstado(String estado) {
		this.estado = estado;
	}
	

}
