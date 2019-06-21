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

import Beans.Trabajo_Colegiado;
import Jdbc.TrabajoColegiadoJDBC;


@WebServlet("/ArchivosColegiado")
@MultipartConfig(maxFileSize = 16177215)
public class ServletArchivoColegiado extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
     
    public ServletArchivoColegiado() {
        super();
         
    }
 
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 
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

}
