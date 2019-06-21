package Jdbc;

import Beans.Asistencia;
import Beans.DetalleAsistenciaNivelacion;
 

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import Util.Conexion;

public class AsistenciaNivelacionJDBC {

	public boolean registrarAsistenciaNivelacion(Asistencia bean)
	{
		boolean resultado = false;
		
		String sql = "CALL registrar_asistenciaNivelacion (?,?,?,?,?)";
		
		try 
		{
			Conexion con = new Conexion();
			PreparedStatement ps = con.executePreparedStatement(sql);
			
			ps.setString(1, bean.getFecha());
			ps.setString(2, bean.getGrupoNivelacion());
			ps.setString(3, bean.getClase());
			ps.setString(4, bean.getTema());
			ps.setString(5, bean.getSalon());
			
			
			resultado = ps.executeUpdate() == 1 ? true : false;
			
			System.out.println("Se realizo el INSERT DEL LA ASISTENCIA correctamente");
			
		}catch(Exception e) {
			
			System.out.print("Error : " + e.getMessage());
			e.getStackTrace();
			
		}
		

		return resultado;
	}
	
	public boolean registrarDetalleAsistenciaNivelacion(DetalleAsistenciaNivelacion bean)
	{
		boolean resultado = false;
		String sql = "insert into det_asis_niv values (?, (select idAsistencia from asistencia_nivelacion order by idAsistencia desc limit 1), ?)";
		
		try
		{
			Conexion con = new Conexion();
			PreparedStatement ps = con.executePreparedStatement(sql);
			
			ps.setString(1, bean.getIdAlumno());
			ps.setString(2, bean.getEstado());
			
			resultado = ps.executeUpdate() == 1 ? true : false;
			
			System.out.println("Se realizo el INSERT del detalle ASISTENCIA NIVELACION correctamente");
			
		} catch(Exception e) {
			
			System.out.print("Error : " + e.getMessage());
			e.getStackTrace();
		}
		
		return resultado;
	}
	
	public StringBuilder asistenciaNivelacion(String clase)
	{
		StringBuilder lista = new StringBuilder();
		System.out.println("Clase : " + clase);
		
		String sql = "select d.idAlumno, a.nombre, a.apellidoPat, a.apellidoMat, a.dniAlumno, n.fecha, c.asignatura, " + 
				"n.tema, d.estado from alumnos a inner join det_asis_niv d on a.idAlumno = d.idAlumno " + 
				"inner join asistencia_nivelacion n on n.idAsistencia = d.idAsistencia " + 
				"inner join nivelacion_estudio ne on ne.idNivelacion = n.grupoNivelacion " + 
				"inner join cursos c on c.idCurso = ne.curso " + 
				"where d.idAsistencia = '"+clase+"'";
		
		try {
			
			Conexion con = new Conexion();
			ResultSet rs = con.executeQuery(sql);
			
			while (rs.next()) {
				
				lista.append(rs.getString(1) + "|" + rs.getString(2) + "|"  + rs.getString(3) + "|" + rs.getString(4) + "|" + rs.getString(5) + "|" +
						rs.getString(6) + "|" + rs.getString(7) + "|" + rs.getString(8) + "|" + rs.getString(9) + "|" + "$");
			}
			
			System.out.println("Lista de asistencia: " + lista);
			
		} catch (Exception e)
		{
			System.out.println("Error : " + e.getMessage());
			e.printStackTrace();
		}
		
		return lista;
	}
}
