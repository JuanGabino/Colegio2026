package Jdbc;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import Beans.Usuario;
import Beans.Alumno;
import Util.Conexion;


public class LoginJDBC {

	public Usuario validarUsuario(String usuario, String contrasena) 
	{
		Usuario bean = new Usuario();
		
		try {
			
			Conexion con = new Conexion();
			String sql = "Select u.idUsuario, u.nombreUsuario, u.Password, u.nombre, u.apellidoPat, u.apellidoMat, p.idPerfil from usuario u "
					+ "inner join perfil p ON p.idPerfil = u.perfil " 
					+ "where u.nombreUsuario ='" + usuario + "' and  u.Password ='" + contrasena +"' ";
			
			ResultSet rs = con.executeQuery(sql);
			
			while(rs.next()){
				bean.setIdUsuario(rs.getString(1));
				bean.setNombreUsuario(rs.getString(2));
				bean.setPassword(rs.getString(3));
				bean.setNombre(rs.getString(4));
				bean.setApe_Pat(rs.getString(5));
				bean.setApe_Mat(rs.getString(6));
				bean.setPerfil(rs.getInt(7));
			}	
			
		} catch(Exception e) {
			
			e.getStackTrace();
		}
		
		return bean;
	}
	
	public List<Alumno> listarAlumno(String idUsuario) {

		List<Alumno> lista = new ArrayList<Alumno>();
		String sql = "select a.idAlumno,  a.nombre from usuario u"
				     + " inner join alumnos a on u.idUsuario = a.codPadre where idUsuario='" + idUsuario + "'";
		try {
			Conexion con = new Conexion();
			ResultSet rs = con.executeQuery(sql);

			while (rs.next()) {
				Alumno bean = new Alumno();

				bean.setIdAlumno(rs.getString(1));
				bean.setNombre(rs.getString(2));

				lista.add(bean);
			}

		} catch (Exception e) {
			System.out.print("Error : " + e.getMessage());
			e.printStackTrace();
		}

		return lista;
	}
}
