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

import Beans.Comunicado;
import Beans.DetalleComunicado;
import Jdbc.ComunicadoJDBC;

@WebServlet({"/RegistrarComunicado", "/BuscarComunicado", "/RegistrarDetalleComunicado", "/ModificarComunicado", "/EliminarComunicado", 
				"/EliminarDetalleComunicado", "/ListarComunicadoNivelacion", "/VisualizarComunicado", "/BuscarComunicadoAlumno"})
public class ServletComunicado extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void service(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {

		try {
			switch (request.getServletPath()) { //jala el nombre del ervlet
			case "/RegistrarComunicado":
				registrarComunicado(request, response);
				break;
			case "/BuscarComunicado":
				buscarComunicado(request, response);
				break;
			case "/BuscarComunicadoAlumno":
				buscarComunicadoAlumno(request, response);
				break;
			case "/RegistrarDetalleComunicado":
				registrarDetalleComunicado(request, response);
				break;
			case "/ModificarComunicado":
				modificarComunicado(request, response);
				break;
			case "/EliminarComunicado":
				eliminarComunicado(request, response);
				break;
			case "/EliminarDetalleComunicado":
				eliminarDetalleComunicado(request, response);
				break;
			case "/ListarComunicadoNivelacion":
				buscarComunicadoNivelacion(request, response);
				break;
			case "/VisualizarComunicado":
				visualizarComunicado(request, response);
				break;
		   } 
		}  catch (Exception e) {
			System.out.println("error :" + e.getMessage());
			e.printStackTrace();
		}


	}
	
	
	private void registrarComunicado(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, JSONException {
		
		boolean prueba = false;
		String respuesta = "0";
		
		String jsonData = request.getParameter("objetojson");
		JSONObject obj = new JSONObject(jsonData);
		JSONArray arr = obj.getJSONArray("linea");
		
		String descripcion = "";
		String tipo = "";
		String fecha = "";
		String seccion = "";
		String docente = "";
		
		Comunicado bean = new Comunicado();
		
		try
		{
			ComunicadoJDBC dao = new ComunicadoJDBC();
			
			for (int i = 0; i < arr.length(); i++) {
				
				descripcion = arr.getJSONObject(i).getString("texto");
				tipo = arr.getJSONObject(i).getString("selectTipo");
				fecha = arr.getJSONObject(i).getString("fecha");
				seccion = arr.getJSONObject(i).getString("selectSeccion");
				docente = arr.getJSONObject(i).getString("txtdni");
				
				bean.setDescripcion(descripcion);
				bean.setTipo(tipo);
				bean.setFechaRegistro(fecha);
				bean.setSeccion(seccion);
				bean.setDocente(docente);
				
				prueba = dao.registrarComunicado(bean);
				
				
			}
			
			respuesta = prueba == true ?   "1" : "0";
			
			System.out.println("respuesta: " + respuesta);
			System.out.println("Se realizo el Servlet REGISTRO DE COMUNICADO correctamente");
			response.setContentType("text/plain");
			response.getWriter().write(respuesta);
			
		} catch(Exception e) {
			
			System.out.println("Error : "+e.getMessage());
			e.printStackTrace();
		}
			
	}
	
	private void registrarDetalleComunicado(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, JSONException {
		
		boolean prueba = false;
		String respuesta = "0";
		
		String jsonData = request.getParameter("objetojson");
		JSONObject obj = new JSONObject(jsonData);
		JSONArray arr = obj.getJSONArray("linea");
		
		String idAlumno = "";
		
		DetalleComunicado bean = new DetalleComunicado();
		
		try
		{
			ComunicadoJDBC dao = new ComunicadoJDBC();
			
			for (int i = 0; i < arr.length(); i++) {
				
				idAlumno = arr.getJSONObject(i).getString("idAlumno");

				
				bean.setIdAlumno(idAlumno);

				
				prueba = dao.registrarDetalleComunicado(bean);
				
				
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
	
	private void buscarComunicado(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		StringBuilder sb = new StringBuilder("");
		List<Comunicado> lista = new ArrayList<Comunicado>();
		String dni = request.getParameter("dni");
		String seccion = request.getParameter("seccion");
		
		try {
			
			ComunicadoJDBC dao = new ComunicadoJDBC();
			lista = dao.buscarComunicado(dni, seccion);
			
			for(Comunicado bean : lista) 
			{
				sb.append(bean.getIdComunicado() + "/" + bean.getDescripcion() + "/" + bean.getFechaRegistro() + "/" +  bean.getTipo() + "$");
			}
		} catch (Exception e) {
			
			
			System.out.println("Error : "+e.getMessage());
			e.printStackTrace();
		}
		
		
		response.setContentType("text/plain");
		response.getWriter().write(sb.toString());
		
		
	}
	
	private void modificarComunicado(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		boolean prueba = false;
		String respuesta = "0";

		String fecha = request.getParameter("fechaMod");
		String tipo  = request.getParameter("tipo");
		String descripcion= request.getParameter("descripcion");
		String id    = request.getParameter("idCom");
		
		
		try {
			
			ComunicadoJDBC dao = new ComunicadoJDBC();
			
			prueba = dao.modificarComunicado(tipo, fecha, descripcion, id);
			
			respuesta = prueba == true ?   "1" : "0";
			System.out.println("respuesta: " + respuesta);
			System.out.println("Se realizo el Servlet Modificar Comunicado correctamente");
			response.setContentType("text/plain");
			response.getWriter().write(respuesta);
	
		}catch(Exception e) 
		{
			System.out.println("Error : "+e.getMessage());
			e.printStackTrace();
		}
		
	}
	
	private void eliminarComunicado(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String id = request.getParameter("idcomunicado");
		
		System.out.println("ID DEL COMUNICADO ES: " + id);
		
		int respuesta = 0;

		try {
			ComunicadoJDBC dao = new ComunicadoJDBC();

			respuesta = dao.eliminarComunicado(id) == true ? 1 : 0;

		} catch (Exception e) {
			
			System.out.println("Error : " + e.getMessage());
			e.printStackTrace();
		}
		response.setContentType("text/plain");
		response.getWriter().write(respuesta);
	}
    
	private void eliminarDetalleComunicado(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String id = request.getParameter("idcomunicado");
		
		System.out.println("ID DEL DETALLE COMUNICADO ES: " + id);
		
		int respuesta = 0;

		try {
			ComunicadoJDBC dao = new ComunicadoJDBC();

			respuesta = dao.eliminarDetalleComunicado(id) == true ? 1 : 0;

		} catch (Exception e) {
			
			System.out.println("Error : " + e.getMessage());
			e.printStackTrace();
		}
		response.setContentType("text/plain");
		response.getWriter().write(respuesta);
	}
	
	private void buscarComunicadoNivelacion(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		StringBuilder sb = new StringBuilder("");
		List<Comunicado> lista = new ArrayList<Comunicado>();
		String dni = request.getParameter("codigo");
		System.out.println("Codigo :" + dni);
		try {
			 
			ComunicadoJDBC dao = new ComunicadoJDBC();
			lista = dao.buscarComunicadoNivelacion(dni);
			
			for(Comunicado bean : lista) 
			{
				sb.append(bean.getIdComunicado() + "|" + bean.getDescripcion() + "|" + bean.getFechaRegistro() + "|" +  bean.getTipo() + "|" + bean.getSeccion() + "|" + "$");
			}
		} catch (Exception e) {
			
			
			System.out.println("Error : "+e.getMessage());
			e.printStackTrace();
		}
		
		
		response.setContentType("text/plain");
		response.getWriter().write(sb.toString());
		
		
	}

	private void visualizarComunicado(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		StringBuilder sb = new StringBuilder("");
		String codigo  = request.getParameter("codigo");
		String respuesta = "";
		
		try {

			ComunicadoJDBC dao = new ComunicadoJDBC();
			sb = dao.visualizarComunicado(codigo);

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
	
	private void buscarComunicadoAlumno(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		StringBuilder sb = new StringBuilder("");
		List<Comunicado> lista = new ArrayList<Comunicado>();
		String codigo = request.getParameter("codigo");
		
		try {
			
			ComunicadoJDBC dao = new ComunicadoJDBC();
			lista = dao.buscarComunicadoAlumno(codigo); 
			
			for(Comunicado bean : lista) 
			{
				sb.append(bean.getIdComunicado() + "/" + bean.getDescripcion() + "/" + bean.getFechaRegistro() + "/" +  bean.getTipo() + "$");
			}
		} catch (Exception e) {
			
			
			System.out.println("Error : "+e.getMessage());
			e.printStackTrace();
		}
		
		
		response.setContentType("text/plain");
		response.getWriter().write(sb.toString());
		
		
	}

}
