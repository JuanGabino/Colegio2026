package Jdbc;

import Util.Conexion;
import java.sql.ResultSet;


public class CalificacionesJDBC {

	public boolean actualizarNotasP1(String idAlumno, String seccion, String curso, int per, int anio, int p1) {
		
		boolean resultado = false;
		String sql="";
		try{
			Conexion con = new Conexion();
			if(idAlumno != null & seccion !=null & curso != null){				
				sql = "Update calificaciones set" + 
			          " P1 = " + p1 +" where idAlumno='" +  idAlumno + "' and seccion ='" + seccion +"' and curso = '" +  curso  + "' and periodo = "+
						per + " and anio = " + anio + ";";
				
				System.out.println("consulta REALIZADA:" + "-" + idAlumno + "-" + seccion + "-" + curso + "-" + per + "-" + anio + "-" + p1);
			}else {
				System.out.println("ERROR EN LA CONSULTA SQL" + idAlumno + "-" + seccion + "-" + curso + "-" + per + "-" + anio + "-" + p1);				
			}
			
			System.out.println("consulta :"+ sql);
			
			resultado = con.executeUpdate(sql) == 1 ? true : false;
			
		}catch(Exception e){
			e.printStackTrace();
		}		
		return resultado;
		
		
	}
	
	public boolean actualizarNotasP2(String idAlumno, String seccion, String curso, int per, int anio, int p2) {
		
		boolean resultado = false;
		String sql="";
		try{
			Conexion con = new Conexion();
			if(idAlumno != null & seccion !=null & curso != null){				
				sql = "Update calificaciones set" + 
			          " P2 = " + p2 +" where idAlumno='" +  idAlumno + "' and seccion ='" + seccion +"' and curso = '" +  curso  + "' and periodo = "+
								per + " and anio = " + anio + ";";
				System.out.println("consulta REALIZADA:" + "-" + idAlumno + "-" + seccion + "-" + curso +  "-" + per + "-" + anio + "-" + p2);
			}else {
				System.out.println("ERROR EN LA CONSULTA SQL" + idAlumno + "-" + seccion + "-" + curso + "-" + per + "-" + anio + "-" + p2);				
			}
			
			System.out.println("consulta :"+ sql);
			
			resultado = con.executeUpdate(sql) == 1 ? true : false;
			
		}catch(Exception e){
			e.printStackTrace();
		}		
		return resultado;
		
		
	}

	public boolean actualizarNotasP3(String idAlumno, String seccion, String curso, int per, int anio, int p3) {
	
		boolean resultado = false;
		String sql="";
		try{
			Conexion con = new Conexion();
			if(idAlumno != null & seccion !=null & curso != null){				
				sql = "Update calificaciones set" + 
		          " P3 = " + p3 +" where idAlumno='" +  idAlumno + "' and seccion ='" + seccion +"' and curso = '" +  curso  + "' and periodo = "+
							per + " and anio = " + anio + ";";
			
				System.out.println("consulta REALIZADA:" + "-" + idAlumno + "-" + seccion + "-" + curso + "-" + per + "-" + anio + "-" + p3);
			}
			else {
				System.out.println("ERROR EN LA CONSULTA SQL" + idAlumno + "-" + seccion + "-" + curso + "-" + per + "-" + anio + "-" + p3);				
			}
		
			System.out.println("consulta :"+ sql);
		
			resultado = con.executeUpdate(sql) == 1 ? true : false;
		
		}catch(Exception e){
			e.printStackTrace();
		}		
		return resultado;
	
	}

	public boolean actualizarNotasT1(String idAlumno, String seccion, String curso, int per, int anio, int t1) {
	
		boolean resultado = false;
		String sql="";
		try{
			Conexion con = new Conexion();
			if(idAlumno != null & seccion !=null & curso != null){				
				sql = "Update calificaciones set " + 
		          " T1 = " + t1 +" where idAlumno='" +  idAlumno + "' and seccion ='" + seccion +"' and curso = '" +  curso + "' and periodo = "+
							per + " and anio = " + anio + ";";
			
				System.out.println("consulta REALIZADA:" + "-" + idAlumno + "-" + seccion + "-" + curso + "-" + per + "-" + anio + "-" + t1);
			}
			else {
				System.out.println("ERROR EN LA CONSULTA SQL" + idAlumno + "-" + seccion + "-" + curso + "-" + per + "-" + anio + "-" + t1);				
			}
		
			System.out.println("consulta :"+ sql);
		
			resultado = con.executeUpdate(sql) == 1 ? true : false;
		
		}catch(Exception e){
			e.printStackTrace();
		}		
		return resultado;

	}

