package Jdbc;

import Beans.Seccion;
import Util.Conexion;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class SeccionJDBC {

	public List<Seccion> listarSeccion(String dni)
	{
		
		System.out.println("El numero de dni es" + dni);
		List<Seccion> lista = new ArrayList<Seccion>();
		String sql = "select s.idSeccion, s.grado from secciones as s inner join doc_sec_cur as d on d.id_seccion = s.idSeccion " + 
				"where d.id_docente = (select idDocente from docentes where dniDocente = '"+dni+"');"; 
		
		try 
		{
			Conexion con = new Conexion();
			
			ResultSet rs = con.executeQuery(sql);
			
			while (rs.next()) {
				
				Seccion bean = new Seccion();
				bean.setIdSeccion(rs.getString(1));
				bean.setGrado(rs.getString(2));
				
				lista.add(bean);
			}
			System.out.println("Se realizo la sentencia" + lista);
			
		} catch(Exception e) {
			
			e.getStackTrace();
			System.out.println("El valor del nombre es");
		}
		
		return lista;
		
	}
	
	public List<Seccion> listarSeccionColegio()
	{
		List<Seccion> lista = new ArrayList<Seccion>();
		String sql = "select * from secciones"; 
		
		try 
		{
			Conexion con = new Conexion();
			
			ResultSet rs = con.executeQuery(sql);
			
			while (rs.next()) {
				
				Seccion bean = new Seccion();
				bean.setIdSeccion(rs.getString(1));
				bean.setGrado(rs.getString(2));
				
				lista.add(bean);
			}
			System.out.println("Se realizo la sentencia de todas las secciones" + lista);
			
		} catch(Exception e) {
			
			e.getStackTrace();
			System.out.println("ERROR NO SE LISTO LAS SECCIONES");
		}
		
		return lista;
		
	}
	
	public StringBuilder cantidadxSeccion(String seccion)
	{
		StringBuilder lista = new StringBuilder();
		String sql = "select count(idAlumno) as cantidad " + 
				"from alumnos where seccion = '"+seccion+"';";
		
		try 
		{
			Conexion con = new Conexion();
			ResultSet rs = con.executeQuery(sql);
			
			while (rs.next()) {
				
				lista.append(rs.getString(1) + "/" +"$");
			}
			
			

		} catch (Exception e) {
			 
			System.out.println("Error : " + e.getMessage());
			e.printStackTrace();
		}
		
		return lista;
	}
	
	public List<Seccion> listarSeccionxCurso(String dni, String curso)
	{
		
		System.out.println("DNI: " + dni + "Curso: " + curso);
		List<Seccion> lista = new ArrayList<Seccion>();
		String sql = "select d.id_seccion, s.grado from doc_sec_cur d inner join secciones s " + 
				"on d.id_seccion = s.idSeccion and d.id_docente = (select idDocente from docentes where dniDocente = '"+dni+"') and d.id_curso = '"+curso+"';"; 
		
		try 
		{
			Conexion con = new Conexion();
			
			ResultSet rs = con.executeQuery(sql);
			
			while (rs.next()) {
				
				Seccion bean = new Seccion();
				bean.setIdSeccion(rs.getString(1));
				bean.setGrado(rs.getString(2));
				
				lista.add(bean);
			}
			System.out.println("Secciones: " + lista);
			
		} catch(Exception e) {
			
			System.out.println("Error : "+e.getMessage());
			e.printStackTrace();
		}
		
		return lista;
		
	}
}
