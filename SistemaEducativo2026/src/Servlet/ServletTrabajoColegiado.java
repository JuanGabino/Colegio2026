package Servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Beans.ActividadesColegiado;
import Beans.InteraccionDocente;
import Jdbc.Sesion_AprendizajeJDBC;
import Jdbc.TrabajoColegiadoJDBC;
 
@WebServlet({"/ListarInteraccion", "/ListarActividades", "/ModificarEstadoColegiado"})
public class ServletTrabajoColegiado extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public ServletTrabajoColegiado() {
        super();
        
    }

 
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 
		try {
			switch (request.getServletPath()) { //jala el nombre del ervlet
			case "/ListarInteraccion":
				listarInteraccion(request, response);
				break;
			case "/ListarActividades":
				listarActividades(request, response);
				break;
			case "/ModificarEstadoColegiado":
				modificarEstadoColegiado(request, response);
				break;
		   } 
		}  catch (Exception e) {
			System.out.println("error :" + e.getMessage());
			e.printStackTrace();
		}


	}
	
	
	private void listarInteraccion(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException{
		
		StringBuilder sb = new StringBuilder("");
		List<InteraccionDocente> lista = new ArrayList<InteraccionDocente>();
		 
		
		try {
			
			TrabajoColegiadoJDBC dao = new TrabajoColegiadoJDBC();
			lista = dao.listarInteraccion();
			
			for(InteraccionDocente bean : lista) 
			{
				sb.append(bean.getId() + "|" + bean.getDni() + "|" + bean.getNombre() + "|" + bean.getPaterno() + "|" +  bean.getMaterno() + "|" +
							bean.getArea() + "|" + bean.getArchivo2() + "|" + bean.getObservacion() + "|" + "$");
			}
			
			System.out.println("lista : "+lista);
		} catch (Exception e) {
			
			
			System.out.println("Error : "+e.getMessage());
			e.printStackTrace();
		}
		
		
		response.setContentType("text/plain");
		response.getWriter().write(sb.toString());
		
	}
	
	private void listarActividades(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException{
		
		StringBuilder sb = new StringBuilder("");
		String area = request.getParameter("area");
		List<ActividadesColegiado> lista = new ArrayList<ActividadesColegiado>();
		 
		
		try {
			
			TrabajoColegiadoJDBC dao = new TrabajoColegiadoJDBC();
			lista = dao.listarActividades(area);
			
			for(ActividadesColegiado bean : lista) 
			{
				sb.append(bean.getCodigo() + "|" + bean.getDocente() + "|" + bean.getNombre() + "|" + bean.getPaterno() + "|" +  bean.getMaterno() + "|" +
							bean.getTitulo() + "|" + bean.getFecha() + "|" + bean.getArchivo2() + "|" + bean.getEstado() + "|" + "$");
			}
			
			System.out.println("lista : "+lista);
		} catch (Exception e) {
			
			
			System.out.println("Error : "+e.getMessage());
			e.printStackTrace();
		}
		
		
		response.setContentType("text/plain");
		response.getWriter().write(sb.toString());
		
	}
	
	private void modificarEstadoColegiado(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		boolean prueba = false;
		String respuesta = "0";

		String estado = request.getParameter("estado");
		String codigo = request.getParameter("codigo");
		
		try {
			
			TrabajoColegiadoJDBC dao = new TrabajoColegiadoJDBC();
			
			prueba = dao.modificarColegiado(codigo, estado);
			
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
