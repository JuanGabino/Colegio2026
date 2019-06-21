package Jdbc;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

import Beans.AsistenciaPadre;
import Util.Conexion;


public class AsistenciaPadreJDBC {

	
	public boolean registrarAsistenciaPadre(AsistenciaPadre bean)
	{
		
		boolean resultado = false;
		
		String sql = "insert into asistencia_padres(fecha, id_Padre, estado, seccion, id_docente) values (?,?,?,?,?)";
		
		try 
		{
			Conexion con = new Conexion();
			PreparedStatement ps = con.executePreparedStatement(sql);
			
			ps.setString(1, bean.getFecha());
			ps.setString(2, bean.getIdPadre());
			ps.setString(3, bean.getEstado());
			ps.setString(4, bean.getSeccion());
			ps.setString(5, bean.getDocente());
			
			resultado = ps.executeUpdate() == 1 ? true : false;
			
			System.out.println("Se realizo el INSERT DE ASISTENCIA PADRES correctamente:" + resultado);
			
		} catch(Exception e)
		{
			System.out.print("Error : " + e.getMessage());
			e.getStackTrace();
		}
		
		return resultado;
	}
	
	
	public StringBuilder listarAsistenciaPadres(String codigo, String seccion, int fecha)
	{
		StringBuilder lista = new StringBuilder();
		String sql = "select a.id_Padre, p.nomPadre, p.apePat_Padre, p.apeMat_Madre, p.dni_Padre, sum(case when a.estado = 'Asistio' then 1 else 0 end) as Asistencia, " + 
				"sum(case when a.estado = 'Falto' then 1 else 0 end) as Faltas, " + 
				"(sum(case when a.estado = 'Asistio' then 1 else 0 end) + sum(case when a.estado = 'Falto' then 1 else 0 end)) as Total, " + 
				"(case when (sum(case when a.estado = 'Asistio' then 1 else 0 end)) > (sum(case when a.estado = 'Falto' then 1 else 0 end)) then 'Activo' else 'Inactivo' end) as Estado " + 
				"from asistencia_padres a join padres p on a.id_Padre=p.codPadre and month(a.fecha) = "+fecha+" "+ 
				"and a.id_docente = '"+codigo+"' and a.seccion = '"+seccion+"' " + 
				"group by id_Padre";
		
		try 
		{
			Conexion con = new Conexion();
			ResultSet rs = con.executeQuery(sql);
			
			while (rs.next()) {
				
				lista.append(rs.getString(1) + "/" + rs.getString(2) + "/" + rs.getString(3) + "/" + rs.getString(4) + "/" + rs.getString(5) + "/" + rs.getString(6) + "/" +
						rs.getString(7) + "/" + rs.getString(8) + "/" + rs.getString(9) + "/" + "$");
			}
			
			System.out.println("lista: " + lista);
			

		} catch (Exception e) {
			 
			System.out.println("Error : " + e.getMessage());
			e.printStackTrace();
		}
		
		return lista;
		
	}
}
