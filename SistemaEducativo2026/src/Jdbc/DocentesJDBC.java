package Jdbc;


import java.sql.PreparedStatement;
import java.sql.ResultSet;

import Beans.Docentes;
import Beans.TareaDocente;
import Util.Conexion;

public class DocentesJDBC {
	
	public boolean registrarDocente(Docentes bean)
	{
		boolean resultado = false;
		
		String sql = "CALL registrar_docente (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		
		try 
		{
			Conexion con = new Conexion();
			PreparedStatement ps = con.executePreparedStatement(sql);
			
			ps.setString(1, bean.getDni());
			ps.setString(2, bean.getNombre());
			ps.setString(3, bean.getApellidopat());
			ps.setString(4, bean.getApellidomat());
			ps.setInt(5, bean.getEdad());
			ps.setString(6, bean.getTurno());
			ps.setString(7, bean.getCorreo());
			ps.setString(8,   bean.getFechaContrato());
			ps.setString(9, bean.getFechaNacimiento());
			ps.setString(10, bean.getCarreraPublica());
			ps.setInt(11, bean.getTitulado());
			ps.setInt(12, bean.getMagister());
			ps.setInt(13, bean.getDoctorado());
			ps.setInt(14, bean.getTelefono());
			ps.setString(15,  bean.getNivel());
			
			
			resultado = ps.executeUpdate() == 1 ? true : false;
			
			System.out.println("Se realizo el INSERT DEL DOCENTE correctamente");
			
		}catch(Exception e) {
			
			System.out.print("Error : " + e.getMessage());
			e.getStackTrace();
			
		}
		

		return resultado;
	}
	
	public Docentes buscarDocente(String nombre, String apellidopat, String apellidomat, String dni) throws Exception {
		
		String sql = "SELECT *  FROM docentes WHERE nombre=? AND apellidoPat=? AND apellidomat=? OR dniDocente=?";
		Docentes bean = new Docentes();
		try {
			
			Conexion con = new Conexion();
			PreparedStatement ps = con.executePreparedStatement(sql);
			ps.setString(1, nombre);
			ps.setString(2, apellidopat);
			ps.setString(3, apellidomat);
			ps.setString(4, dni);
			ResultSet rs = ps.executeQuery();
			System.out.println("Ejecuta sql : " + sql);

			if (rs.next()) {
				bean.setDni(rs.getString(2));
				bean.setNombre(rs.getString(3));
				bean.setApellidopat(rs.getString(4));
				bean.setApellidomat(rs.getString(5));
				bean.setEdad(rs.getInt(6));
				bean.setTurno(rs.getString(7));
				bean.setCorreo(rs.getString(8));
				bean.setFechaContrato(rs.getString(9));
				bean.setFechaNacimiento(rs.getString(10));
				bean.setCarreraPublica(rs.getString(11));
				bean.setTitulado(rs.getInt(12));
				bean.setMagister(rs.getInt(13));
				bean.setDoctorado(rs.getInt(14));
				bean.setTelefono(rs.getInt(15));
				bean.setNivel(rs.getString(16));
			}
		} catch (Exception e) {
			System.out.print("Error : " + e.getMessage());
			e.printStackTrace();
		}
		return bean;
	}
	
	public StringBuilder buscarDocentexDni(String dni)
	{
		StringBuilder lista = new StringBuilder();
		String sql = "select idDocente, nombre, apellidoPat, apellidoMat from docentes where dniDocente = '"+dni+"';";
		
		try 
		{
			Conexion con = new Conexion();
			ResultSet rs = con.executeQuery(sql);
			
			while (rs.next()) {
				
				lista.append(rs.getString(1) + "/" + rs.getString(2) + "/" + rs.getString(3) + "/" + rs.getString(4) + "/" + "$");
			}
			
			System.out.println("lista: " + lista);
			

		} catch (Exception e) {
			 
			System.out.println("Error : " + e.getMessage());
			e.printStackTrace();
		}
		
		return lista;
		
	}
	
