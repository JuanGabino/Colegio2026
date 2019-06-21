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

import Beans.DetalleObservacion;
import Beans.Observaciones;
import Jdbc.ObservacionesJDBC;

@WebServlet({"/RegistrarObservaciones", "/BuscarObservacion", "/RegistrarDetalleObservacion", "/EliminarObservacion" ,
			"/BuscarObservacionMensual"})
public class ServletObservaciones extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public ServletObservaciones() {
        super();
       
    }


	protected void service(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {

		try {
			switch (request.getServletPath()) { //jala el nombre del ervlet
			case "/RegistrarObservaciones":
				registrarObservaciones(request, response);
				break;
			case "/BuscarObservacion":
				listarObservaciones(request, response);
				break;
			case "/RegistrarDetalleObservacion":
				registrarDetalleObservacion(request, response);
				break;
			case "/EliminarObservacion":
				eliminarObservacion(request, response);
				break;
			case "/BuscarObservacionMensual":
				buscarObservacionesMensual(request, response);
				break;
		   } 
		}  catch (Exception e) {
			System.out.println("error :" + e.getMessage());
			e.printStackTrace();
		}

	}
	
	
	private void registrarObservaciones(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, JSONException {
		
		boolean prueba = false;
		String respuesta = "0";
		
		String jsonData = request.getParameter("objetojson");
		JSONObject obj = new JSONObject(jsonData);
		JSONArray arr = obj.getJSONArray("linea");
		
		String alumno = "";
		String descripcion = "";
		String fecha = "";
		String seccion = "";
		String docente = "";
		String curso = "";
		
		Observaciones bean = new Observaciones();
		
		try
		{
			ObservacionesJDBC dao = new ObservacionesJDBC();
			
			for (int i = 0; i < arr.length(); i++) {
				
				alumno = arr.getJSONObject(i).getString("alumno");
				descripcion = arr.getJSONObject(i).getString("texto");
				fecha = arr.getJSONObject(i).getString("fecha");
				seccion = arr.getJSONObject(i).getString("selectSeccion");
				curso   = arr.getJSONObject(i).getString("idcurso");
				docente = arr.getJSONObject(i).getString("txtdni");
				
				bean.setObervaciones(descripcion);
				bean.setAlumno(alumno);
				bean.setFecha(fecha);
				bean.setSeccion(seccion);
				bean.setCurso(curso);
				bean.setDocente(docente);
				
				prueba = dao.registrarObservacion(bean);
				
				
			}
			
			respuesta = prueba == true ?   "1" : "0";
			
			System.out.println("respuesta: " + respuesta);
			System.out.println("Se realizo el Servlet registro obs correctamente");
			response.setContentType("text/plain");
			response.getWriter().write(respuesta);
			
		} catch(Exception e) {
			
			System.out.println("Error : "+e.getMessage());
			e.printStackTrace();
		}
			
	}
	
	private void registrarDetalleObservacion(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, JSONException {
		
		boolean prueba = false;
		String respuesta = "0";
		
		String jsonData = request.getParameter("objetojson");
		JSONObject obj = new JSONObject(jsonData);
		JSONArray arr = obj.getJSONArray("linea");
		
		String idAlumno = "";
		String idObservacion = "";
		
		DetalleObservacion bean = new DetalleObservacion();
		
		try
		{
			ObservacionesJDBC dao = new ObservacionesJDBC();
			
			for (int i = 0; i < arr.length(); i++) {
				
				idAlumno = arr.getJSONObject(i).getString("idAlumno");
				idObservacion = arr.getJSONObject(i).getString("idObservacion");

				
				bean.setIdalumno(idAlumno);
				bean.setIdobservacion(idObservacion);

				
				prueba = dao.registrarDetalleObservaciones(bean); 
				
				
			}
			
			respuesta = prueba == true ?   "1" : "0";
			
			System.out.println("respuesta: " + respuesta);
			System.out.println("Se realizo el Servlet correctamente");
			response.setContentType("text/plain");
			response.getWriter().write(respuesta);
			
		} catch(Exception e) {
			
			System.out.println("Error : "+e.getMessage());
			e.printStackTrace();
		}
		
	}
	
	private void listarObservaciones(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String dni= request.getParameter("dni");
		String seccion = request.getParameter("seccion");
		
		StringBuilder sb = new StringBuilder("");
		
		try {
			
			ObservacionesJDBC dao = new ObservacionesJDBC();
			sb = dao.buscarObservacion(dni, seccion);
					
		} catch (Exception e) {
			
			e.printStackTrace();
		}
	
		response.setContentType("text/plain");
		response.getWriter().write(sb.toString());
		
	}
	
	private void eliminarObservacion(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String id = request.getParameter("idobservacion");
		
		System.out.println("ID DE la OBSERVACION ES: " + id);
		
		int respuesta = 0;

		try {
			ObservacionesJDBC dao = new ObservacionesJDBC();

			respuesta = dao.eliminarObservacion(id) == true ? 1 : 0;

		} catch (Exception e) {
			
			System.out.println("Error : " + e.getMessage());
			e.printStackTrace();
		}
		response.setContentType("text/plain");
		response.getWriter().write(respuesta);
	}
	
	private void buscarObservacionesMensual(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String dni= request.getParameter("dni");
		String seccion = request.getParameter("seccion");
		String mes  = request.getParameter("mes");
		String respuesta = "";
		
		StringBuilder sb = new StringBuilder("");
		
		try {
			
			ObservacionesJDBC dao = new ObservacionesJDBC();
			sb = dao.buscarObservacionMensual(dni, seccion, mes);
			
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
