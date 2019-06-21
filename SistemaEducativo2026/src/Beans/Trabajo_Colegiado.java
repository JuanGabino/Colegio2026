package Beans;

import java.io.InputStream;


public class Trabajo_Colegiado {

	private String idsesion;
	private String titulo;
	private String area;
	private String fecha;
	private String docente;
	private InputStream archivo;
	private byte[] archivo2;
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
	public String getArea() {
		return area;
	}
	public void setArea(String area) {
		this.area = area;
	}
	public String getFecha() {
		return fecha;
	}
	public void setFecha(String fecha) {
		this.fecha = fecha;
	}
	public String getDocente() {
		return docente;
	}
	public void setDocente(String docente) {
		this.docente = docente;
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
