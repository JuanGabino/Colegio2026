package Jdbc;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import Beans.AnioEscolar;
import Beans.Periodo;
import Util.Conexion;

public class PeriodoJDBC {

public List<Periodo> listarPeriodo(){
		
		List<Periodo> lista = new ArrayList<Periodo>();
		
		try{
			Conexion con = new Conexion();
			String sql = "select idPeriodo, descripcion from periodo;";
			System.out.println("consulta :"+sql);
			
			ResultSet rs = con.executeQuery(sql);
			
			while(rs.next()){

				Periodo bean = new Periodo();
				bean.setIdPeriodo(rs.getInt(1));
				bean.setDescripcion(rs.getString(2));
				lista.add(bean);
			}
			
			System.out.println("lista:"+lista);
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return lista;
	}

public List<AnioEscolar> listarAnio(){
	
	List<AnioEscolar> lista = new ArrayList<AnioEscolar>();
	
	try{
		Conexion con = new Conexion();
		String sql = "select idAnio, Anio from anioescolar;";
		System.out.println("consulta :"+sql);
		
		ResultSet rs = con.executeQuery(sql);
		
		while(rs.next()){

			AnioEscolar bean = new AnioEscolar();
			bean.setIdAnio(rs.getInt(1));
			bean.setAnio(rs.getInt(2));
			lista.add(bean);
		}
		
		System.out.println("lista:"+lista);
	}catch(Exception e){
		e.printStackTrace();
	}
	
	return lista;
  }

public StringBuilder semanasBimestre(int bimestre)
{
	StringBuilder semanas = new StringBuilder();
	System.out.println("El bimestre es:" + bimestre);
	
	String sql = "select descripcion, NumSemanas from periodo where idPeriodo ="+bimestre+";" ;
	System.out.println("consulta :"+sql);
	
	try 
	{
		Conexion con = new Conexion();
		ResultSet rs = con.executeQuery(sql);
		
		while (rs.next()) {
			
			semanas.append(rs.getString(1) + "-" + rs.getInt(2) + "-" + "$");
		}


	} catch (Exception e) {
		 
		System.out.println("Error : " + e.getMessage());
		e.printStackTrace();
	}
	
	return semanas;
}
}
