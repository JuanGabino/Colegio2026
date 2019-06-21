package Jdbc;

import java.sql.PreparedStatement;

import Beans.DetalleCursoSeccion;
import Util.Conexion;

public class DetalleCursoSeccionJDBC {

	public boolean registrarDetalleCurso(DetalleCursoSeccion bean)
	{
		boolean resultado = false;
		String sql = "insert into doc_sec_cur(id_docente, id_seccion, id_curso) values (?,?,?)";
		
		try
		{
			Conexion con = new Conexion();
			PreparedStatement ps = con.executePreparedStatement(sql);
			
			ps.setString(1, bean.getIdDocente());
			ps.setString(2, bean.getIdSeccion());
			ps.setString(3, bean.getIdCurso());
			
			resultado = ps.executeUpdate() == 1 ? true : false;
			
			System.out.println("Se realizo el INSERT del detalle de cursos y seccion correctamente");
			
		} catch(Exception e) {
			
			System.out.print("Error : " + e.getMessage());
			e.getStackTrace();
		}
		
		return resultado;
	}
}
