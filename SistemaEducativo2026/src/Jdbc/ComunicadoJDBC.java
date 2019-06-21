package Jdbc;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import Beans.Comunicado;
import Beans.DetalleComunicado;
import Util.Conexion;

public class ComunicadoJDBC {

	public boolean registrarComunicado(Comunicado bean)
	{
		boolean resultado = false;
		
		String sql = "CALL registrar_comunicado (?,?,?,?,?)";
		
		try 
		{
			Conexion con = new Conexion();
			PreparedStatement ps = con.executePreparedStatement(sql);
			
			ps.setString(1, bean.getDescripcion());
			ps.setString(2, bean.getTipo());
			ps.setString(3, bean.getFechaRegistro());
			ps.setString(4, bean.getSeccion());
			ps.setString(5, bean.getDocente());
			
			resultado = ps.executeUpdate() == 1 ? true : false;
			
			System.out.println("Se realizo el INSERT DE COMUNICADO correctamente");
			
		}catch(Exception e) {
			
			System.out.print("Error : " + e.getMessage());
			e.getStackTrace();
			
		}
		

		return resultado;
	}
	
	public boolean registrarDetalleComunicado(DetalleComunicado bean)
	{
		boolean resultado = false;
		String sql = "insert into det_com_alum values (?,(select idComunicado from comunicado order by idComunicado desc limit 1))";
		
		try
		{
			Conexion con = new Conexion();
			PreparedStatement ps = con.executePreparedStatement(sql);
			
			ps.setString(1, bean.getIdAlumno());
			
			resultado = ps.executeUpdate() == 1 ? true : false;
			
			System.out.println("Se realizo el INSERT del detalle comunicado correctamente");
			
		} catch(Exception e) {
			
			System.out.print("Error : " + e.getMessage());
			e.getStackTrace();
		}
		
		return resultado;
	}
	
	public List<Comunicado> buscarComunicado(String dni, String seccion)
	{
		List<Comunicado> lista = new ArrayList<Comunicado>();
		String sql = "select  c.idComunicado, c.descripcion, c.fecha_Registro, c.tipo from comunicado c where c.seccion='"+seccion+"' and c.idDocente = '"+dni+"'";
		
		try
		{
			Conexion con = new Conexion();
			ResultSet rs = con.executeQuery(sql);
			
		
			while(rs.next()) {
				
				Comunicado bean = new Comunicado();
				bean.setIdComunicado(rs.getString(1));
				bean.setDescripcion(rs.getString(2));
				bean.setFechaRegistro(rs.getString(3));
				bean.setTipo(rs.getString(4));
				
				lista.add(bean);
			}			
			
			System.out.println("Se realizo la sentencia correcta: LISTA DE Comunicados" + lista);
			
			
		} catch(Exception e){
			
			e.getStackTrace();
		}
		
		return lista;
	}
	
	public boolean modificarComunicado(String tipo, String fecha, String descripcion, String id)
	{
		boolean resultado = false;
		String sql="";
		
		try{
			
			Conexion con = new Conexion();
			if(tipo != null && fecha != null && descripcion != null) {
				
				sql ="update comunicado set descripcion = '"+descripcion+"', fecha_Mod = '"+fecha+"', tipo ='"+tipo+"' where idComunicado='"+id+"';";
				
			} else {
				System.out.println("ERROR EN LA CONSULTA SQL");				
			}
			
			resultado = con.executeUpdate(sql) == 1 ? true : false;
			
		} catch(Exception e) {
			
			e.printStackTrace();
		}
		
		return resultado;
	}
	
	public boolean eliminarComunicado(String idcomunicado) throws Exception
	{
		boolean resultado = false;
		String sql = "Delete from comunicado where idComunicado='"+idcomunicado+"';";
		
		try{
			Conexion con = new Conexion();
			
			resultado = con.executeUpdate(sql) == 1?true:false;
			
			System.out.println("Ejecuta sql:" + sql);
			
		}catch(Exception e){
			
			System.out.print("Error : " + e.getMessage());
			e.printStackTrace();
		}
		return resultado;
	}
	