	public boolean actualizarNotasT2(String idAlumno, String seccion, String curso, int per, int anio, int t2) {
	
		boolean resultado = false;
		String sql="";
		try{
			Conexion con = new Conexion();
			if(idAlumno != null & seccion !=null & curso != null){				
				sql = "Update calificaciones set " + 
		          " T2 = " + t2 +" where idAlumno='" +  idAlumno + "' and seccion ='" + seccion +"' and curso = '" +  curso  + "' and periodo = "+
							per + " and anio = " + anio + ";";
			
				System.out.println("consulta REALIZADA:" + "-" + idAlumno + "-" + seccion + "-" + curso + "-" + per + "-" + anio + "-" + t2);
			}else {
				System.out.println("ERROR EN LA CONSULTA SQL" + idAlumno + "-" + seccion + "-" + curso + "-" + per + "-" + anio + "-" + t2);				
			}
		
			System.out.println("consulta :"+ sql);
		
			resultado = con.executeUpdate(sql) == 1 ? true : false;
		
		}catch(Exception e){
			e.printStackTrace();
		}		
		return resultado;
	
	
	}

	public boolean actualizarNotasT3(String idAlumno, String seccion, String curso, int per, int anio, int t3) {
		
		boolean resultado = false;
		String sql="";
		try{
			Conexion con = new Conexion();
			if(idAlumno != null & seccion !=null & curso != null){				
				sql = "Update calificaciones set " + 
		          " T3 = " + t3 +" where idAlumno='" +  idAlumno + "' and seccion ='" + seccion +"' and curso = '" +  curso  + "' and periodo = "+
							per + " and anio = " + anio + ";";
			
				System.out.println("consulta REALIZADA:" + "-" + idAlumno + "-" + seccion + "-" + curso + "-" + per + "-" + anio + "-" + t3);
			}else {
				System.out.println("ERROR EN LA CONSULTA SQL" + idAlumno + "-" + seccion + "-" + curso + "-" + per + "-" + anio + "-" + t3);				
			}
		
			System.out.println("consulta :"+ sql);
		
			resultado = con.executeUpdate(sql) == 1 ? true : false;
		
		}catch(Exception e){
			e.printStackTrace();
		}		
		return resultado;
	
	
	}

	public boolean actualizarNotasEX1(String idAlumno, String seccion, String curso, int per, int anio, int ex1) {
	
		boolean resultado = false;
		String sql="";
		try{
			Conexion con = new Conexion();
			if(idAlumno != null & seccion !=null & curso != null){				
				sql = "Update calificaciones set " + 
		          " EX1= " + ex1 + " where idAlumno='" +  idAlumno + "' and seccion ='" + seccion +"' and curso = '" +  curso  + "' and periodo = "+
							per + " and anio = " + anio + ";";
			
				System.out.println("consulta REALIZADA:" + "-" + idAlumno + "-" + seccion + "-" + curso + "-" + per + "-" + anio + "-" + ex1);
			}else {
				System.out.println("ERROR EN LA CONSULTA SQL" + idAlumno + "-" + seccion + "-" + curso + "-" + per + "-" + anio + "-" + ex1);				
			}
		
			System.out.println("consulta :"+ sql);
		
			resultado = con.executeUpdate(sql) == 1 ? true : false;
		
		}catch(Exception e){
			e.printStackTrace();
		}		
		return resultado;
	
	
	}

