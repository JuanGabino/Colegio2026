package Servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Jdbc.CalificacionesJDBC;


@WebServlet({"/registrarCalificacionesp1","/registrarCalificacionesp2","/registrarCalificacionesp3",
	         "/registrarCalificacionest1","/registrarCalificacionest2","/registrarCalificacionest3",
	         "/registrarCalificacionesex1","/registrarCalificacionesex2", "/listarAlumnosCalificacionesxSeccion", 
	          "/listarAprobadosDesaprobados", "/notasPorAlumno"})
public class ServletCalificaciones extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try {
			
				switch (request.getServletPath()) 
				{
					case "/registrarCalificacionesp1":
						registrarCalificaciones(request, response);
						break;
					case "/registrarCalificacionesp2":
						registrarCalificacionesP2(request, response);
						break;
					case "/registrarCalificacionesp3":
						registrarCalificacionesP3(request, response);
						break;
					case "/registrarCalificacionest1":
						registrarCalificacionesT1(request, response);
						break;
					case "/registrarCalificacionest2":
						registrarCalificacionesT2(request, response);
						break;
					case "/registrarCalificacionest3":
						registrarCalificacionesT3(request, response);
						break;
					case "/registrarCalificacionesex1":
						registrarCalificacionesEx1(request, response);
						break;
					case "/registrarCalificacionesex2":
						registrarCalificacionesEx2(request, response);
						break;
					
					case "/listarAlumnosCalificacionesxSeccion":
						listarCalificaciones(request, response);
						break;
					case "/listarAprobadosDesaprobados":
						listarAprobados(request, response);
						break;
					case "/notasPorAlumno":
						notasporAlumno(request, response);
						
				}
			
		} catch (Exception e) {
			
			System.out.println("error :" + e.getMessage());
			e.printStackTrace();
			
		}
		
		
	}
	
	private void registrarCalificaciones(HttpServletRequest request, HttpServletResponse response) throws Exception{
		
		
		boolean prueba = false;
		String respuesta = "0";

		String idAlumno = request.getParameter("idAlum");
		String seccion  = request.getParameter("seccion");
		String idDocente = request.getParameter("docente");
		String curso    = request.getParameter("curso");
		int periodo =Integer.parseInt(request.getParameter("periodo"));
		int anio =Integer.parseInt(request.getParameter("anio"));
		
		int p1 =Integer.parseInt(request.getParameter("p1"));
		
		try {
			
			CalificacionesJDBC dao = new CalificacionesJDBC();
			
			prueba = dao.actualizarNotasP1(idAlumno, seccion, curso, periodo, anio, p1);
			
			respuesta = prueba == true ?   "1" : "0";
			System.out.println("respuesta: " + respuesta);
			System.out.println("Se realizo el Servlet correctamente");
			response.setContentType("text/plain");
			response.getWriter().write(respuesta);
	
		}catch(Exception e) 
		{
			System.out.println("Error : "+e.getMessage());
			e.printStackTrace();
		}
	}
	
	private void registrarCalificacionesP2(HttpServletRequest request, HttpServletResponse response) throws Exception{
		
		
			boolean prueba = false;
			String respuesta = "0";

			String idAlumno = request.getParameter("idAlum");
			String seccion  = request.getParameter("seccion");
			String idDocente = request.getParameter("docente");
			String curso    = request.getParameter("curso");
			int periodo =Integer.parseInt(request.getParameter("periodo"));
			int anio =Integer.parseInt(request.getParameter("anio"));
		
			int p2 =Integer.parseInt(request.getParameter("p2"));
		
			try {
			
				CalificacionesJDBC dao = new CalificacionesJDBC();
			
				prueba = dao.actualizarNotasP2(idAlumno, seccion, curso, periodo, anio, p2);
			
				respuesta = prueba == true ?   "1" : "0";
				System.out.println("respuesta: " + respuesta);
				System.out.println("Se realizo el Servlet correctamente");
				response.setContentType("text/plain");
				response.getWriter().write(respuesta);
	
			}catch(Exception e) 
			{
				System.out.println("Error : "+e.getMessage());
				e.printStackTrace();
			}
		}

