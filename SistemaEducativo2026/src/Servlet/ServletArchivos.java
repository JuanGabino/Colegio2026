package Servlet;

import java.io.IOException;
import java.io.InputStream;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import Beans.InteraccionDocente;
import Beans.Sesion_Aprendizaje;
import Beans.Trabajo_Colegiado;
import Jdbc.Sesion_AprendizajeJDBC;
import Jdbc.TrabajoColegiadoJDBC;

 
@WebServlet({"/SubirArchivos", "/ArchivoColegiado", "/ArchivoDocente"})
@MultipartConfig(maxFileSize = 16177215)
public class ServletArchivos extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public ServletArchivos() {
        super();
        // TODO Auto-generated constructor stub
    }

	 
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			switch (request.getServletPath()) { //jala el nombre del ervlet
			case "/SubirArchivos":
				subirArchivo(request, response);
				break;
			case "/ArchivoColegiado":
				archivoColegiado(request, response);
				break;
			case "/ArchivoDocente":
				archivoDocente(request, response);
				break;
		   } 
		}  catch (Exception e) {
			System.out.println("error :" + e.getMessage());
			e.printStackTrace();
		}


	}
	
	private void subirArchivo(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException{

		boolean prueba = false;
		String respuesta = "0";
		
		String docente = request.getParameter("txtcodDocente");
		String fecha   = request.getParameter("fechainicio");
		String nivelacion = request.getParameter("nivelacion");
		String seccion  = request.getParameter("txtseccion");
		String curso    = request.getParameter("txtcurso");
		String titulo   = request.getParameter("txttitulo");
		String estado  = "No Revisado";
		
		System.out.println("datos:" + docente + "-" + fecha + "-" + nivelacion + "-" + seccion + "-" + curso + "-" + titulo);
		InputStream inputStream = null;
		
		Part filePart = request.getPart("archivo");
		if(filePart.getSize() > 0)
		{
			System.out.println(filePart.getName());
			System.out.println(filePart.getSize());
			System.out.println(filePart.getContentType());
			
			inputStream = filePart.getInputStream();
		}
		
		Sesion_Aprendizaje bean = new Sesion_Aprendizaje();
		
		try
		{
			Sesion_AprendizajeJDBC dao = new Sesion_AprendizajeJDBC();
			
			bean.setTitulo(titulo);
			bean.setNivelacion(nivelacion);
			bean.setSeccion(seccion);
			bean.setCurso(curso);
			bean.setDocente(docente);
			bean.setArchivo(inputStream);
			bean.setFechaCreacion(fecha);
			bean.setEstado(estado);
			
			prueba = dao.agregarSesion_Aprendizaje(bean);
			
			respuesta = prueba == true ?   "1" : "0";
			
			System.out.println("respuesta: " + respuesta);
			System.out.println("Se realizo el Servlet REGISTRO DE SESION correctamente");
			response.setContentType("text/plain");
			response.getWriter().write(respuesta);
			response.sendRedirect("index.jsp");
		} catch(Exception e) {
			
			System.out.println("Error : "+e.getMessage());
			e.printStackTrace();
		}
	}
	
	private void archivoColegiado(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException{
		
		 
		boolean prueba = false;
		String respuesta = "0";
		
		String docente = request.getParameter("txtcodDocente");
		String fecha   = request.getParameter("fechainicio");
		String titulo  = request.getParameter("txttitulo");
		String area    = request.getParameter("area");
		String estado  = "No Revisado";
		System.out.println("datos:" + docente + "-" + fecha + "-" + titulo + "-" + area + "-" + estado);
		InputStream inputStream = null;
		
		Part filePart = request.getPart("archivo");
		if(filePart.getSize() > 0)
		{
			System.out.println(filePart.getName());
			System.out.println(filePart.getSize());
			System.out.println(filePart.getContentType());
			
			inputStream = filePart.getInputStream();
		}
		
		Trabajo_Colegiado bean = new Trabajo_Colegiado();
		
		try
		{
			TrabajoColegiadoJDBC dao = new TrabajoColegiadoJDBC();
			
			bean.setTitulo(titulo);
			bean.setArea(area);
			bean.setFecha(fecha);
			bean.setDocente(docente);
			bean.setArchivo(inputStream);
			bean.setEstado(estado);
			
			prueba = dao.agregar_TrabajoColegiado(bean);
			
			respuesta = prueba == true ?   "1" : "0";
			
			System.out.println("respuesta: " + respuesta);
			System.out.println("Se realizo el Servlet REGISTRO DE SESION correctamente");
			response.setContentType("text/plain");
			response.getWriter().write(respuesta);
			response.sendRedirect("index.jsp");
		} catch(Exception e) {
			
			System.out.println("Error : "+e.getMessage());
			e.printStackTrace();
		}
	
	}
	
	private void archivoDocente(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException{
		
		 
		boolean prueba = false;
		String respuesta = "0";
		
		String dni = request.getParameter("txtnumdoc");
		String nombre = request.getParameter("txtnom");
		String paterno = request.getParameter("txtpat");
		String materno = request.getParameter("txtmat");
		String area    = request.getParameter("area");
		String texto  = request.getParameter("texto");
		System.out.println("datos:" + dni + "-" + area + "-" + nombre + "-" + paterno + "-" + texto);
		InputStream inputStream = null;
		
		Part filePart = request.getPart("archivo");
		if(filePart.getSize() > 0)
		{
			System.out.println(filePart.getName());
			System.out.println(filePart.getSize());
			System.out.println(filePart.getContentType());
			
			inputStream = filePart.getInputStream();
		}
		
		InteraccionDocente bean = new InteraccionDocente();
		
		try
		{
			TrabajoColegiadoJDBC dao = new TrabajoColegiadoJDBC();
			
			bean.setDni(dni);
			bean.setNombre(nombre);
			bean.setPaterno(paterno);
			bean.setMaterno(materno);
			bean.setArea(area);
			bean.setObservacion(texto);
			bean.setArchivo(inputStream);
			
			prueba = dao.agregar_Interaccion(bean);
			
			respuesta = prueba == true ?   "1" : "0";
			
			System.out.println("respuesta: " + respuesta);
			System.out.println("Se realizo el Servlet REGISTRO DE SESION correctamente");
			response.setContentType("text/plain");
			response.getWriter().write(respuesta);
			response.sendRedirect("ModuloTrabajoColegiado/interaccionDocente.jsp");
		} catch(Exception e) {
			
			System.out.println("Error : "+e.getMessage());
			e.printStackTrace();
		}
	
	}

}
