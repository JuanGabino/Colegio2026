package Jdbc;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

import Beans.Usuario;
import Util.Conexion;

public class UsuarioJDBC {

	public boolean registrarUsuario(Usuario bean)
	{
		boolean resultado = false;
		
		String sql = "CALL registrar_usuario (?,?,?,?,?,?,?)";
		
		try 
		{
			Conexion con = new Conexion();
			PreparedStatement ps = con.executePreparedStatement(sql);
			
			ps.setString(1, bean.getNombreUsuario());
			ps.setString(2, bean.getPassword());
			ps.setString(3, bean.getNombre());
			ps.setString(4, bean.getApe_Pat());
			ps.setString(5, bean.getApe_Mat());
			ps.setString(6, bean.getCorreo());
			ps.setInt(7, bean.getPerfil()); 
			
			resultado = ps.executeUpdate() == 1 ? true : false;
			
			System.out.println("Se REGISTRO AL USUARIO correctamente");
			
		}catch(Exception e) {
			
			System.out.print("Error : " + e.getMessage());
			e.getStackTrace();
			
		}
		

		return resultado;
	}
	
	
	public StringBuilder listarUsuarioDocente()
	{
		StringBuilder lista = new StringBuilder();
		String sql = "select idUsuario, nombreUsuario, Password, nombre, apellidoPat, apellidoMat, correoUsu, perfil, " +
					"fecha_creada from usuario where perfil=2;";
		
		try 
		{
			Conexion con = new Conexion();
			ResultSet rs = con.executeQuery(sql);
			
			while (rs.next()) {
				
				lista.append(rs.getString(1) + "|" + rs.getString(2) + "|" + rs.getString(3) + "|" + rs.getString(4) + "|" + rs.getString(5) + "|" +
							rs.getString(6) + "|" + rs.getString(7) + "|" + rs.getString(8) + "|" + rs.getString(9) + "|" + "$");
			}
			
			System.out.println("lista: " + lista);
			

		} catch (Exception e) {
			 
			System.out.println("Error : " + e.getMessage());
			e.printStackTrace();
		}
		
		return lista;
		
	}
	
	public StringBuilder listarUsuarioPadres()
	{
		StringBuilder lista = new StringBuilder();
		String sql = "select idUsuario, nombreUsuario, Password, nombre, apellidoPat, apellidoMat, correoUsu, perfil, " +
					"fecha_creada from usuario where perfil=3;";
		
		try 
		{
			Conexion con = new Conexion();
			ResultSet rs = con.executeQuery(sql);
			
			while (rs.next()) {
				
				lista.append(rs.getString(1) + "|" + rs.getString(2) + "|" + rs.getString(3) + "|" + rs.getString(4) + "|" + rs.getString(5) + "|" +
							rs.getString(6) + "|" + rs.getString(7) + "|" + rs.getString(8) + "|" + rs.getString(9) + "|" + "$");
			}
			
			System.out.println("lista: " + lista);
			

		} catch (Exception e) {
			 
			System.out.println("Error : " + e.getMessage());
			e.printStackTrace();
		}
		
		return lista;
		
	}
	
	public boolean cambiarContrasena(String password, String nueva) throws Exception 
	{
		boolean resultado = false;
		String sql = "update usuario set Password = '"+nueva+"' where Password = '"+password+"';";
		
		try {
			Conexion con= new Conexion();
			
			resultado = con.executeUpdate(sql) == 1 ? true : false;
			System.out.print("sql : " + sql);
			System.out.print("resultado es : " + resultado);
			
		} catch (Exception e) {
			
			System.out.print("Error : " + e.getMessage());
			e.printStackTrace();
		}
		return resultado;
	}
}
