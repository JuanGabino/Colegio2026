
package Jdbc;
 
import Beans.Sesion_Aprendizaje;
import Util.Conexion;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;


public class Sesion_AprendizajeJDBC {
	
	
	public boolean agregarSesion_Aprendizaje(Sesion_Aprendizaje bean)
	{
		boolean resultado = false;
		
		String sql = "CALL registrar_sesion_aprendizaje (?,?,?,?,?,?,?,?)";
		
		try 
		{
			Conexion con = new Conexion();
			PreparedStatement ps = con.executePreparedStatement(sql);
			
			ps.setString(1, bean.getTitulo());
			ps.setString(2, bean.getNivelacion());
			ps.setString(3, bean.getSeccion());
			ps.setString(4, bean.getCurso());
			ps.setString(5, bean.getDocente());
			ps.setBlob(6, bean.getArchivo());
			ps.setString(7, bean.getFechaCreacion());
			ps.setString(8, bean.getEstado());
			
			resultado = ps.executeUpdate() == 1 ? true : false;
			
			System.out.println("Se realizo el INSERT DE APRENDIZAJE correctamente");
			
		}catch(Exception e) {
			
			System.out.print("Error : " + e.getMessage());
			e.getStackTrace();
			
		}
		

		return resultado;
		
	}
	
	
	public boolean eliminarSesion(String codigo) throws Exception
	{
		boolean resultado = false;
		
		String sql = "Delete from sesion_aprendizaje where idSesion = '"+codigo+"';";
		
		try 
		{
			Conexion con = new Conexion();
			resultado = con.executeUpdate(sql) == 1 ? true : false;
			
			System.out.println("Ejecuta sql:" + sql);
			System.out.println("Respuesta JDBC: " + resultado);
			
		} catch(Exception e)
		{
			System.out.println("Error: " + e.getMessage());	
			e.printStackTrace();
		}
		
		return resultado;
		
	}

	
	
	public ArrayList<Sesion_Aprendizaje> listarArchivosPdf(String docente, String nivelacion){
	
		ArrayList<Sesion_Aprendizaje> lista = new ArrayList<Sesion_Aprendizaje>();
		String sql = "select * from sesion_aprendizaje " + 
				"where docente = '"+docente+"' and grupo_Nivelacion = '"+nivelacion+"';";
		
		try
		{
			Conexion con = new Conexion();
			ResultSet rs = con.executeQuery(sql);
			
		
			while(rs.next()) {
				
				Sesion_Aprendizaje bean = new Sesion_Aprendizaje();
				bean.setIdsesion(rs.getString(1));
				bean.setTitulo(rs.getString(2));
				bean.setNivelacion(rs.getString(3));
				bean.setSeccion(rs.getString(4));
				bean.setCurso(rs.getString(5));
				bean.setDocente(rs.getString(6));
				bean.setArchivo2(rs.getBytes(7));
				bean.setFechaCreacion(rs.getString(8));
				bean.setEstado(rs.getString(9));
				
				lista.add(bean);
			}			
			
			System.out.println("Se realizo la sentencia correcta: LISTA DE SESIONES: " + lista);
			
			
		} catch(Exception e){
			
			e.getStackTrace();
		}
		
		return lista;
			
	}
	
	
	public StringBuilder listarSesionesAprendizaje(String docente, String nivelacion)
	{
		StringBuilder lista = new StringBuilder();
		String sql = "select s.idSesion, s.titulo, s.grupo_Nivelacion, n.descripcion, s.curso, n.fechadeCreacion, " + 
				"n.fechaInicio, n.fechaFin, s.archivo, s.fecha_Creacion " + 
				"from sesion_aprendizaje s inner join nivelacion_estudio n on s.grupo_Nivelacion = n.idNivelacion " + 
				"where s.docente = '"+docente+"' and s.grupo_Nivelacion = '"+nivelacion+"';";
		
		try 
		{
			Conexion con = new Conexion();
			ResultSet rs = con.executeQuery(sql);
			
			while (rs.next()) {
				
				lista.append(rs.getString(1) + "|" + rs.getString(2) + "|"  + rs.getString(3) + "|"+ rs.getString(4) + "|" + rs.getString(5) + "|" + rs.getString(6) + "|" + rs.getString(7) + "|" + 
								rs.getString(8) +  "|" + rs.getBytes(9) + "|" + rs.getString(10) + "|" +  "$");
			}
			
			System.out.println("lista: " + lista);
			

		} catch (Exception e) {
			 
			System.out.println("Error : " + e.getMessage());
			e.printStackTrace();
		}
		
		return lista;
		
	}
	
	public boolean modificarSesion(String codigo, String estado)
	{
		boolean resultado = false;
		String sql="";
		
		try{
			
			Conexion con = new Conexion();
			if(codigo != null && estado != null) {
				
				sql ="update sesion_aprendizaje set estado = '"+estado+"' where idSesion = '"+codigo+"';";
				
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
