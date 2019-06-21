package Jdbc;

import Beans.CirculoEstudio;
import Beans.DetalleCirculoEstudio;

import java.sql.PreparedStatement;
import java.sql.ResultSet;


import Util.Conexion;

public class CirculoEstudioJDBC {

	public boolean registrarCirculoEstudio(CirculoEstudio bean)
	{
		boolean resultado = false;
		
		String sql = "CALL registrar_circuloEstudio (?,?,?,?,?,?,?,?,?)";
		
		try 
		{
			Conexion con = new Conexion();
			PreparedStatement ps = con.executePreparedStatement(sql);
			
			ps.setString(1, bean.getDescripcion());
			ps.setString(2, bean.getCurso());
			ps.setString(3, bean.getSeccion());
			ps.setString(4, bean.getAnio());
			ps.setString(5, bean.getDocente());
			ps.setString(6, bean.getDia());
			ps.setString(7, bean.getHoraInicio());
			ps.setString(8, bean.getHoraFin());
			ps.setString(9, bean.getFecha());
			
			resultado = ps.executeUpdate() == 1 ? true : false;
			
			System.out.println("Se realizo el INSERT DEL CIRCULO DE ESTUDIO correctamente");
			
		}catch(Exception e) {
			
			System.out.print("Error : " + e.getMessage());
			e.getStackTrace();
			
		}
		

		return resultado;
	}
	
	public boolean registrarDetalleCirculo(DetalleCirculoEstudio bean)
	{
		boolean resultado = false;
		String sql = "insert into det_cir_alum values (?,(select idCirculo from circulo_estudio order by idCirculo desc limit 1))";
		
		try
		{
			Conexion con = new Conexion();
			PreparedStatement ps = con.executePreparedStatement(sql);
			
			ps.setString(1, bean.getIdAlumno());
			
			resultado = ps.executeUpdate() == 1 ? true : false;
			
			System.out.println("Se realizo el INSERT del detalle circulo correctamente");
			
		} catch(Exception e) {
			
			System.out.print("Error : " + e.getMessage());
			e.getStackTrace();
		}
		
		return resultado;
	}
	
	public StringBuilder buscarDocenteCirculo(String codigo, String seccion)
	{
		StringBuilder lista = new StringBuilder();
		String sql = "select idCirculo, descripcion " + 
					"from circulo_estudio " + 
					"where docente = '"+codigo+"' and seccion = '"+seccion+"';";
		
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
	
	public StringBuilder buscarAlumnoCirculo(String docente, String circulo)
	{
		StringBuilder lista = new StringBuilder();
		String sql = "select c.idCirculo, cu.asignatura, d.idAlumno, a.nombre, a.apellidoPat, a.apellidoMat, c.fecha " + 
				"from circulo_estudio c inner join det_cir_alum d  on c.idCirculo = d.idCirculo " + 
				"inner join alumnos a on a.idAlumno = d.idAlumno  " + 
				"inner join cursos cu on cu.idCurso = c.curso " + 
				"where c.docente = '"+docente+"' and c.idCirculo = '"+circulo+"'" + 
				"group by c.idCirculo, d.idAlumno;";
		
		System.out.println("codigos: " + docente + "-" + circulo);
		
		try 
		{
			Conexion con = new Conexion();
			ResultSet rs = con.executeQuery(sql);
			
			while (rs.next()) {
				
				lista.append(rs.getString(1) + "|" + rs.getString(2) + "|" +  rs.getString(3) + "|" +  rs.getString(4) + "|" +  rs.getString(5) + "|"
						+  rs.getString(6) + "|" +  rs.getString(7) + "|" + "$");
			}
			
			System.out.println("lista: " + lista);
			

		} catch (Exception e) {
			 
			System.out.println("Error : " + e.getMessage());
			e.printStackTrace();
		}
		
		return lista;
		
	}
}
