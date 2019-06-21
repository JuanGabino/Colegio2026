package Jdbc;


import Beans.Observaciones;
import Beans.DetalleObservacion;
import Util.Conexion;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class ObservacionesJDBC {

	public boolean registrarObservacion(Observaciones bean)
	{
		boolean resultado = false;
		String sql = "CALL registrar_observaciones (?,?,?,?,?,?)";
		
		try 
		{
			Conexion con = new Conexion();
			PreparedStatement ps = con.executePreparedStatement(sql);

			ps.setString(1, bean.getObervaciones());
			ps.setString(2, bean.getAlumno());
			ps.setString(3, bean.getFecha());
			ps.setString(4, bean.getSeccion());
			ps.setString(5, bean.getCurso());
			ps.setString(6, bean.getDocente());

			
			resultado = ps.executeUpdate() == 1 ? true : false;
			
			System.out.println("Se realizo el QUERY de Obervaciones correctamente");
			
		}catch(Exception e) {
			
			System.out.print("Error : " + e.getMessage());
			e.getStackTrace();
			
		}
		

		return resultado;
		
	}
	
	public boolean registrarDetalleObservaciones(DetalleObservacion bean)
	{
		
		boolean resultado = false;
		String sql = "insert into det_obs_alum values (?,?)";
		
		try
		{
			Conexion con = new Conexion();
			PreparedStatement ps = con.executePreparedStatement(sql);
			
			ps.setString(1, bean.getIdalumno());
			ps.setString(2, bean.getIdobservacion());
			
			resultado = ps.executeUpdate() == 1 ? true : false;
			
			System.out.println("Se realizo el INSERT del detalle Observaciones correctamente");
			
		} catch(Exception e) {
			
			System.out.print("Error : " + e.getMessage());
			e.getStackTrace();
		}
		
		return resultado;
	}
	
	public  StringBuilder buscarObservacion(String dni, String seccion)
	{
		StringBuilder lista = new StringBuilder();
		String sql = "select o.idObservaciones, o.observacion, a.nombre, a.apellidoPat, a.apellidoMat, s.grado, c.asignatura, o.fecha_Registro " + 
				" from observaciones o, alumnos a, secciones s, cursos c where o.idAlumno = a.idAlumno and  s.idSeccion = o.seccion and " + 
				"o.curso = c.idCurso and o.seccion='"+seccion+"' and o.idDocente='"+dni+"'";
		
		try
		{
			Conexion con = new Conexion();
			ResultSet rs = con.executeQuery(sql);
			
		
			while(rs.next()) {
				
				lista.append(rs.getString(1) + "/" + rs.getString(2) + "/" + rs.getString(3) + "/" +  rs.getString(4) + "/" +  rs.getString(5) + "/" +  rs.getString(6)  + "/" + rs.getString(7)  + "/"  + rs.getString(8)  + "/"  +  "$");
			}			
			
			System.out.println("Se realizo la sentencia correcta: LISTA DE OBSERVACIONES" + lista);
			
			
		} catch(Exception e){
			
			e.getStackTrace();
		}
		
		return lista;
	}
	
	public boolean eliminarObservacion(String idobservacion) throws Exception
	{
		boolean resultado = false;
		String sql = "Delete from observaciones where idObservaciones='"+idobservacion+"';";
		
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
	
	public  StringBuilder buscarObservacionMensual(String dni, String seccion, String mes)
	{
		StringBuilder lista = new StringBuilder();
		String sql = "select o.idObservaciones, o.observacion, a.nombre, a.apellidoPat, a.apellidoMat, s.grado, c.asignatura, o.fecha_Registro " + 
				"from observaciones o, alumnos a, secciones s, cursos c where o.idAlumno = a.idAlumno and  s.idSeccion = o.seccion and  " + 
				"o.curso = c.idCurso and o.seccion='"+seccion+"' and o.idDocente='"+dni+"' and month(o.fecha_Registro) = '"+mes+"';";
		
		try
		{
			Conexion con = new Conexion();
			ResultSet rs = con.executeQuery(sql);
			
		
			while(rs.next()) {
				
				lista.append(rs.getString(1) + "/" + rs.getString(2) + "/" + rs.getString(3) + "/" +  rs.getString(4) + "/" +  rs.getString(5) + "/" +  rs.getString(6)  + "/" + rs.getString(7)  + "/"  + rs.getString(8)  + "/"  +  "$");
			}			
			
			System.out.println("Se realizo la sentencia correcta: LISTA DE OBSERVACIONES" + lista);
			
			
		} catch(Exception e){
			
			e.getStackTrace();
		}
		
		return lista;
	}
}
