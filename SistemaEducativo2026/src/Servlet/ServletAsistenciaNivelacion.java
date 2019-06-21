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

import Beans.Asistencia;
import Beans.DetalleAsistenciaNivelacion;
import Beans.DetalleCirculoEstudio;
import Jdbc.AsistenciaNivelacionJDBC;
import Jdbc.CirculoEstudioJDBC;


@WebServlet({"/RegistrarAsistenciaNivelacion", "/RegistrarDetalleAsistenciaNivelacion"})
public class ServletAsistenciaNivelacion extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public ServletAsistenciaNivelacion() {
        super();
        
    }

	protected void service(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		try {
			switch (request.getServletPath()) { //jala el nombre del ervlet
			case "/RegistrarAsistenciaNivelacion":
				registrarAsistenciaNivelacion(request, response);
				break;
			case "/RegistrarDetalleAsistenciaNivelacion":
				registrarDetalleAsistenciaNivelacion(request, response);
				break;
			
		   } 
		}  catch (Exception e) {
			System.out.println("error :" + e.getMessage());
			e.printStackTrace();
		}
		
	}
	
	private void registrarAsistenciaNivelacion(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, JSONException {
		
		boolean prueba = false;
		String respuesta = "0";
		
		String jsonData = request.getParameter("objetojson");
		JSONObject obj = new JSONObject(jsonData);
		JSONArray arr = obj.getJSONArray("linea");
		
		String fecha  = "";
		String grupo  = "";
		String clase  = "";
		String tema   = "";
		String salon  = "";
		
		Asistencia bean = new Asistencia();
		
		try
		{
			AsistenciaNivelacionJDBC dao = new AsistenciaNivelacionJDBC();
			
			for (int i = 0; i < arr.length(); i++) {
				
				fecha = arr.getJSONObject(i).getString("fecha");
				grupo = arr.getJSONObject(i).getString("grupo");
				clase = arr.getJSONObject(i).getString("clase");
				tema  = arr.getJSONObject(i).getString("tema");
				salon = arr.getJSONObject(i).getString("salon");
		
				
				bean.setFecha(fecha);
				bean.setGrupoNivelacion(grupo);
				bean.setClase(clase);
				bean.setTema(tema);
				bean.setSalon(salon);
				
				prueba = dao.registrarAsistenciaNivelacion(bean);
				
				
			}
			
			respuesta = prueba == true ?   "1" : "0";
			
			System.out.println("respuesta: " + respuesta + "-" + "El salon es: " + salon);
			System.out.println("Se realizo el Servlet REGISTRO DE ASISTENCIA DE NIVELACION correctamente");
			response.setContentType("text/plain");
			response.getWriter().write(respuesta);
			
		} catch(Exception e) {
			
			System.out.println("Error : "+e.getMessage());
			e.printStackTrace();
		}
			
	}
	
	private void registrarDetalleAsistenciaNivelacion(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, JSONException {
		
		boolean prueba = false;
		String respuesta = "0";
		
		String jsonData = request.getParameter("objetojson");
		JSONObject obj = new JSONObject(jsonData);
		JSONArray arr = obj.getJSONArray("linea");
		
		String idAlumno = "";
		String estado = "";
		
		DetalleAsistenciaNivelacion bean = new DetalleAsistenciaNivelacion();
		
		try
		{
			AsistenciaNivelacionJDBC dao = new AsistenciaNivelacionJDBC();
			
			for (int i = 0; i < arr.length(); i++) {
				
				idAlumno = arr.getJSONObject(i).getString("alumno");
				estado   = arr.getJSONObject(i).getString("estado");
				
				
				bean.setIdAlumno(idAlumno);
				bean.setEstado(estado);
				System.out.println("datos: " + idAlumno + "-" + estado);
				prueba = dao.registrarDetalleAsistenciaNivelacion(bean);
				
				
			}
			
			respuesta = prueba == true ?   "1" : "0";
			
			System.out.println("respuesta: " + respuesta);
			System.out.println("Se realizo el Servlet DETALLE ASISTENCIA NIVELACION correctamente");
			response.setContentType("text/plain");
			response.getWriter().write(respuesta);
			
		} catch(Exception e) {
			
			System.out.println("Error : "+e.getMessage());
			e.printStackTrace();
		}
		
	}

	

}
