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

import Beans.CirculoEstudio;
import Beans.DetalleCirculoEstudio;
import Jdbc.CirculoEstudioJDBC;
import Jdbc.ObservacionesJDBC;



@WebServlet({"/RegistrarCirculoEstudio", "/RegistrarDetalleCirculo", "/ListarCirculoDocente", "/BuscarAlumnoCirculo"})
public class ServletCirculoEstudio extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public ServletCirculoEstudio() {
        super();
        
    }

	
	protected void service(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		try {
			switch (request.getServletPath()) {  
			case "/RegistrarCirculoEstudio":
				registrarCirculoEstudio(request, response);
				break;
			case "/RegistrarDetalleCirculo":
				registrarDetalleCirculoEstudio(request, response);
				break;
			case "/ListarCirculoDocente":
				listarCirculoDocente(request, response);
				break;
			case "/BuscarAlumnoCirculo":
				buscarAlumnoCirculo(request, response);
				break;
				
		   } 
		}  catch (Exception e) {
			System.out.println("error :" + e.getMessage());
			e.printStackTrace();
		}

		
	}
	
	private void registrarCirculoEstudio(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, JSONException {
		
		boolean prueba = false;
		String respuesta = "0";
		
		String jsonData = request.getParameter("objetojson");
		JSONObject obj = new JSONObject(jsonData);
		JSONArray arr = obj.getJSONArray("linea");
		
		String seccion = "";
		String curso = "";
		String anio = "";
		String descripcion = "";
		String fecha = "";
		String docente = "";
		String dia = "";
		String inicio = "";
		String fin = "";
		
		CirculoEstudio bean = new CirculoEstudio();
		
		try
		{
			CirculoEstudioJDBC dao = new CirculoEstudioJDBC();
			
			for (int i = 0; i < arr.length(); i++) {
				
				seccion = arr.getJSONObject(i).getString("seccion");
				curso   = arr.getJSONObject(i).getString("curso");
				anio    = arr.getJSONObject(i).getString("anio");
				descripcion = arr.getJSONObject(i).getString("descripcion");
				fecha = arr.getJSONObject(i).getString("fecha");
				dia   = arr.getJSONObject(i).getString("dia");
				inicio = arr.getJSONObject(i).getString("inicio");
				fin  = arr.getJSONObject(i).getString("fin");
				docente = arr.getJSONObject(i).getString("txtdni");
				
				bean.setSeccion(seccion);
				bean.setCurso(curso);
				bean.setAnio(anio);
				bean.setDescripcion(descripcion);
				bean.setDocente(docente);
				bean.setDia(dia);
				bean.setHoraInicio(inicio);
				bean.setHoraFin(fin);
				bean.setFecha(fecha);
				
				prueba = dao.registrarCirculoEstudio(bean);
				
				
			}
			
			respuesta = prueba == true ?   "1" : "0";
			
			System.out.println("respuesta: " + respuesta);
			System.out.println("Se realizo el Servlet REGISTRO DE Circulo correctamente");
			response.setContentType("text/plain");
			response.getWriter().write(respuesta);
			
		} catch(Exception e) {
			
			System.out.println("Error : "+e.getMessage());
			e.printStackTrace();
		}
			
	}
	
	private void registrarDetalleCirculoEstudio(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, JSONException {
		
		boolean prueba = false;
		String respuesta = "0";
		
		String jsonData = request.getParameter("objetojson");
		JSONObject obj = new JSONObject(jsonData);
		JSONArray arr = obj.getJSONArray("linea");
		
		String idAlumno = "";
		
		DetalleCirculoEstudio bean = new DetalleCirculoEstudio();
		
		try
		{
			CirculoEstudioJDBC dao = new CirculoEstudioJDBC();
			
			for (int i = 0; i < arr.length(); i++) {
				
				idAlumno = arr.getJSONObject(i).getString("idAlumno");

				
				bean.setIdAlumno(idAlumno);

				
				prueba = dao.registrarDetalleCirculo(bean);
				
				
			}
			
			respuesta = prueba == true ?   "1" : "0";
			
			System.out.println("respuesta: " + respuesta);
			System.out.println("Se realizo el Servlet DETALLE CIRCULO ESTUDIO correctamente");
			response.setContentType("text/plain");
			response.getWriter().write(respuesta);
			
		} catch(Exception e) {
			
			System.out.println("Error : "+e.getMessage());
			e.printStackTrace();
		}
		
	}
	
	private void listarCirculoDocente(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		StringBuilder sb = new StringBuilder("");
		String codigo  = request.getParameter("codigo");
		String seccion = request.getParameter("seccio");
		String respuesta = "";
		
		try {

			CirculoEstudioJDBC dao = new CirculoEstudioJDBC();
			sb = dao.buscarDocenteCirculo(codigo, seccion);
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
	
	private void buscarAlumnoCirculo(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String docente = request.getParameter("docente");
		String circulo = request.getParameter("circulo");

		String respuesta = "";
		
		StringBuilder sb = new StringBuilder("");
		
		try {
			
			CirculoEstudioJDBC dao = new CirculoEstudioJDBC();
			sb = dao.buscarAlumnoCirculo(docente, circulo);
			
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
	
	
	

}
