package Servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.util.ArrayList;
import java.util.List;

import Beans.Seccion;
import Jdbc.SeccionJDBC;


@WebServlet({"/ListarSeccionDocente", "/ListarSeccion", "/ContarSecciones", "/ListarSeccionxCurso"})
public class ServletSeccion extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public ServletSeccion() {
        super();
        
    }

	
	protected void service(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		  
		try {
			switch (request.getServletPath()) {
			case "/ListarSeccionDocente":
				listarSeccionDocente(request, response);
				break;
			case "/ListarSeccion":
				listarSeccion(request, response);
				break;
			case "/ContarSecciones":
				contarSecciones(request, response);
				break;
			case "/ListarSeccionxCurso":
				listarSeccionxCurso(request, response);
		   } 
		}  catch (Exception e) {
			System.out.println("error :" + e.getMessage());
			e.printStackTrace();
		}
		
		
	}
	
	private void listarSeccionDocente(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
			String dni = request.getParameter("dni");
			List<Seccion> lista = new ArrayList<Seccion>();
			StringBuilder sb = new StringBuilder("");
			
			
			try{
				
				
				SeccionJDBC dao = new SeccionJDBC();
				lista = dao.listarSeccion(dni);
				
				for(Seccion bean : lista){
					
					sb.append(bean.getIdSeccion() + "-" + bean.getGrado() + ":");
					
					System.out.println(bean.getIdSeccion() + "-" + bean.getGrado() + ":");
				}
				
				
			}catch(Exception e){
				System.out.println("No se realizo Lista");
				e.printStackTrace();

			}
			response.setContentType("text/plain");
			response.getWriter().write(sb.toString());
	}

	private void listarSeccion(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		List<Seccion> lista = new ArrayList<Seccion>();
		StringBuilder sb = new StringBuilder("");

		try {
			SeccionJDBC dao = new SeccionJDBC();
			lista = dao.listarSeccionColegio();

			for (Seccion bean : lista) {
				sb.append(bean.getIdSeccion() + "/" + bean.getGrado() +  ":");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		response.setContentType("text/plain");
		response.getWriter().write(sb.toString());
	}
	
	private void contarSecciones(HttpServletRequest request, HttpServletResponse response) throws Exception {

		String seccion = request.getParameter("seccion");
		String respuesta = "";
		
		StringBuilder sb = new StringBuilder("");
		
		try {
			
			SeccionJDBC dao = new SeccionJDBC();
			sb = dao.cantidadxSeccion(seccion);
			
			if(sb.toString().equals("0"))
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
	
	private void listarSeccionxCurso(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
			String dni   = request.getParameter("dni");
			String curso = request.getParameter("curso");
			List<Seccion> lista = new ArrayList<Seccion>();
			StringBuilder sb = new StringBuilder("");
			
			
			try{
				
				SeccionJDBC dao = new SeccionJDBC();
				lista = dao.listarSeccionxCurso(dni, curso);
				
				for(Seccion bean : lista){
					
					sb.append(bean.getIdSeccion() + "-" + bean.getGrado() + ":");
					
					System.out.println(bean.getIdSeccion() + "-" + bean.getGrado() + ":");
				}
				
				
			}catch(Exception e){
				System.out.println("Error : "+e.getMessage());
				e.printStackTrace();
			}
			response.setContentType("text/plain");
			response.getWriter().write(sb.toString());
	}

}
