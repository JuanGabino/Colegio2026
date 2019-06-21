package Jdbc;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import Beans.ActividadesColegiado;
import Beans.InteraccionDocente;
import Beans.Sesion_Aprendizaje;
import Beans.Trabajo_Colegiado;
import Util.Conexion;

public class TrabajoColegiadoJDBC {

	
	public boolean agregar_TrabajoColegiado(Trabajo_Colegiado bean)
	{
		boolean resultado = false;
		
		String sql = "CALL registrar_colegiado (?,?,?,?,?,?)";
		
		try 
		{
			Conexion con = new Conexion();
			PreparedStatement ps = con.executePreparedStatement(sql);
			
			ps.setString(1, bean.getTitulo());
			ps.setString(2, bean.getArea());
			ps.setString(3, bean.getFecha());
			ps.setString(4, bean.getDocente());
			ps.setBlob(5, bean.getArchivo());
			ps.setString(6, bean.getEstado());
			
			resultado = ps.executeUpdate() == 1 ? true : false;
			
			System.out.println("Se realizo el INSERT DE TRABAJO COLEGIADO correctamente");
			
		}catch(Exception e) {
			
			System.out.print("Error : " + e.getMessage());
			e.getStackTrace();
			
		}
		

		return resultado;
		
	}
	
	public boolean agregar_Interaccion(InteraccionDocente bean)
	{
		boolean resultado = false;
		
		String sql = "insert into interacionDocente(dniDocente, nombre, paterno, materno, area, archivo, observacion) values (?,?,?,?,?,?,?)";
		
		try 
		{
			Conexion con = new Conexion();
			PreparedStatement ps = con.executePreparedStatement(sql);
			
			ps.setString(1, bean.getDni());
			ps.setString(2, bean.getNombre());
			ps.setString(3, bean.getPaterno());
			ps.setString(4, bean.getMaterno());
			ps.setString(5, bean.getArea());
			ps.setBlob(6, bean.getArchivo());
			ps.setString(7, bean.getObservacion());
			
			resultado = ps.executeUpdate() == 1 ? true : false;
			
			System.out.println("Se realizo el INSERT DE interaccion docente correctamente");
			
		}catch(Exception e) {
			
			System.out.print("Error : " + e.getMessage());
			e.getStackTrace();
			
		}
		

		return resultado;
		
	}
	
	public ArrayList<InteraccionDocente> listarInteraccion()
	{
		ArrayList<InteraccionDocente> lista = new ArrayList<InteraccionDocente>();
		String sql = "select * from interaciondocente;";
		
		try
		{
			Conexion con = new Conexion();
			ResultSet rs = con.executeQuery(sql);
			
		 
			while(rs.next()) {
				
				InteraccionDocente bean = new InteraccionDocente();
				bean.setId(rs.getInt(1));
				bean.setDni(rs.getString(2));
				bean.setNombre(rs.getString(3));
				bean.setPaterno(rs.getString(4));
				bean.setMaterno(rs.getString(5));
				bean.setArea(rs.getString(6));
				bean.setArchivo2(rs.getBytes(7));
				bean.setObservacion(rs.getString(8));
				
				lista.add(bean);
			}			
			
			System.out.println("Se realizo la sentencia correcta: LISTA DE SESIONES: " + lista);
			
			
		} catch(Exception e){
			
			e.getStackTrace();
		}
		
		return lista;
		
	}
	
	
	public ArrayList<ActividadesColegiado> listarActividades(String area)
	{
		ArrayList<ActividadesColegiado> lista = new ArrayList<ActividadesColegiado>();
		String sql = "select t.idSesion, d.idDocente, d.nombre, d.apellidoPat, d.apellidoMat, t.titulo, t.fecha_registro, " + 
				"t.archivo, t.estado from docentes d inner join trabajo_colegiado t " + 
				"on d.idDocente = t.docente where t.area_curricular = '"+area+"';";
		
		try
		{
			Conexion con = new Conexion();
			ResultSet rs = con.executeQuery(sql);
			
		 
			while(rs.next()) {
				
				ActividadesColegiado bean = new ActividadesColegiado();
				
				bean.setCodigo(rs.getString(1));
				bean.setDocente(rs.getString(2));
				bean.setNombre(rs.getString(3));
				bean.setPaterno(rs.getString(4));
				bean.setMaterno(rs.getString(5));
				bean.setTitulo(rs.getString(6));
				bean.setFecha(rs.getString(7));
				bean.setArchivo2(rs.getBytes(8));
				bean.setEstado(rs.getString(9));
				
				lista.add(bean);
			}			
			
			System.out.println("Se realizo la sentencia correcta: LISTA DE ENTREGABLES: " + lista);
			
			
		} catch(Exception e){
			
			e.getStackTrace();
		}
		
		return lista;
		
	}
	
	public boolean modificarColegiado(String codigo, String estado)
	{
		boolean resultado = false;
		String sql="";
		
		try{
			
			Conexion con = new Conexion();
			if(codigo != null && estado != null) {
				
				sql ="update trabajo_colegiado set estado = '"+estado+"' where idSesion = '"+codigo+"';";
				
			} else {
				System.out.println("ERROR EN LA CONSULTA SQL");				
			}
			
			resultado = con.executeUpdate(sql) == 1 ? true : false;
			
		} catch(Exception e) {
			
			e.printStackTrace();
		}
		
		return resultado;
	}
}
