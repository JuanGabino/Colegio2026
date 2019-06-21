package Servlet;

import java.io.IOException;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Beans.Alumno;
import Jdbc.AlumnoJDBC;


@WebServlet("/ServletFicha")
public class ServletFicha extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    //public ServletFicha() {
    //    super();
        
    //}

	protected void service(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException 
	{
	
		String nombre = request.getParameter("txtcod");
		
		AlumnoJDBC dao = new AlumnoJDBC();
		Alumno bean = new Alumno();
		
		bean = dao.buscarAlumno(nombre);
		
		String idAlumno = bean.getIdAlumno();
		String nombres = bean.getNombre();
		String apellidopat = bean.getApellidoPat();
		String apellidoMat = bean.getApellidoMat();
		String fechaNac = bean.getFechaNac();
		String grado = bean.getDni();
		String seccion = bean.getSeccion();
		
		request.setAttribute("idAlumno", idAlumno);
		request.setAttribute("nombres", nombres);
		request.setAttribute("apellidopat", apellidopat);
		request.setAttribute("apellidoMat", apellidoMat);
		request.setAttribute("fechaNac", fechaNac);
		request.setAttribute("grado", grado);
		request.setAttribute("seccion", seccion);
		
		System.out.println("Se realizo el servletFicha" + "-" + nombre + "-" + apellidopat);
    	RequestDispatcher rd = request.getRequestDispatcher("fichaAlumno.jsp");
    	rd.forward(request, response);
	}

}