private void registrarCalificacionesP3(HttpServletRequest request, HttpServletResponse response) throws Exception{
	
	
	boolean prueba = false;
	String respuesta = "0";

	String idAlumno = request.getParameter("idAlum");
	String seccion  = request.getParameter("seccion");
	String idDocente = request.getParameter("docente");
	String curso    = request.getParameter("curso");
	int periodo =Integer.parseInt(request.getParameter("periodo"));
	int anio =Integer.parseInt(request.getParameter("anio"));
	
	int p3 =Integer.parseInt(request.getParameter("p3"));
	
	try {
		
		CalificacionesJDBC dao = new CalificacionesJDBC();
		
		prueba = dao.actualizarNotasP3(idAlumno, seccion, curso, periodo, anio, p3);
		
		respuesta = prueba == true ?   "1" : "0";
		System.out.println("respuesta: " + respuesta);
		System.out.println("Se realizo el Servlet correctamente");
		response.setContentType("text/plain");
		response.getWriter().write(respuesta);

	}catch(Exception e) 
	{
		System.out.println("Error : "+e.getMessage());
		e.printStackTrace();
	}
}

private void registrarCalificacionesT1(HttpServletRequest request, HttpServletResponse response) throws Exception{
	
	
	boolean prueba = false;
	String respuesta = "0";

	String idAlumno = request.getParameter("idAlum");
	String seccion  = request.getParameter("seccion");
	String idDocente = request.getParameter("docente");
	String curso    = request.getParameter("curso");
	int periodo =Integer.parseInt(request.getParameter("periodo"));
	int anio =Integer.parseInt(request.getParameter("anio"));
	
	int t1 =Integer.parseInt(request.getParameter("t1"));
	
	try {
		
		CalificacionesJDBC dao = new CalificacionesJDBC();
		
		prueba = dao.actualizarNotasT1(idAlumno, seccion, curso, periodo, anio, t1);
		
		respuesta = prueba == true ?   "1" : "0";
		System.out.println("respuesta: " + respuesta);
		System.out.println("Se realizo el Servlet correctamente");
		response.setContentType("text/plain");
		response.getWriter().write(respuesta);

	}catch(Exception e) 
	{
		System.out.println("Error : "+e.getMessage());
		e.printStackTrace();
	}
}

private void registrarCalificacionesT2(HttpServletRequest request, HttpServletResponse response) throws Exception{
	
	
	boolean prueba = false;
	String respuesta = "0";

	String idAlumno = request.getParameter("idAlum");
	String seccion  = request.getParameter("seccion");
	String idDocente = request.getParameter("docente");
	String curso    = request.getParameter("curso");
	int periodo =Integer.parseInt(request.getParameter("periodo"));
	int anio =Integer.parseInt(request.getParameter("anio"));
	
	int t2 = Integer.parseInt(request.getParameter("t2"));
	
	try {
		
		CalificacionesJDBC dao = new CalificacionesJDBC();
		
		prueba = dao.actualizarNotasT2(idAlumno, seccion, curso, periodo, anio, t2);
		
		respuesta = prueba == true ?   "1" : "0";
		System.out.println("respuesta: " + respuesta);
		System.out.println("Se realizo el Servlet correctamente");
		response.setContentType("text/plain");
		response.getWriter().write(respuesta);

	}catch(Exception e) 
	{
		System.out.println("Error : "+e.getMessage());
		e.printStackTrace();
	}
}

private void registrarCalificacionesT3(HttpServletRequest request, HttpServletResponse response) throws Exception{
	
	
	boolean prueba = false;
	String respuesta = "0";

	String idAlumno = request.getParameter("idAlum");
	String seccion  = request.getParameter("seccion");
	String idDocente = request.getParameter("docente");
	String curso    = request.getParameter("curso");
	int periodo =Integer.parseInt(request.getParameter("periodo"));
	int anio =Integer.parseInt(request.getParameter("anio"));
	
	int t3 =Integer.parseInt(request.getParameter("t3"));
	
	try {
		
		CalificacionesJDBC dao = new CalificacionesJDBC();
		
		prueba = dao.actualizarNotasT3(idAlumno, seccion, curso, periodo, anio, t3);
		
		respuesta = prueba == true ?   "1" : "0";
		System.out.println("respuesta: " + respuesta);
		System.out.println("Se realizo el Servlet correctamente");
		response.setContentType("text/plain");
		response.getWriter().write(respuesta);

	}catch(Exception e) 
	{
		System.out.println("Error : "+e.getMessage());
		e.printStackTrace();
	}
}

