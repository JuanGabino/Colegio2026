package Jdbc;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

import Beans.Padres;
import Util.Conexion;

public class PadresJDBC {

	public StringBuilder buscarPadreFamilia()
	{
		StringBuilder lista = new StringBuilder();
		String sql = "select codPadre, dni_Padre, nomPadre, apePat_Padre, apeMat_Padre from padres;";
		
		try 
		{
			Conexion con = new Conexion();
			ResultSet rs = con.executeQuery(sql);
			
			while (rs.next()) {
				
				lista.append(rs.getString(1) + "/" + rs.getString(2) + "/" + rs.getString(3) + "/" + rs.getString(4) + "/" + rs.getString(5) + "/"  + "$");
			}
			
			System.out.println("lista: " + lista);
			

		} catch (Exception e) {
			 
			System.out.println("Error : " + e.getMessage());
			e.printStackTrace();
		}
		
		return lista;
		
	}
	
	public boolean registrarPadres(Padres bean)
	{
		boolean resultado = false;
		
		String sql = "CALL registrar_padre (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		
		try 
		{
			Conexion con = new Conexion();
			PreparedStatement ps = con.executePreparedStatement(sql);
			
			ps.setString(1, bean.getNombre());
			ps.setString(2, bean.getApellidopaterno());
			ps.setString(3, bean.getApellidomaterno());
			ps.setInt(4, bean.getEdad());
			ps.setString(5, bean.getCorreo());
			ps.setString(6, bean.getDni());
			ps.setString(7, bean.getDireccion());
			ps.setInt(8, bean.getTelefono());
			ps.setString(9, bean.getFechanacimiento());
			ps.setString(10, bean.getTrabaja());
			ps.setString(11, bean.getOcupacion());
			ps.setInt(12, bean.getTelefonoTrabajo());
			ps.setString(13, bean.getDireccionTrabajo());
			ps.setString(14, bean.getEstadoCivil());
			ps.setString(15, bean.getNombreMadre());
			ps.setString(16, bean.getApepaternoMadre());
			ps.setString(17, bean.getApematernoMadre());
			ps.setString(18, bean.getDniMadre());
			ps.setInt(19, bean.getEdadMadre());
			ps.setString(20, bean.getFechaMadre());
			ps.setString(21, bean.getCorreoMadre());
			ps.setString(22, bean.getOcupacionMadre());
			ps.setInt(23, bean.getTelefonoMadre());
			ps.setInt(24, bean.getCasaPropia());
			ps.setInt(25, bean.getCantidadCasa());
			ps.setInt(26, bean.getCantidadHijos()); 
			
			resultado = ps.executeUpdate() == 1 ? true : false;
			
			System.out.println("Se realizo el INSERT DE PADRES correctamente");
			
		}catch(Exception e) {
			
			System.out.print("Error : " + e.getMessage());
			e.getStackTrace();
			
		}

		return resultado;
	}
	
	public Padres buscarPadre(String dnipat, String dnimat) throws Exception {
		
		String sql = "select nomPadre, apePat_Padre, apeMat_Padre, edad_Padre, corre_Padre, dni_Padre, direccion_Padre, telefono_Padre, fechanac_Padre, trabaja_Padre, ocupacion_Padre, " + 
				"telefono_Trabajo, direccion_Trabajo, estado_civil, nombre_Madre, apePat_Madre, apeMat_Madre, dniMadre, edadMadre, fechanac_Madre, correoMadre, ocupacion_Madre, " + 
				"telefono_Madre, casa_Propia, cantidad_casa, cantidad_hijos from padres where dni_Padre = ? or dniMadre = ?";
		
		Padres bean = new Padres();
		try {
			Conexion con = new Conexion();
			PreparedStatement ps = con.executePreparedStatement(sql);
			ps.setString(1, dnipat);
			ps.setString(2, dnimat);
			ResultSet rs = ps.executeQuery();
			System.out.println("Ejecuta sql : " + sql);
			
			if (rs.next()) {
				
				bean.setNombre(rs.getString(1));
				bean.setApellidopaterno(rs.getString(2));
				bean.setApellidomaterno(rs.getString(3));
				bean.setEdad(rs.getInt(4));
				bean.setCorreo(rs.getString(5));
				bean.setDni(rs.getString(6));
				bean.setDireccion(rs.getString(7));
				bean.setTelefono(rs.getInt(8));
				bean.setFechanacimiento(rs.getString(9));
				bean.setTrabaja(rs.getString(10));
				bean.setOcupacion(rs.getString(11));
				bean.setTelefonoTrabajo(rs.getInt(12));
				bean.setDireccionTrabajo(rs.getString(13));
				bean.setEstadoCivil(rs.getString(14));
				bean.setNombreMadre(rs.getString(15));
				bean.setApepaternoMadre(rs.getString(16));
				bean.setApematernoMadre(rs.getString(17));
				bean.setDniMadre(rs.getString(18));
				bean.setEdadMadre(rs.getInt(19));
				bean.setFechaMadre(rs.getString(20));
				bean.setCorreoMadre(rs.getString(21));
				bean.setOcupacionMadre(rs.getString(22));
				bean.setTelefonoMadre(rs.getInt(23));
				bean.setCasaPropia(rs.getInt(24));
				bean.setCantidadCasa(rs.getInt(25));
				bean.setCantidadHijos(rs.getInt(26));
			}
					
		} catch(Exception e)
		{
			System.out.print("Error : " + e.getMessage());
			e.printStackTrace();
		}
		
		return bean;
		
	}
	