	public boolean actualizarNotasEX2(String idAlumno, String seccion, String curso, int per, int anio, int ex2) {
	
		boolean resultado = false;
		String sql="";
		try{
			Conexion con = new Conexion();
			if(idAlumno != null & seccion !=null & curso != null){				
				sql = "Update calificaciones set  " + 
		          " EX2 = " + ex2 +" where idAlumno='" +  idAlumno + "' and seccion ='" + seccion +"' and curso = '" +  curso  + "' and periodo = "+
							per + " and anio = " + anio + ";";
			
				System.out.println("consulta REALIZADA:" + "-" + idAlumno + "-" + seccion + "-" + curso + "-" + per + "-" + anio + "-" + ex2);
			}else {
				System.out.println("ERROR EN LA CONSULTA SQL" + idAlumno + "-" + seccion + "-" + curso + "-" + per + "-" + anio + "-" + ex2);				
			}
		
			System.out.println("consulta :"+ sql);
		
			resultado = con.executeUpdate(sql) == 1 ? true : false;
		
		}catch(Exception e){
			e.printStackTrace();
		}		
		return resultado;
	
	
	}


	
	public StringBuilder listarCalificaciones(String seccion, String curso, int periodo, int anio)
	{
		StringBuilder lista = new StringBuilder();
		System.out.println("La seccion es :" +seccion+"- El curso es: "+curso);
		String sql = "select a.idAlumno, a.nombre, a.apellidoPat, a.apellidoMat, c.P1, c.P2, c.P3, c.PromedioPractica, c.T1, c.T2, c.T3," +
	              " c.PromedioTarea, c.EX1, c.EX2, c.PromedioFinal from alumnos as a inner join calificaciones as c on a.idAlumno=c.idAlumno" +
			      " where c.seccion ='"+seccion+"' and curso='"+curso+"' and periodo = " + periodo + " and anio =" + anio + ";";
		
		System.out.println("consulta :"+sql);
		
		try 
		{
			Conexion con = new Conexion();
			ResultSet rs = con.executeQuery(sql);
			
			while (rs.next()) {
				
				lista.append(rs.getString(1) + "/" + rs.getString(2) + "/" + rs.getString(3) + "/" + rs.getString(4) + "/" + rs.getInt(5) + 
						     "/" + rs.getInt(6) + "/" + rs.getInt(7) + "/" + rs.getDouble(8) + "/" + rs.getInt(9)+ "/" + rs.getInt(10) + "/" +
						     rs.getInt(11) + "/" + rs.getDouble(12) + "/" + rs.getInt(13) + "/" + rs.getInt(14) + "/" + rs.getDouble(15) + "$");
			}
			
			

		} catch (Exception e) {
			 
			System.out.println("Error : " + e.getMessage());
			e.printStackTrace();
		}
		
		return lista;
	}
	
	public StringBuilder listarCalificacionesMaximas(String seccion, String curso, int periodo, int anio)
	{
		StringBuilder lista = new StringBuilder();
		String sql = "select a.nombre, a.apellidoPat, a.apellidoMat, c.PromedioFinal from calificaciones as c inner join " + 
				"alumnos as a on a.idAlumno = c.idAlumno where c.curso = '" + curso + "' and c.seccion = '" + seccion + "' and periodo = " + 
				periodo + " and anio = "+anio+" order by PromedioFinal desc LIMIT 5";
		
		try 
		{
			Conexion con = new Conexion();
			ResultSet rs = con.executeQuery(sql);
			
			while (rs.next()) {
				
				lista.append(rs.getString(1) + "/" + rs.getString(2) + "/" + rs.getString(3) + "/" + rs.getDouble(4) + "/"  + "$");
			}
			
			

		} catch (Exception e) {
			 
			System.out.println("Error : " + e.getMessage());
			e.printStackTrace();
		}
		
		return lista;
		
	}
	
	
	public StringBuilder listarCalificacionesMinimas(String seccion, String curso, int periodo, int anio)
	{ 
		StringBuilder lista = new StringBuilder();
		String sql = "select a.nombre, a.apellidoPat, a.apellidoMat, c.PromedioFinal from calificaciones as c inner join " + 
				"alumnos as a on a.idAlumno = c.idAlumno where c.curso = '" + curso + "' and c.seccion = '" + seccion + "' and c.periodo = " + 
				periodo + " and c.anio = "+anio+" having c.PromedioFinal>0 order by c.PromedioFinal asc LIMIT 3";
		
		try 
		{
			Conexion con = new Conexion();
			ResultSet rs = con.executeQuery(sql);
			
			while (rs.next()) {
				
				lista.append(rs.getString(1) + "/" + rs.getString(2) + "/" + rs.getString(3) + "/" + rs.getDouble(4) + "/"  + "$");
			}
			
			

		} catch (Exception e) {
			 
			System.out.println("Error : " + e.getMessage());
			e.printStackTrace();
		}
		
		return lista;
		
	}
	