private void registrarCalificacionesEx1(HttpServletRequest request, HttpServletResponse response) throws Exception{
	
	
	boolean prueba = false;
	String respuesta = "0";

	String idAlumno = request.getParameter("idAlum");
	String seccion  = request.getParameter("seccion");
	String idDocente = request.getParameter("docente");
	String curso    = request.getParameter("curso");
	int periodo =Integer.parseInt(request.getParameter("periodo"));
	int anio =Integer.parseInt(request.getParameter("anio"));
	
	int ex1 =Integer.parseInt(request.getParameter("ex1"));
	
	try {
		
		CalificacionesJDBC dao = new CalificacionesJDBC();
		
		prueba = dao.actualizarNotasEX1(idAlumno, seccion, curso, periodo, anio, ex1);
		
		respuesta = prueba == true ?   "1" : "0";
		System.out.println("respuesta: " + respuesta);
		System.out.println("Se realizo el Servlet correctamente");
		response.setContentType("text/plain");
		response.getWriter().write(respuesta);

	}catch(Exception e) 
	{
		System.out.println("Error : "+e.getMessage());
		e.printStackTrace();
	}
}

private void registrarCalificacionesEx2(HttpServletRequest request, HttpServletResponse response) throws Exception{
	
	
	boolean prueba = false;
	String respuesta = "0";

	String idAlumno = request.getParameter("idAlum");
	String seccion  = request.getParameter("seccion");
	String idDocente = request.getParameter("docente");
	String curso    = request.getParameter("curso");
	int periodo =Integer.parseInt(request.getParameter("periodo"));
	int anio =Integer.parseInt(request.getParameter("anio"));
	
	int ex2 =Integer.parseInt(request.getParameter("ex2"));
	
	try {
		
		CalificacionesJDBC dao = new CalificacionesJDBC();
		
		prueba = dao.actualizarNotasEX2(idAlumno, seccion, curso, periodo, anio, ex2);
		
		respuesta = prueba == true ?   "1" : "0";
		System.out.println("respuesta: " + respuesta);
		System.out.println("Se realizo el Servlet correctamente");
		response.setContentType("text/plain");
		response.getWriter().write(respuesta);

	}catch(Exception e) 
	{
		System.out.println("Error : "+e.getMessage());
		e.printStackTrace();
	}
}


	
	private void listarCalificaciones(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
			String curso= request.getParameter("curso");
			String seccion = request.getParameter("seccion");
			int periodo = Integer.parseInt(request.getParameter("periodo"));
			int anio    = Integer.parseInt(request.getParameter("anio"));
			
			StringBuilder sb = new StringBuilder("");
			
			try {
				
				CalificacionesJDBC dao = new CalificacionesJDBC();
				sb = dao.listarCalificaciones(seccion, curso, periodo, anio);
				
			} catch (Exception e) {
				
				e.printStackTrace();
			}
		
			response.setContentType("text/plain");
			response.getWriter().write(sb.toString());
		
	}
	
	private void listarAprobados(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String curso   = request.getParameter("curso");
		String seccion = request.getParameter("seccion");
		int    periodo = Integer.parseInt(request.getParameter("periodo"));
		int    anio    = Integer.parseInt(request.getParameter("anio"));
		
		StringBuilder sb = new StringBuilder("");
		
		try {
			
			CalificacionesJDBC dao = new CalificacionesJDBC();
			sb = dao.listarAprobadoDesaprobados(seccion, curso, periodo, anio);
			
		} catch (Exception e) {
			
			e.printStackTrace();
		}
	
		response.setContentType("text/plain");
		response.getWriter().write(sb.toString());
	
	}
	
	private void notasporAlumno(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String curso   = request.getParameter("curso");
		String seccion = request.getParameter("seccion");
		int    periodo = Integer.parseInt(request.getParameter("periodo"));
		int    anio    = Integer.parseInt(request.getParameter("anio"));
		String id      = request.getParameter("idAlumno");
		
		StringBuilder sb = new StringBuilder("");
		
		try {
			
			CalificacionesJDBC dao = new CalificacionesJDBC();
			sb = dao.graficoNotasAlumno(seccion, curso, periodo, anio, id);
			
		} catch (Exception e) {
			
			e.printStackTrace();
		}
	
		response.setContentType("text/plain");
		response.getWriter().write(sb.toString());
	
	}

}