	public StringBuilder listarDocente()
	{
		StringBuilder lista = new StringBuilder();
		String sql = "select idDocente, dniDocente, nombre, apellidoPat, apellidoMat, edad, turno, correo, fechaContrato, fechaNacimiento, " +
					"carreraPublica, titulado, magister, doctorado, telefono, nivel from docentes";
		
		try 
		{
			Conexion con = new Conexion();
			ResultSet rs = con.executeQuery(sql);
			
			while (rs.next()) {
				
				lista.append(rs.getString(1) + "|" + rs.getString(2) + "|" + rs.getString(3) + "|" + rs.getString(4) + "|" + rs.getString(5) + "|" +
							rs.getString(6) + "|" + rs.getString(7) + "|" + rs.getString(8) + "|" + rs.getString(9) + "|" + rs.getString(10) + "|" + 
							rs.getString(11) + "|" + rs.getString(12) + "|" + rs.getString(13) + "|" + rs.getString(14) + "|" + rs.getString(15) + "|" + 
							rs.getString(16) + "|" + "$");
			}
			
			System.out.println("lista: " + lista);
			

		} catch (Exception e) {
			 
			System.out.println("Error : " + e.getMessage());
			e.printStackTrace();
		}
		
		return lista;
		
	}
	
	public boolean actualizarDocente(Docentes bean) throws Exception {
		boolean resultado = false;
		String sql = "update docentes set nombre = '" + bean.getNombre() + "'"
				+ ", apellidoPat='" + bean.getApellidopat() + "'"
				+ ", apellidoMat='" + bean.getApellidomat() + "'"
				+ ", edad= " + bean.getEdad() 
				+ ", turno= '" + bean.getTurno() + "'"
				+ ", correo='" + bean.getCorreo() + "'"
				+ ", fechaContrato='" + bean.getFechaContrato() + "'"
				+ ", fechaNacimiento='" + bean.getFechaNacimiento() + "'"
				+ ", carreraPublica='" + bean.getCarreraPublica() + "'"
				+ ", titulado=" + bean.getTitulado() 
				+ ", magister=" + bean.getMagister()
				+ ", doctorado=" + bean.getDoctorado()
				+ ", telefono=" + bean.getTelefono()
				+ ", nivel='" + bean.getNivel() + "'"
				+ " where dniDocente = '" +bean.getDni() + "';";
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
	
	public boolean eliminarDocente(String codigo) throws Exception
	{
		boolean resultado = false;
		
		String sql = "Delete from docentes where idDocente = '"+codigo+"';";
		
		try 
		{
			Conexion con = new Conexion();
			
			resultado = con.executeUpdate(sql) == 1 ? true:false;
			
			System.out.println("Ejecuta sql:" + sql);
			
		} catch(Exception e)
		{
			System.out.println("Error: " + e.getMessage());
			e.printStackTrace();
		}
		
		return resultado;
		
	}
	
	public StringBuilder buscarDocentexcodigo()
	{
		StringBuilder lista = new StringBuilder();
		String sql = "select idDocente, dniDocente, nombre, apellidoPat, apellidoMat from docentes;";
		
		try 
		{
			Conexion con = new Conexion();
			ResultSet rs = con.executeQuery(sql);
			
			while (rs.next()) {
				
				lista.append(rs.getString(1) + "/" + rs.getString(2) + "/" + rs.getString(3) + "/" + rs.getString(4) + "/" + rs.getString(5) + "/" + "$");
			}
			
			System.out.println("lista: " + lista);
			

		} catch (Exception e) {
			 
			System.out.println("Error : " + e.getMessage());
			e.printStackTrace();
		}
		
		return lista;
		
	}
	
	public StringBuilder buscarDocenteSeccion(String codigo)
	{
		StringBuilder lista = new StringBuilder();
		String sql = "select s.idSeccion, s.grado from secciones s inner join doc_sec_cur d where s.idSeccion = d.id_seccion and d.id_docente = '"+codigo+"';";
		
		try 
		{
			Conexion con = new Conexion();
			ResultSet rs = con.executeQuery(sql);
			
			while (rs.next()) {
				
				lista.append(rs.getString(1) + "/" + rs.getString(2) + "/" + "$");
			}
			
			System.out.println("lista: " + lista);
			

		} catch (Exception e) {
			 
			System.out.println("Error : " + e.getMessage());
			e.printStackTrace();
		}
		
		return lista;
		
	}
	
	public StringBuilder listarComunicadoDocente(String codigo, String seccion, int fecha)
	{
		StringBuilder lista = new StringBuilder();
		String sql = "select c.idComunicado, c.tipo, c.fecha_Registro  " + 
				"from docentes d inner join comunicado c where d.idDocente = c.idDocente and d.idDocente = '"+codigo+"' and " + 
				"c.seccion = '"+seccion+"' and month(c.fecha_Registro) = '"+fecha+"';";
		
		try 
		{
			Conexion con = new Conexion();
			ResultSet rs = con.executeQuery(sql);
			
			while (rs.next()) {
				
				lista.append(rs.getString(1) + "/" + rs.getString(2) + "/" + rs.getString(3) + "/" +  "$");
			}
			
			System.out.println("lista: " + lista);
			

		} catch (Exception e) {
			 
			System.out.println("Error : " + e.getMessage());
			e.printStackTrace();
		}
		
		return lista;
		
	}
	
	public boolean registrarTareaDocente(TareaDocente bean)
	{
		
		boolean resultado = false;
		
		String sql = "insert into tareadocente(areaCurricular, dni_Docente, nombre_Docente, paterno_Docente, materno_Docente, nivel, curso, tarea, fecha_inicio, fecha_fin) values (?,?,?,?,?,?,?,?,?,?);";
		
		try 
		{
			Conexion con = new Conexion();
			PreparedStatement ps = con.executePreparedStatement(sql);
			
			ps.setString(1, bean.getArea());
			ps.setString(2, bean.getDni());
			ps.setString(3, bean.getNombre());
			ps.setString(4, bean.getPaterno());
			ps.setString(5, bean.getMaterno());
			ps.setString(6, bean.getNivel());
			ps.setString(7, bean.getCurso());
			ps.setString(8, bean.getTarea());
			ps.setString(9, bean.getInicio());
			ps.setString(10, bean.getFin());
			
			
			resultado = ps.executeUpdate() == 1 ? true : false;
			
			System.out.println("Se realizo el INSERT DE TAREAS correctamente:" + resultado);
			
		} catch(Exception e)
		{
			System.out.print("Error : " + e.getMessage());
			e.getStackTrace();
		}
		
		return resultado;
	}
	
	public StringBuilder listarTarea(String curso)
	{
		StringBuilder lista = new StringBuilder();
		String sql = "select dni_Docente, nombre_Docente, paterno_Docente, materno_Docente, nivel, curso, " + 
				"tarea, fecha_inicio, fecha_fin, case when fecha_fin < current_date() then 'Caducado' else 'Vigente' end tipo " + 
				"from tareadocente where areaCurricular = '"+curso+"'" + 
				"order by fecha_inicio desc;";
		
		try 
		{
			Conexion con = new Conexion();
			ResultSet rs = con.executeQuery(sql);
			
			while (rs.next()) {
				
				lista.append(rs.getString(1) + "/" + rs.getString(2) + "/" + rs.getString(3) + "/" + rs.getString(4) + "/" + rs.getString(5) + "/" + rs.getString(6) + "/" + 
							rs.getString(7) + "/" + rs.getString(8) + "/"  + rs.getString(9) + "/" +   rs.getString(10) + "/" +  "$");
			}
			
			System.out.println("lista: " + lista);
			

		} catch (Exception e) {
			 
			System.out.println("Error : " + e.getMessage());
			e.printStackTrace();
		}
		
		return lista;
		
	}
}