	public StringBuilder listarAprobadoDesaprobados(String seccion, String curso, int periodo, int anio)
	{
		StringBuilder lista = new StringBuilder();
		String sql = "SELECT COUNT(*) AS APROBADO, (SELECT COUNT(*) from calificaciones  where PromedioFinal < 10.50) AS DESAPROBADO, " + 
				"(SELECT COUNT(*) from calificaciones  where seccion='"+seccion+"' and curso='"+curso+"' and periodo='"+periodo+"' and anio='"+anio+"' )as Total " + 
				"from calificaciones  where PromedioFinal >= 10.50 and seccion='"+seccion+"' and curso='"+curso+"' and periodo='"+periodo+"' and anio='"+anio+"';";
		
		try 
		{
			Conexion con = new Conexion();
			ResultSet rs = con.executeQuery(sql);
			
			while (rs.next()) {
				
				lista.append(rs.getString(1) + "/" + rs.getString(2) + "/" + rs.getString(3) + "/" + "$");
			}
			
			

		} catch (Exception e) {
			 
			System.out.println("Error : " + e.getMessage());
			e.printStackTrace();
		}
		
		return lista;
		
	}
	
	public StringBuilder graficoNotasAlumno(String seccion, String curso, int periodo, int anio, String id)
	{
		StringBuilder lista = new StringBuilder();
		String sql = "select p1, p2, p3, t1, t2, t3, ex1, ex2 from calificaciones " + 
				"where idAlumno = '"+id+"' and curso = '"+curso+"' and seccion = '"+seccion+"' and periodo = '"+periodo+"' " + 
				"and anio = '"+anio+"'";
		
		try 
		{
			Conexion con = new Conexion();
			ResultSet rs = con.executeQuery(sql);
			
			while (rs.next()) {
				
				lista.append(rs.getString(1) + "/" + rs.getString(2) + "/" + rs.getString(3) + "/" + rs.getString(4) + "/" + rs.getString(5) + "/" + rs.getString(6) + "/" + 
						rs.getString(7) + "/" + rs.getString(8) + "/" +"$");
			}
			
			System.out.println("Lista Notas : " + lista);

		} catch (Exception e) {
			 
			System.out.println("Error : " + e.getMessage());
			e.printStackTrace();
		}
		
		return lista;
		
	}
	
	public StringBuilder graficoRendimientoCurso(String seccion, String curso, int periodo, int anio)
	{
		StringBuilder lista = new StringBuilder();
		String sql = "select COUNT(*) as Excelentes, (SELECT COUNT(*) from calificaciones  where PromedioFinal between 13.50 and 17.49) AS Bien, " + 
				"(SELECT COUNT(*) from calificaciones where PromedioFinal between 10.5 and 13.49 ) as Regular, (SELECT COUNT(*) from calificaciones  " + 
				"where PromedioFinal between 0 and 10.49) AS Mal from calificaciones " + 
				"where PromedioFinal >= 17.50 and seccion='"+seccion+"' and curso='"+curso+"' and periodo='"+periodo+"' and anio='"+anio+"';";
		
		try 
		{
			Conexion con = new Conexion();
			ResultSet rs = con.executeQuery(sql);
			
			while (rs.next()) {
				
				lista.append(rs.getString(1) + "/" + rs.getString(2) + "/" + rs.getString(3) + "/" + rs.getString(4) + "/" +"$");
			}
			
			

		} catch (Exception e) {
			 
			System.out.println("Error : " + e.getMessage());
			e.printStackTrace();
		}
		
		return lista;
		
	}
}