	public boolean eliminarDetalleComunicado(String idcomunicado) throws Exception
	{
		boolean resultado = false;
		String sql = "Delete from det_com_alum where idComunicado='"+idcomunicado+"';";
		
		try{
			Conexion con = new Conexion();
			
			resultado = con.executeUpdate(sql) == 1?true:false;
			
			System.out.println("Ejecuta sql:" + sql);
			
		}catch(Exception e){
			
			System.out.print("Error : " + e.getMessage());
			e.printStackTrace();
		}
		return resultado;
	}
	
	public List<Comunicado> buscarComunicadoNivelacion(String codigo)
	{
		List<Comunicado> lista = new ArrayList<Comunicado>();
		String sql = "select  c.idComunicado, c.descripcion, c.fecha_Registro, c.tipo, c.seccion from comunicado c " + 
						"where c.idDocente = (select idDocente from docentes where dniDocente = '"+codigo+"') and c.tipo = 'Nivelacion';";
		
		try
		{
			Conexion con = new Conexion();
			ResultSet rs = con.executeQuery(sql);
			
		
			while(rs.next()) {
				
				Comunicado bean = new Comunicado();
				bean.setIdComunicado(rs.getString(1));
				bean.setDescripcion(rs.getString(2));
				bean.setFechaRegistro(rs.getString(3));
				bean.setTipo(rs.getString(4));
				bean.setSeccion(rs.getString(5));
				
				lista.add(bean);
			}			
			
			System.out.println("Se realizo la sentencia correcta: LISTA DE Comunicados Nivelación" + lista);
			
			
		} catch(Exception e){
			
			e.getStackTrace();
		}
		
		return lista;
	}
	
	public StringBuilder visualizarComunicado(String codigo)
	{
		StringBuilder lista = new StringBuilder();
		String sql = "select c.idAlumno, a.nombre, a.apellidoPat, a.apellidoMat, " + 
				"p.codPadre, p.nomPadre, p.apePat_Padre, p.apeMat_Padre " + 
				"from alumnos a inner join det_com_alum c on c.idAlumno = a.idAlumno " + 
				"inner join padres p on p.codPadre = a.idPadre " + 
				"where c.idComunicado = '"+codigo+"';";
		
		try 
		{
			Conexion con = new Conexion();
			ResultSet rs = con.executeQuery(sql);
			
			while (rs.next()) {
				
				lista.append(rs.getString(1) + "/" + rs.getString(2) + "/"  + rs.getString(3) + "/"+ rs.getString(4) + "/" + rs.getString(5) + "/" + rs.getString(6) + "/" + rs.getString(7) + "/" + 
								rs.getString(8) +  "/" + "$");
			}
			
			System.out.println("lista: " + lista);
			

		} catch (Exception e) {
			 
			System.out.println("Error : " + e.getMessage());
			e.printStackTrace();
		}
		
		return lista;
		
	}
	
	public List<Comunicado> buscarComunicadoAlumno(String codigo)
	{
		List<Comunicado> lista = new ArrayList<Comunicado>();
		String sql = "select c.idComunicado, c.descripcion, c.tipo, c.fecha_Registro, c.seccion " + 
				"from comunicado c inner join det_com_alum det on c.idComunicado = det.idComunicado " + 
				"where det.idAlumno = '"+codigo+"';";
		
		try
		{
			Conexion con = new Conexion();
			ResultSet rs = con.executeQuery(sql);
			
		
			while(rs.next()) {
				
				Comunicado bean = new Comunicado();
				bean.setIdComunicado(rs.getString(1));
				bean.setDescripcion(rs.getString(2));
				bean.setFechaRegistro(rs.getString(3));
				bean.setTipo(rs.getString(4));
				
				lista.add(bean);
			}			
			
			System.out.println("Se realizo la sentencia correcta: LISTA DE Comunicados" + lista);
			
			
		} catch(Exception e){
			
			e.getStackTrace();
		}
		
		return lista;
	}
}