	public boolean modificarPadre(Padres bean) throws Exception {
		boolean resultado = false;
		String sql = "update padres set nomPadre = '" + bean.getNombre() + "'"
				+ ", apePat_Padre='" + bean.getApellidopaterno() + "'"
				+ ", apeMat_Padre='" + bean.getApellidomaterno() + "'"
				+ ", edad_Padre= " + bean.getEdad() 
				+ ", corre_Padre= '" + bean.getCorreo()+ "'"
				+ ", dni_Padre='" + bean.getDni() + "'"
				+ ", direccion_Padre='" + bean.getDireccion() + "'"
				+ ", telefono_Padre=" + bean.getTelefono() 
				+ ", fechanac_Padre='" + bean.getFechaMadre() + "'"
				+ ", trabaja_Padre='" + bean.getTrabaja() + "'"
				+ ", ocupacion_Padre='" + bean.getOcupacion() + "'"
				+ ", telefono_Trabajo=" + bean.getTelefonoTrabajo() 
				+ ", direccion_Trabajo='" + bean.getDireccionTrabajo() + "'"
				+ ", estado_civil='" + bean.getEstadoCivil() + "'" 
				+ ", nombre_Madre='" + bean.getNombreMadre() + "'"
				+ ", apePat_Madre='" + bean.getApepaternoMadre() + "'"
				+ ", apeMat_Madre='" + bean.getApematernoMadre() + "'"
				+ ", dniMadre='" + bean.getDniMadre() + "'"
				+ ", edadMadre=" + bean.getEdadMadre()
				+ ", fechanac_Madre='" + bean.getFechaMadre() + "'"
				+ ", correoMadre='" + bean.getCorreoMadre() + "'"
				+ ", ocupacion_Madre='" + bean.getOcupacionMadre() + "'"
				+ ", telefono_Madre=" + bean.getTelefonoMadre() 
				+ ", casa_Propia=" + bean.getCasaPropia() 
				+ ", cantidad_casa=" + bean.getCantidadCasa() 
				+ ", cantidad_hijos=" + bean.getCantidadHijos() 
				+ " where dni_Padre = '" +bean.getDni() + "';" ;
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

	
	public boolean eliminarPadre(String codigo) throws Exception
	{
		boolean resultado = false;
		
		String sql = "Delete from padres where codPadre = '"+codigo+"';";
		
		try 
		{
			Conexion con = new Conexion();
			
			resultado = con.executeUpdate(sql) == 1 ? true : false;
			
			System.out.println("Ejecuta sql:" + sql);
			System.out.println("Respuesta JDBC: " + resultado);
			
		} catch(Exception e)
		{
			System.out.println("Error: " + e.getMessage());	
			e.printStackTrace();
		}
		
		return resultado;
		
	}
	
	public StringBuilder listarPadre()
	{
		StringBuilder lista = new StringBuilder();
		String sql = "select * from padres";
		
		try 
		{
			Conexion con = new Conexion();
			ResultSet rs = con.executeQuery(sql);
			
			while (rs.next()) {
				
				lista.append(rs.getString(1) + "|" + rs.getString(2) + "|" + rs.getString(3) + "|" + rs.getString(4) + "|" + rs.getString(5) + "|" +
							rs.getString(6) + "|" + rs.getString(7) + "|" + rs.getString(8) + "|" + rs.getString(9) + "|" + rs.getString(10) + "|" + 
							rs.getString(11) + "|" + rs.getString(12) + "|" + rs.getString(13) + "|" + rs.getString(14) + "|" + rs.getString(15) + "|" + 
							rs.getString(16) + "|" + rs.getString(17) + "|" + rs.getString(18) + "|" + rs.getString(19) + "|" + rs.getString(20) + "|" + 
							rs.getString(21) + "|" + rs.getString(22) + "|" + rs.getString(23) + "|" + rs.getString(24) + "|" + rs.getString(25) + "|" + 
							rs.getString(26) + "|" + rs.getString(27) + "|" + "$");
			}
			
			System.out.println("lista: " + lista);
			

		} catch (Exception e) {
			 
			System.out.println("Error : " + e.getMessage());
			e.printStackTrace();
		}
		
		return lista;
		
	}
	
	public StringBuilder buscarPadreFamiliaSeccion(String seccion)
	{
		StringBuilder lista = new StringBuilder();
		String sql = "select distinct a.idPadre, p.nomPadre, p.apePat_Padre, p.apeMat_Padre from alumnos a inner join " + 
				"padres p on a.idPadre = p.codPadre and a.seccion = '"+seccion+"';";
		
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
	
	
	public StringBuilder buscarPadreFamiliaxDNI(String dnipadre, String dnimadre)
	{
		StringBuilder lista = new StringBuilder();
		System.out.println("dni: " + dnipadre + "-" +dnimadre);
		String sql = "select codPadre, nomPadre, apePat_Padre, apeMat_Padre from padres " + 
						"where dni_Padre = '"+dnipadre+"' or dniMadre = '"+dnimadre+"';";
		
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
	
	public StringBuilder buscarAlumnos(String dni)
	{
		StringBuilder lista = new StringBuilder();
		System.out.println("dni: " + dni);
		
		String sql = "select a.idAlumno, a.nombre, a.apellidoPat, a.apellidoMat " + 
				"from alumnos a where a.idPadre = (select codPadre from padres " + 
				"where dni_Padre = '"+dni+"');";
		
		try 
		{
			Conexion con = new Conexion();
			ResultSet rs = con.executeQuery(sql);
			
			while (rs.next()) {
				
				lista.append(rs.getString(1) + "/" + rs.getString(2) + "/" + rs.getString(3) + "/" + rs.getString(4) + "/" + "$");
			}
			
			System.out.println("lista alumno: " + lista);
			

		} catch (Exception e) {
			 
			System.out.println("Error : " + e.getMessage());
			e.printStackTrace();
		}
		
		return lista;
		
	}
}
