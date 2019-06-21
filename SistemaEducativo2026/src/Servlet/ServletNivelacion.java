package Servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;


import Beans.Nivelacion;
import Beans.DetalleNivelacion;
import Jdbc.AsistenciaNivelacionJDBC;
import Jdbc.ComunicadoJDBC;
import Jdbc.NivelacionJDBC;
import Jdbc.Sesion_AprendizajeJDBC;


@WebServlet({"/RegistrarNivelacion", "/RegistrarDetalleNivelacion", "/ListarNivelacion", "/ListarAlumnosNivelacion",
				"/NivelacionSeccionxCurso", "/ListarNivelacionDocente", "/ListarClaseNivelacion", "/ListarAsistenciaNivelacion", 
				"/ModificarEstadoSesion"})
public class ServletNivelacion extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public ServletNivelacion() {
        super();
       
    }


	protected void service(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		try {
			switch (request.getServletPath()) { //jala el nombre del ervlet
			case "/RegistrarNivelacion":
				registrarNivelacion(request, response);
				break;
			case "/RegistrarDetalleNivelacion":
				registrarDetalleNivelacion(request, response);
				break;
			case "/ListarNivelacion":
				listarNivelacion(request, response);
				break;
			case "/ListarAlumnosNivelacion":
				listarAlumnosNivelacion(request, response);
				break;
			case "/NivelacionSeccionxCurso":
				nivelacionSeccionxCurso(request, response);
				break;
			case "/ListarNivelacionDocente":
				listarNivelacionDocente(request, response);
				break;
			case "/ListarClaseNivelacion":
				listarClaseNivelacion(request, response);
				break;
			case "/ListarAsistenciaNivelacion":
				listarAsistenciaNivelacion(request, response);
				break;
			case "/ModificarEstadoSesion":
				modificarEstadoSesion(request, response);
				break;
		   } 
		}  catch (Exception e) {
			System.out.println("error :" + e.getMessage());
			e.printStackTrace();
		}
		
	}
	
	private void registrarNivelacion(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, JSONException {
		
		boolean prueba = false;
		String respuesta = "0";
		
		String jsonData = request.getParameter("objetojson");
		JSONObject obj = new JSONObject(jsonData);
		JSONArray arr = obj.getJSONArray("linea");
		
		String descripcion = "";
		String seccion = "";
		String curso = "";
		int periodo = 0;
		int anio = 0;
		String docente = "";
		String dia = "";
		String inicio = "";
		String fin = "";
		String fechaInicio = "";
		String fechaFin    = "";
		String fechaCreada = "";
		
		Nivelacion bean = new Nivelacion();
		
		try
		{
			NivelacionJDBC dao = new NivelacionJDBC();
			
			for (int i = 0; i < arr.length(); i++) {
				
				descripcion = arr.getJSONObject(i).getString("descripcion");
				seccion = arr.getJSONObject(i).getString("seccion");
				curso   = arr.getJSONObject(i).getString("curso");
				periodo = arr.getJSONObject(i).getInt("periodo");
				anio    = arr.getJSONObject(i).getInt("anio");
				docente = arr.getJSONObject(i).getString("txtdni");
				dia   = arr.getJSONObject(i).getString("dia");
				inicio = arr.getJSONObject(i).getString("inicio");
				fin  = arr.getJSONObject(i).getString("fin");
				fechaInicio = arr.getJSONObject(i).getString("fechaInicio");
				fechaFin    = arr.getJSONObject(i).getString("fechaFin");
				fechaCreada = arr.getJSONObject(i).getString("fechaCreada");
				
				
				bean.setDescripcion(descripcion);
				bean.setSeccion(seccion);
				bean.setCurso(curso);
				bean.setPeriodo(periodo);
				bean.setAnio(anio);
				bean.setDocente(docente);
				bean.setDia(dia);
				bean.setHoraInicio(inicio);
				bean.setHoraFin(fin);
				bean.setFechaInicio(fechaInicio);
				bean.setFechaFin(fechaFin);
				bean.setFechaCreacion(fechaCreada);
				
				prueba = dao.registrarNivelacion(bean);
				
				
			}
			
			respuesta = prueba == true ?   "1" : "0";
			
			System.out.println("respuesta: " + respuesta);
			System.out.println("Se realizo el Servlet REGISTRO DE NIVELACION correctamente");
			response.setContentType("text/plain");
			response.getWriter().write(respuesta);
			
		} catch(Exception e) {
			
			System.out.println("Error : "+e.getMessage());
			e.printStackTrace();
		}
			
	}
	
	private void registrarDetalleNivelacion(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, JSONException {
		
		boolean prueba = false;
		String respuesta = "0";
		
		String jsonData = request.getParameter("objetojson");
		JSONObject obj = new JSONObject(jsonData);
		JSONArray arr = obj.getJSONArray("linea");
		
		String idAlumno = "";
		
		DetalleNivelacion bean = new DetalleNivelacion();
		
		try
		{
			NivelacionJDBC dao = new NivelacionJDBC();
			
			for (int i = 0; i < arr.length(); i++) {
				
				idAlumno = arr.getJSONObject(i).getString("idAlumno");

				
				bean.setIdAlumno(idAlumno);

				
				prueba = dao.registrarDetalleNivelacion(bean);
				
				
			}
			
			respuesta = prueba == true ?   "1" : "0";
			
			System.out.println("respuesta: " + respuesta);
			System.out.println("Se realizo el Servlet DETALLE DE NIVELACION correctamente");
			response.setContentType("text/plain");
			response.getWriter().write(respuesta);
			
		} catch(Exception e) {
			
			System.out.println("Error : "+e.getMessage());
			e.printStackTrace();
		}
		
	}
	
	private void listarNivelacion(HttpServletRequest request, HttpServletResponse response) throws Exception {

		
		List<Nivelacion> lista = new ArrayList<Nivelacion>();
		StringBuilder sb = new StringBuilder("");

		try {
			NivelacionJDBC dao = new NivelacionJDBC();
			lista = dao.listarNivelacion();

			for (Nivelacion bean : lista) {
				sb.append(bean.getIdNivelacion() + "/" + bean.getDescripcion() +  ":");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		response.setContentType("text/plain");
		response.getWriter().write(sb.toString());

	}

	private void listarAlumnosNivelacion(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String grupo   = request.getParameter("grupo");
		System.out.println("DATOS: " + grupo);
		
		StringBuilder sb = new StringBuilder("");
		
		try {
			
			NivelacionJDBC dao = new NivelacionJDBC();
			sb = dao.listarGrupoNivelacion(grupo);
			
		} catch (Exception e) {
			
			System.out.println("Error : " + e.getMessage());
			e.printStackTrace();
		}
	
		response.setContentType("text/plain");
		response.getWriter().write(sb.toString());
	
	}
	
	private void nivelacionSeccionxCurso(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String codigo   = request.getParameter("codigo");
		System.out.println("Servlet-Codigo: " + codigo);
		
		StringBuilder sb = new StringBuilder("");
		
		try {
			
			NivelacionJDBC dao = new NivelacionJDBC();
			sb = dao.nivelacionSeccionxCurso(codigo);
			
		} catch (Exception e) {
			
			System.out.println("Error : " + e.getMessage());
			e.printStackTrace();
		}
	
		response.setContentType("text/plain");
		response.getWriter().write(sb.toString());
	
	}
	
	private void listarNivelacionDocente(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		StringBuilder sb = new StringBuilder("");
		String docente  = request.getParameter("docente");
		String seccion = request.getParameter("seccion");
		String respuesta = "";
		
		try {

			NivelacionJDBC dao = new NivelacionJDBC();
			sb = dao.buscarNivelacionDocente(docente, seccion);
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
	
	private void listarClaseNivelacion(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		StringBuilder sb = new StringBuilder("");
		String grupo    = request.getParameter("nivelacion");
		int mes	    	= Integer.parseInt(request.getParameter("mes"));
		int anio		= Integer.parseInt(request.getParameter("anio"));
		
		String respuesta = "";
		
		try {

			NivelacionJDBC dao = new NivelacionJDBC();
			sb = dao.clasesNivelacion(grupo, mes, anio);
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
	
	private void listarAsistenciaNivelacion(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		StringBuilder sb = new StringBuilder("");
		String clase    = request.getParameter("clase");
		
		String respuesta = "";
		
		try {

			AsistenciaNivelacionJDBC dao = new AsistenciaNivelacionJDBC();
			sb = dao.asistenciaNivelacion(clase);
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
	
	private void modificarEstadoSesion(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		boolean prueba = false;
		String respuesta = "0";

		String estado = request.getParameter("estado");
		String codigo = request.getParameter("codigo");
		
		try {
			
			Sesion_AprendizajeJDBC dao = new Sesion_AprendizajeJDBC();
			
			prueba = dao.modificarSesion(codigo, estado);
			
			respuesta = prueba == true ?   "1" : "0";
			System.out.println("respuesta: " + respuesta);
			System.out.println("Se realizo el Servlet Modificar Estado Sesion Aprendizaje correctamente");
			response.setContentType("text/plain");
			response.getWriter().write(respuesta);
	
		}catch(Exception e) 
		{
			System.out.println("Error : "+e.getMessage());
			e.printStackTrace();
		}
		
	}
}
