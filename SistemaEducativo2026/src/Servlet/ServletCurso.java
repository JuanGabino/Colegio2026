package Servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.List;

import Beans.Curso;
import Beans.DetalleCursoSeccion;
import Jdbc.CursoJDBC;
import Jdbc.DetalleCursoSeccionJDBC;
import Jdbc.DocentesJDBC;

@WebServlet({"/ListarCursoDocente", "/ListarCursos", "/RegistrarCursoSeccion", "/ListarAreaCurricular", "/ListarCursosDocentes"})
public class ServletCurso extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public ServletCurso() {
       super();
      
    }


	protected void service(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {

		try {
			switch (request.getServletPath()) {
			case "/ListarCursoDocente":
				listarCursoDocente(request, response);
				break;
			case "/ListarCursos":
				listarCursos(request, response);
				break;
			case "/RegistrarCursoSeccion":
				registrarCursoSeccion(request, response);
				break;
			case "/ListarAreaCurricular":
				listarAreaCurricular(request, response);
				break;
			case "/ListarCursosDocentes":
				listarCursosDocentes(request, response);
				break;
		   } 
		}  catch (Exception e) {
			System.out.println("error :" + e.getMessage());
			e.printStackTrace();
		}

	}
	
	
	private void listarCursoDocente(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		StringBuilder sb = new StringBuilder("");
		List<Curso> lista = new ArrayList<Curso>();
		String dni = request.getParameter("dni");
		
		try {
			
				CursoJDBC dao = new CursoJDBC();
				lista = dao.buscarCursoDocente(dni);
				
				
				for(Curso bean : lista)
					{
						sb.append(bean.getIdCurso() + "-" + bean.getAsignatura() + ":");
						System.out.println("Los cursos son: " + bean.getIdCurso() + "-" + bean.getAsignatura() + ":");
					}
					
			
		} catch(Exception e) {
			
			System.out.println("Error : "+e.getMessage());
			e.printStackTrace();
		}
		
		response.setContentType("text/plain");
		response.getWriter().write(sb.toString());
		
	}
	
	private void listarCursos(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		StringBuilder sb = new StringBuilder("");
		List<Curso> lista = new ArrayList<Curso>();
		
		try {
			
				CursoJDBC dao = new CursoJDBC();
				lista = dao.listarCursos();
				
				
				for(Curso bean : lista)
					{
						sb.append(bean.getIdCurso() + "-" + bean.getAsignatura() + ":");
						System.out.println("Los cursos son: " + bean.getIdCurso() + "-" + bean.getAsignatura() + ":");
					}
					
			
		} catch(Exception e) {
			
			System.out.println("Error : "+e.getMessage());
			e.printStackTrace();
		}
		
		response.setContentType("text/plain");
		response.getWriter().write(sb.toString());
		
	}
	
	private void registrarCursoSeccion(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, JSONException {
		
		boolean prueba = false;
		String respuesta = "0";
		
		String jsonData = request.getParameter("objetojson");
		JSONObject obj = new JSONObject(jsonData);
		JSONArray arr = obj.getJSONArray("linea");
		
		String docente = "";
		String curso = "";
		String seccion = "";
		
		DetalleCursoSeccion bean = new DetalleCursoSeccion();
		
		try
		{
			DetalleCursoSeccionJDBC dao = new DetalleCursoSeccionJDBC();
			
			for (int i = 0; i < arr.length(); i++) {
				
				docente = arr.getJSONObject(i).getString("docente");
				curso = arr.getJSONObject(i).getString("curso");
				seccion = arr.getJSONObject(i).getString("seccion");
			
				
				bean.setIdDocente(docente);
				bean.setIdSeccion(seccion);
				bean.setIdCurso(curso);
				
				prueba = dao.registrarDetalleCurso(bean);
	
			}
			
			respuesta = prueba == true ?   "1" : "0";
			
			System.out.println("respuesta: " + respuesta);
			System.out.println("Se realizo el Servlet REGISTRO DE CURSOS y SECCIONES correctamente");
			response.setContentType("text/plain");
			response.getWriter().write(respuesta);
			
		} catch(Exception e) {
			
			System.out.println("Error : "+e.getMessage());
			e.printStackTrace();
		}
			
	}
	
	private void listarAreaCurricular(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		StringBuilder sb = new StringBuilder("");
		String codigo  = request.getParameter("area");

		String respuesta = "";
		
		try {

			CursoJDBC dao = new CursoJDBC();
			sb = dao.listarAreaCurricular(codigo);

			if(sb.toString().equals(""))
			{
				respuesta = "vacio";
			}
			else
			{
				respuesta = sb.toString();
			}
		} catch (Exception e) {
			
			e.printStackTrace();
		}
	
		System.out.println("respuesta: " + respuesta);
		response.setContentType("text/plain");
		response.getWriter().write(respuesta);
	
	}
	
	private void listarCursosDocentes(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		StringBuilder sb = new StringBuilder("");
		List<Curso> lista = new ArrayList<Curso>();
		String codigo = request.getParameter("codigo");
		String seccion = request.getParameter("seccion");
		
		try {
			
				CursoJDBC dao = new CursoJDBC();
				lista = dao.buscarCursosDocente(codigo, seccion);
				
				
				for(Curso bean : lista)
					{
						sb.append(bean.getIdCurso() + "-" + bean.getAsignatura() + ":");
						System.out.println("Los cursos son: " + bean.getIdCurso() + "-" + bean.getAsignatura() + ":");
					}
					
			
		} catch(Exception e) {
			
			System.out.println("Error : "+e.getMessage());
			e.printStackTrace();
		}
		
		response.setContentType("text/plain");
		response.getWriter().write(sb.toString());
		
	}


}
