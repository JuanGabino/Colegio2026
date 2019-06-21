package Jdbc;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;


import Beans.Curso;
import Util.Conexion;

public class CursoJDBC {

	public List<Curso> buscarCursoDocente(String dni)
	{
		List<Curso> lista = new ArrayList<Curso>();
		String sql = "select distinct d.id_curso, c.asignatura from doc_sec_cur d inner join cursos c on d.id_curso = c.idCurso " + 
				"where d.id_docente = (select idDocente from docentes where dniDocente = '"+dni+"');";
		
		try
		{
			Conexion con = new Conexion();
			ResultSet rs = con.executeQuery(sql);
			
		
			while(rs.next()) {
				
				Curso bean = new Curso();
				bean.setIdCurso(rs.getString(1));
				bean.setAsignatura(rs.getString(2));
				
				lista.add(bean);
			}			
			
			System.out.println("Se realizo la sentencia correcta: LISTA DE CURSOS X DOCENTES" + lista);
			
			
		} catch(Exception e){
			
			e.getStackTrace();
			System.out.println("El valor del nombre es" + "-" + dni);
			
		}
		
		return lista;
	}
	
	public List<Curso> listarCursos(){
		
		List<Curso> lista = new ArrayList<Curso>();
		
		try{
			Conexion con = new Conexion();
			String sql = "select idCurso, asignatura from cursos;";
			System.out.println("consulta :"+sql);
			
			ResultSet rs = con.executeQuery(sql);
			
			while(rs.next()){

				Curso bean = new Curso();
				bean.setIdCurso(rs.getString(1));
				bean.setAsignatura(rs.getString(2));
				lista.add(bean);
			}
			
			System.out.println("lista:"+lista);
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return lista;
	}
	
	public StringBuilder listarAreaCurricular(String curso)
	{
		StringBuilder lista = new StringBuilder();
		String sql = "select d.dniDocente, d.nombre, d.apellidoPat, d.apellidoMat, d.nivel, c.asignatura " + 
				"from doc_sec_cur de inner join docentes d on d.idDocente = de.id_docente " + 
				"inner join cursos c on c.idCurso = de.id_curso " + 
				"where de.id_curso = '"+curso+"' " + 
				"group by d.dniDocente;";
		
		try 
		{
			Conexion con = new Conexion();
			ResultSet rs = con.executeQuery(sql);
			
			while (rs.next()) {
				
				lista.append(rs.getString(1) + "/" + rs.getString(2) + "/" + rs.getString(3) + "/" + rs.getString(4) + "/" + rs.getString(5) + "/" + rs.getString(6) + "/" + "$");
			}
			
			System.out.println("lista: " + lista);
			

		} catch (Exception e) {
			 
			System.out.println("Error : " + e.getMessage());
			e.printStackTrace();
		}
		
		return lista;
		
	}
	
	public List<Curso> buscarCursosDocente(String codigo, String seccion)
	{
		List<Curso> lista = new ArrayList<Curso>();
		String sql = "select distinct d.id_curso, c.asignatura from doc_sec_cur d inner join cursos c on d.id_curso = c.idCurso  " + 
					"where d.id_docente = '"+codigo+"' and d.id_seccion = '"+seccion+"';";
		
		try
		{
			Conexion con = new Conexion();
			ResultSet rs = con.executeQuery(sql);
			
		
			while(rs.next()) {
				
				Curso bean = new Curso();
				bean.setIdCurso(rs.getString(1));
				bean.setAsignatura(rs.getString(2));
				
				lista.add(bean);
			}			
			
			System.out.println("Se realizo la sentencia correcta: LISTA DE CURSOS X DOCENTES" + lista);
			
			
		} catch(Exception e){
			
			e.getStackTrace();
			
		}
		
		return lista;
	}
}
