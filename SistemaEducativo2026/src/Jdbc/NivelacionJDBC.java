package Jdbc;

import Beans.Nivelacion;
import Beans.DetalleNivelacion;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import Util.Conexion;

public class NivelacionJDBC {

	public boolean registrarNivelacion(Nivelacion bean)
	{
		boolean resultado = false;
		
		String sql = "CALL registrar_grupoNivelacion (?,?,?,?,?,?,?,?,?,?,?,?)";
		
		try 
		{
			Conexion con = new Conexion();
			PreparedStatement ps = con.executePreparedStatement(sql);
			
			ps.setString(1, bean.getDescripcion());
			ps.setString(2, bean.getCurso());
			ps.setString(3, bean.getSeccion());
			ps.setInt(4, bean.getPeriodo());
			ps.setInt(5, bean.getAnio());
			ps.setString(6, bean.getDocente());
			ps.setString(7, bean.getDia());
			ps.setString(8, bean.getHoraInicio());
			ps.setString(9, bean.getHoraFin());
			ps.setString(10, bean.getFechaInicio());
			ps.setString(11, bean.getFechaFin());
			ps.setString(12, bean.getFechaCreacion());
			
			
			resultado = ps.executeUpdate() == 1 ? true : false;
			
			System.out.println("Se realizo el INSERT DEL GRUPO DE ESTUDIO correctamente");
			
		}catch(Exception e) {
			
			System.out.print("Error : " + e.getMessage());
			e.getStackTrace();
			
		}
		

		return resultado;
	}
	
	public boolean registrarDetalleNivelacion(DetalleNivelacion bean)
	{
		boolean resultado = false;
		String sql = "insert into det_niv_alum(idAlumno, idNivelacion) values (?,(select idNivelacion from nivelacion_estudio order by idNivelacion desc limit 1))";
		
		try
		{
			Conexion con = new Conexion();
			PreparedStatement ps = con.executePreparedStatement(sql);
			
			ps.setString(1, bean.getIdAlumno());
			
			resultado = ps.executeUpdate() == 1 ? true : false;
			
			System.out.println("Se realizo el INSERT del detalle nivelacion correctamente");
			
		} catch(Exception e) {
			
			System.out.print("Error : " + e.getMessage());
			e.getStackTrace();
		}
		
		return resultado;
	}
	
	public List<Nivelacion> listarNivelacion(){
		
		List<Nivelacion> lista = new ArrayList<Nivelacion>();
		
		try{
			Conexion con = new Conexion();
			String sql = "select idNivelacion, descripcion from nivelacion_estudio;";
			System.out.println("consulta :"+sql);
			
			ResultSet rs = con.executeQuery(sql);
			
			while(rs.next()){

				Nivelacion bean = new Nivelacion();
				bean.setIdNivelacion(rs.getString(1));
				bean.setDescripcion(rs.getString(2));
				lista.add(bean);
			}
			
			System.out.println("lista:"+lista);
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return lista;
	}

	public StringBuilder listarGrupoNivelacion(String grupo)
	{
		StringBuilder lista = new StringBuilder();
		System.out.println("Se realizo: " + grupo);
		String sql = "select d.idAlumno, a.nombre, a.apellidoPat, a.apellidoMat, s.grado, " + 
				"c.asignatura, n.horaInicio, n.horaFin from alumnos a inner join det_niv_alum d " + 
				"inner join nivelacion_estudio n inner join secciones s inner join cursos c " + 
				"where a.idAlumno = d.idAlumno and d.idNivelacion = n.idNivelacion " + 
				"and s.idSeccion = n.seccion and c.idCurso = n.curso and n.idNivelacion = '"+grupo+"';";
		
		System.out.println("Se realizo el query: " + sql);
		try 
		{
			Conexion con = new Conexion();
			ResultSet rs = con.executeQuery(sql);
			
			while (rs.next()) {
				
				lista.append(rs.getString(1) + "/" + rs.getString(2) + "/" + rs.getString(3) + "/" + rs.getString(4) + "/" + rs.getString(5) + "/" +
						rs.getString(6) + "/" + rs.getString(7) + "/" + rs.getString(8) + "/" + "$");
			}
			
			System.out.println("Se realizo la sentencia correcta: " + lista);

		} catch (Exception e) {
			 
			System.out.println("Error : " + e.getMessage());
			e.printStackTrace();
		}
		
		return lista;
		
	}
	
	public StringBuilder nivelacionSeccionxCurso(String codigo)
	{
		StringBuilder lista = new StringBuilder();
		System.out.println("CODIGO : " + codigo);
		String sql = "select s.grado, c.asignatura from secciones s inner join " + 
					"nivelacion_estudio n on n.seccion = s.idSeccion inner join " + 
					"cursos c on n.curso = c.idCurso and n.idNivelacion = '"+codigo+"';";
		
		try {
			
			Conexion con = new Conexion();
			ResultSet rs = con.executeQuery(sql);
			
			while (rs.next()) {
				
				lista.append(rs.getString(1) + "/" + rs.getString(2) + "/"  + "$");
			}
			
			System.out.println("El curso y la seccion es: " + lista);
			
		} catch (Exception e)
		{
			System.out.println("Error : " + e.getMessage());
			e.printStackTrace();
		}
		
		return lista;
	}
	
	public StringBuilder buscarNivelacionDocente(String docente, String seccion)
	{
		StringBuilder lista = new StringBuilder();
		String sql = "select idNivelacion, descripcion " + 
					"from nivelacion_estudio " + 
					"where docente = '"+docente+"' and seccion = '"+seccion+"';";
		
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
	
	public StringBuilder clasesNivelacion(String grupo, int mes, int anio)
	{
		StringBuilder lista = new StringBuilder();
		System.out.println("CODIGO : " + grupo + "-" + mes + "-" + anio);
		
		String sql = "select idAsistencia, fecha " + 
					"from asistencia_nivelacion " + 
					"where month(fecha) = "+mes+" and year(fecha) = " +anio+ " and grupoNivelacion = '"+grupo+"'";
		
		try {
			
			Conexion con = new Conexion();
			ResultSet rs = con.executeQuery(sql);
			
			while (rs.next()) {
				
				lista.append(rs.getString(1) + "/" + rs.getString(2) + "/"  + "$");
			}
			
			System.out.println("Las clases de Asistencia: " + lista);
			
		} catch (Exception e)
		{
			System.out.println("Error : " + e.getMessage());
			e.printStackTrace();
		}
		
		return lista;
	}
}
