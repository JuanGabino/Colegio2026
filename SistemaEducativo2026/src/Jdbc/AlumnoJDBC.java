package Jdbc;

import Beans.Alumno;
import Util.Conexion;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;


public class AlumnoJDBC {
	
	public Alumno buscarAlumno(String nombre)
	{
		Alumno bean = new Alumno();
		
		try {
			
			Conexion con = new Conexion();
			String sql = "select idAlumno, nombre, apellidoPat, apellidoMat, fechaNac, dniAlumno, seccion from alumnos where nombre = '" + nombre + "'";
			
			ResultSet rs = con.executeQuery(sql);
			
			while(rs.next()) {
				
				bean.setIdAlumno(rs.getString(1));
				bean.setNombre(rs.getString(2));
				bean.setApellidoPat(rs.getString(3));
				bean.setApellidoMat(rs.getString(4));
				bean.setFechaNac(rs.getString(5));
				bean.setDni(rs.getString(6));
				bean.setSeccion(rs.getString(7));
			}
			
			System.out.println("Se realizo la sentencia correcta");
			
		} catch (Exception e) {
			
			e.getStackTrace();
			System.out.println("El valor del nombre es" + "-" + nombre);
		}
		
		return bean;
	}

	
	public List<Alumno> alumnoxseccion(String seccion) 
	{

		System.out.println("El codigo de la seccion es" + seccion);
		List<Alumno> lista = new ArrayList<Alumno>();
		String sql = "select idAlumno, nombre, apellidoPat, apellidoMat from alumnos where seccion ='" + seccion + "';";
		
		try
		{
			Conexion con = new Conexion();
			ResultSet rs = con.executeQuery(sql);
			
			while(rs.next()) {
				
				Alumno bean = new Alumno();
				bean.setIdAlumno(rs.getString(1));
				bean.setNombre(rs.getString(2));
				bean.setApellidoPat(rs.getString(3));
				bean.setApellidoMat(rs.getString(4));
	
				lista.add(bean);
			}
			
			
			System.out.println("Se realizo la sentencia correcta");
			
		} catch(Exception e) {
			
			e.getStackTrace();
			System.out.println("No se realizo el QUERY");
		}
		
		return lista;
	}
	
	public Alumno buscarAlumnoId(String id)
	{
		Alumno bean = new Alumno();
		
		try 
		{
			Conexion con = new Conexion();
			String sql = "select idAlumno, nombre, apellidoPat, apellidoMat, seccion  from alumnos  where idAlumno = '" + id + "';";
			
			ResultSet rs = con.executeQuery(sql);
			
			while(rs.next()) {
				
				bean.setIdAlumno(rs.getString(1));
				bean.setNombre(rs.getString(2));
				bean.setApellidoPat(rs.getString(3));
				bean.setApellidoMat(rs.getString(4));
				bean.setSeccion(rs.getString(5));
			}
			System.out.println("Se encontre al Alumno");
			
		} catch(Exception e) {
			
			e.getStackTrace();
			System.out.println("El id del Alumno seleccionado es: " + id);
		}
 		
		return bean;
	}
	
	public StringBuilder listarProgresoAlumno(String seccion, String curso, int periodo, int anio)
	{
		StringBuilder lista = new StringBuilder();
		String sql = "select a.idAlumno, a.nombre, a.apellidoPat, a.apellidoMat, c.PromedioFinal " + 
				"from alumnos a,  calificaciones c where a.idAlumno = c.idAlumno " + 
				"and c.seccion = '"+seccion+"' and c.curso = '"+curso+"' and c.periodo = "+periodo+" and c.anio = "+anio+";";
		 
		try 
		{
			Conexion con = new Conexion();
			ResultSet rs = con.executeQuery(sql);
			
			while (rs.next()) {
				
				lista.append(rs.getString(1) + "/" + rs.getString(2) + "/" + rs.getString(3) + "/" + rs.getString(4) + "/" +"$");
			}
			
			System.out.println("lista: " + lista);

		} catch (Exception e) {
			 
			System.out.println("Error : " + e.getMessage());
			e.printStackTrace();
		}
		
		return lista;
	}
	
	public boolean registrarAlumnos(Alumno bean)
	{
		boolean resultado = false;
		
		String sql = "CALL registrar_alumnos (?,?,?,?,?,?,?,?,?)";
		
		try 
		{
			Conexion con = new Conexion();
			PreparedStatement ps = con.executePreparedStatement(sql);
			
			ps.setString(1, bean.getNombre());
			ps.setString(2, bean.getApellidoPat());
			ps.setString(3, bean.getApellidoMat());
			ps.setString(4, bean.getDni());
			ps.setInt(5, bean.getEdad());
			ps.setString(6, bean.getFechaNac());
			ps.setString(7, bean.getCorreo());
			ps.setString(8, bean.getSeccion());
			ps.setString(9, bean.getCodPadre());
			
			resultado = ps.executeUpdate() == 1 ? true : false;
			
			System.out.println("Se realizo el INSERT DE ALUMNOS correctamente");
			
		}catch(Exception e) {
			
			System.out.print("Error : " + e.getMessage());
			e.getStackTrace();
			
		}
		

		return resultado;
	}
	
	public StringBuilder listarAlumnos()
	{
		StringBuilder lista = new StringBuilder();
		String sql = "select * from alumnos";
		
		try 
		{
			Conexion con = new Conexion();
			ResultSet rs = con.executeQuery(sql);
			
			while (rs.next()) {
				
				lista.append(rs.getString(1) + "|" + rs.getString(2) + "|" + rs.getString(3) + "|" + rs.getString(4) + "|" + rs.getString(5) + "|" +
							rs.getString(6) + "|" + rs.getString(7) + "|" + rs.getString(8) + "|" + rs.getString(9) + "|" + rs.getString(10) + "|" +  "$");
			}
			
			System.out.println("lista: " + lista);
			

		} catch (Exception e) {
			 
			System.out.println("Error : " + e.getMessage());
			e.printStackTrace();
		}
		
		return lista;
		
	}
	
	public boolean modificarAlumno(Alumno bean) throws Exception {
		boolean resultado = false;
		String sql = "update alumnos set nombre = '" + bean.getNombre() + "'"
				+ ", apellidoPat ='" + bean.getApellidoPat() + "'"
				+ ", apellidoMat ='" + bean.getApellidoMat() + "'"
				+ ", edad = " + bean.getEdad() 
				+ ", correo = '" + bean.getCorreo()+ "'"
				+ ", dniAlumno ='" + bean.getDni() + "'"
				+ ", fechaNac ='" + bean.getFechaNac() + "'"
				+ ", seccion ='" + bean.getSeccion() + "'"
				+ " where idAlumno = '" +bean.getIdAlumno() + "';" ;
		try {
			Conexion con= new Conexion();
			
			resultado = con.executeUpdate(sql) == 1 ? true : false;
			System.out.print("sql : " + sql);
		} catch (Exception e) {
			System.out.print("Error : " + e.getMessage());
			e.printStackTrace();
		}
		return resultado;
	}
	
	public boolean eliminarAlumno(String codigo) throws Exception
	{
		boolean resultado = false;
		
		String sql = "Delete from alumnos where idAlumno = '"+codigo+"';";
		
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
}
